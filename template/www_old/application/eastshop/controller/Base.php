<?php
namespace app\eastshop\controller;
use think\Controller;
use app\common\RBAC;
use think\Db;
use think\Url;
use think\Session;

class Base extends Controller{

    protected $uploadurl;//上传图片访问路径
    public function _initialize(){
        $state = getParameterByRedirect('state');
        $session_id = explode('-', $state)[1];
        Session::init([
            'id' => $session_id,
            'prefix'         => 'think',
            'type'           => '',
            'auto_start'     => true,
        ]);
        $this->uploadurl = config("UPLOADIMG_URL");
    }
    public function getuserid(){
        $user_id = session('user_id');
        if (empty($user_id)){
            $miniuser = getParameterByRedirect('miniuser');
            $user_id = explode('-', $miniuser)[1];
            session('user_id',$user_id);
        }
        return $user_id;
    }
    //获取轮播图
    public function getCarousellist(){

        $map['is_delete'] = array('eq','0');
        $map['pictureattr_id'] = array('eq','carousel');
        $map['tablename'] = array('eq','carousel');
        $fields = 'id,title,picture,secondtitle';

        $list = db('pictures')->where($map)->field($fields)->order('sort,createtime desc')->select();
        foreach ($list as $k1 => $v1) {
            $list[$k1]['picture'] = $this->uploadurl.$v1['picture'];
        }
        return $list;
    }
    //获取首页展示的商品分类
    public function getProductCatlist($map){
        if (empty($map['is_delete'])) $map['is_delete'] = 0;
        
        $fields = 'id,name,icon,sort,note';
        $list = db('product_cat')->where($map)->field($fields)->order('sort,createtime desc')->select();
        foreach ($list as $k1 => $v1) {
            $list[$k1]['icon'] = $this->uploadurl.$v1['icon'];
        }
        return $list;
    }
    //获得会员信息
    public function getUserlist($map=[],$fields='',$order='createtime desc',$count=10){
        if (empty($fields)) $fields = 'id,account,nickname,userlevel_id';
        if (empty($map['is_delete'])) $map['is_delete'] = 0;
        // $map["account"] = array('neq','admin');
        $map['usertype_id'] = array('eq','member');

        $list = db('user')->where($map)->field($fields)->order($order)->limit($count)->select();
        $ulmodel = db('userlevel');
        foreach ($list as $key => $value) {
            $list[$key]['userlevel'] = $ulmodel->where('id',$value['userlevel_id'])->field('id,name')->find();
        }
        return $list;
    }
    //获取商品信息
    /*
    * map
    * isOnlyThumbpicture 是否只查询缩略图
    * isNeedSales 是否查询销量
    * fields
    * order
    * count
    */
    public function getProductlist($map=[],$isOnlyThumbpicture=false,$isNeedSales=false,$fields='',$order='createtime desc',$count=10,$page=0){
        if (empty($fields)) {
            if (empty($map['id'])) {
                $fields = 'id,name,price,original_price,share_commission,intro,specification,stock,freight';
            }else{
                $fields = 'id,name,price,original_price,share_commission,intro,specification,stock,freight,detail';
            }
        }
        if (empty($map['is_delete'])) $map['is_delete'] = 0;
        if (empty($map['status'])) $map['status'] = 2;
        $user_id = $this->getuserid();

        if ($page == 0 || $page == undefined){
            $list = db('product')->where($map)->field($fields)->order($order)->limit($count)->select();
        }else{
            $list = db('product')->where($map)->field($fields)->order($order)->page($page,$count)->select();
        }
        foreach ($list as $k1 => $v1) {
            $list[$k1]['rebate'] = floatval($v1['price']) * floatval($v1['share_commission']) / 100;
            $thumbpicturemap = [
                'tablename' => 'product',
                'objectprimarykey' => $v1['id'],
                'is_delete' => 0,
                'pictureattr_id' => array('eq','thumbpicture')
            ];
            $list[$k1]['thumbpicture'] = $this->getPicturelist($thumbpicturemap);
            //除去缩略图的图片
            if (!$isOnlyThumbpicture) {
                $picturemap = [
                    'tablename' => 'product',
                    'objectprimarykey' => $v1['id'],
                    'is_delete' => 0,
                    'pictureattr_id' => array('neq','thumbpicture')
                ];
                $list[$k1]['picturelist'] = $this->getPicturelist($picturemap);
            }
            //商品销量
            if($isNeedSales){
                $list[$k1]['saleNumber'] = $this->getCommditySaleNumber($v1['id']);
            }
            //商品是否被收藏
            $enshrinemap = [
                'product_id' => $v1['id'],
                'user_id' => $user_id,
                'is_delete' => 0,
            ];
            $ifEnshrine = db('product_enshrine')->where($enshrinemap)->count('id');
            if ($ifEnshrine) {
                $list[$k1]['ifEnshrine'] = 1;
            }else{
                $list[$k1]['ifEnshrine'] = 0;
            }
        }
        if (!empty($map['id'])) {
            $list = $list[0];
        }
        return $list;
    }
    //获取销量
    public function getCommditySaleNumber($id){
        $number = db('orderdetail')->where(['product_id'=>$id,'is_delete'=>0])->sum('productNum');
        if (empty($number)) {
            $number = 0;
        }
        return $number;
    }
    //获取图片库图片
    public function getPicturelist($map=[],$fields='',$order='createtime desc',$count=10){
        if (empty($fields)) $fields = 'id,title,secondtitle,picture,pictureattr_id';
        if (empty($map['is_delete'])) $map['is_delete'] = 0;
        $picturemodel = db('pictures');

        if (!empty($map['pictureattr_id']) && strcmp($map['pictureattr_id'][1], 'thumbpicture') === 0 && strcmp($map['pictureattr_id'][0], 'eq') === 0) {
            $list = $picturemodel->where($map)->field($fields)->find();
            if (!empty($list['picture'])) {
                $list['picture'] = $this->uploadurl.$list['picture'];
            }
        }else{
            $list = $picturemodel->where($map)->field($fields)->order('sort')->limit($count)->select();
            foreach ($list as $k1 => $v1) {
                if (!empty($v1['picture'])) {
                    $list[$k1]['picture'] = $this->uploadurl.$v1['picture'];
                }
                
            }
        }
        return $list;
    }
    //获取省市区列表
    public function getDistrictArr(){
        $model = db('district');
        $list = $model->where('level','province')->order('id')->select();
        foreach ($list as $k1 => $v1) {
            $list[$k1]['list'] = $model->where('parent_id',$v1['id'])->where('level','city')->order('id')->select();
            foreach ($list[$k1]['list'] as $k2 => $v2) {
                $list[$k1]['list'][$k2]['list'] = $model->where('parent_id',$v2['id'])->where('level','district')->order('id')->select();
            }
        }

        cache('districtArr',$list);
        return $list;
    }
    //计算一个订单的佣金
    public function getOrderCommissionByOrderId($order_id){
        $orderdetail_map = [
            'order_id' => $order_id,
            'is_delete' => 0
        ];
        $orderdetail = model('orderdetail')->where($orderdetail_map)->field('id,order_id,product_id,productNum')->select();
        $total_commission = 0;
        foreach ($orderdetail as $k1 => $v1) {
            $commission[$k1] = floatval($v1->product->price) * floatval($v1->product->share_commission) / 100 * floatval($v1->productNum);
            $total_commission += $commission[$k1];
        }
        unset($commission);
        return $total_commission;
    }

    //购买商品 - 支付成功回调函数
    public function pay_result(){
        $user_id = $this->getuserid();
        $order_type = getParameterByRedirect('order_type');
        $order_id = getParameterByRedirect('order_id');
        $order = db('order');
        $user = db('user');
        $stock = db('stock');

        $order_data = [
            'updateuser_id' => $user_id,
            'updatetime' => time(),
            'paytime' => time(),
            'status' => 2
        ];
        //获取订单信息
        $orderinfo = $order->where('id',$order_id)->field('id,user_id,product_price,price,commission_used,dividend_used,manual_integral_used')->find();
        //当前订单可获得股票的金额
        $total_stock_price = floatval($orderinfo['price']) + floatval($orderinfo['commission_used']) + floatval($orderinfo['dividend_used']);
        // var_dump($total_stock_price);die;
        $order_total_stock_number = round($total_stock_price / 100);
        //获取A轮股票派发情况
        $stockinfo_A = $stock->where('id','1')->field('id,name,number,used_number')->find();
        //获取D轮股票派发情况
        $stockinfo_D = $stock->where('id','4')->field('id,name,number,used_number,switch_btn')->find();
        // 启动事务
        \think\Db::startTrans();
        $tablePrefix = config("database.prefix");
        $msg = [];
        try{   
            //执行订单支付成功回调处理订单状态
            $msg['order'] = $order->where('id',$order_id)->data($order_data)->update();
            //减去对应商品库存
            $order_products = db('orderdetail')->where(['is_delete'=>0,'order_id'=>$order_id])->field('id,product_id,productNum')->select();
            $productmodel = db('product');
            foreach ($order_products as $k10 => $v10) {
                $old_product_info = $productmodel->where(['id'=>$v10['product_id']])->field('id,stock')->find();
                $new_stock = $old_product_info['stock'] - $v10['productNum'];
                $msg['stock'][$k10] = $productmodel->where(['id'=>$v10['product_id']])->data(['stock'=>$new_stock])->update();
            }
            //存在上级 -- 计算分销佣金
            $userinfo = $user->where('id',$user_id)->field('id,parent_id')->find();
            if (!empty($userinfo['parent_id']) && $userinfo['parent_id'] != 0) {
                //计算一个订单可获得的总佣金
                $order_total_commission = $this->getOrderCommissionByOrderId($order_id);
                //获得上级用户信息
                $parent_userinfo = $user->where('id',$userinfo['parent_id'])->field('id,commission')->find();
                $new_parent_commission = floatval($parent_userinfo['commission']) + floatval($order_total_commission);
                //变更上级用户佣金
                $parent_user_data = [
                    'updateuser_id' => $user_id,
                    'updatetime' => time(),
                    'commission' => $new_parent_commission,
                ];
                $msg['parent_user'] = $user->where('id',$parent_userinfo['id'])->data($parent_user_data)->update();
                //添加佣金记录
                $commission_detail_data = [
                    'user_id' => $parent_userinfo['id'],
                    'commission' => $order_total_commission,
                    'createtime' => time(),
                    'status' => 1
                ];
                $msg['commission_record'] = db('commission_record')->insert($commission_detail_data);

            }
            //A轮分红股有剩余，赠送,A轮无剩余，且D轮开启则赠送D轮
            $stockinfo_A_residue = $stockinfo_A['number'] - $stockinfo_A['used_number'];
            if ( $stockinfo_A_residue > 0) {
                if ($stockinfo_A_residue >= $order_total_stock_number) {
                    $msg['user_stock_A'] = $this->setUserStock($stockinfo_A['id'],$stockinfo_A['used_number'],$user_id,$order_total_stock_number);//赠送股票 - A轮
                }else{
                    $new_order_total_stock_number_A = $stockinfo_A_residue;
                    $msg['user_stock_A'] = $this->setUserStock($stockinfo_A['id'],$stockinfo_A['used_number'],$user_id,$new_order_total_stock_number_A);//赠送股票 - A轮
                    if ($stockinfo_D['switch_btn'] == 2) {
                        $new_order_total_stock_number_D = intval($order_total_stock_number) - intval($stockinfo_A_residue);
                        $msg['user_stock_D'] = $this->setUserStock($stockinfo_D['id'],$stockinfo_D['used_number'],$user_id,$new_order_total_stock_number_D);//赠送股票 - D轮
                    }
                }
            }else{
                //A轮送完，D轮开启状态下送D轮
                $stockinfo_D_residue = $stockinfo_D['number'] - $stockinfo_D['used_number'];
                if ($stockinfo_D['switch_btn'] == 2 && $stockinfo_D_residue > 0 ) {
                    if ($stockinfo_D_residue >= $order_total_stock_number) {
                        $msg['user_stock_D'] = $this->setUserStock($stockinfo_D['id'],$stockinfo_D['used_number'],$user_id,$order_total_stock_number);//赠送股票 - D轮
                    }else{
                        $new_order_total_stock_number_D = $order_total_stock_number - $stockinfo_D_residue;
                        $msg['user_stock_D'] = $this->setUserStock($stockinfo_D['id'],$stockinfo_D['used_number'],$user_id,$new_order_total_stock_number_D);//赠送股票 - D轮
                    }
                }
            }
            $apiRes = [
                'code' => 0,
                'data' => $msg,
                'msg' => '支付成功'
            ];
            // 提交事务
            \think\Db::commit();
        } catch (\Exception $e) {
            // $apiRes = [
            //     'code' => 1,
            //     'data' => $msg,
            //     'msg' => '系统繁忙'
            // ];
            // 回滚事务
            \think\Db::rollback();
        }
        apiResponse($apiRes);
    }
    //赠送股票
    public function setUserStock($stock_id,$stock_used,$user_id,$number){
        $stockinfo = db('stock')->where('id',$stock_id)->field('id,name,number,used_number,switch_btn')->find();
        $old_map = [
            'stock_id' => $stock_id,
            'user_id' => $user_id,
            'is_delete' => 0
        ];
        if ($number > $stockinfo['number'] - $stockinfo['used_number']) {
            $number = $stockinfo['number'] - $stockinfo['used_number'];
        }
        $old_user_stock = db('stock_user')->where($old_map)->find();
        if (empty($old_user_stock)) {
            //没有，新增
            $data = [
                'stock_id' => $stock_id,
                'user_id' => $user_id,
                'number' => $number,
                'createtime' => time(),
                'status' => 1
            ];
            $msg['stock_user'] = db('stock_user')->data($data)->insert();
            $new_stock_used = intval($stock_used) + intval($number);
            $stock_data = [
                'used_number' => $new_stock_used,
                'updateuser_id' => $user_id,
                'updatetime' => time(),
            ];
            $msg['stock'] = db('stock')->where('id',$stock_id)->data($stock_data)->update();
        }else{
            $new_number = intval($number) + intval($old_user_stock['number']);
            $data = [
                'number' => $new_number,
                'updatetime' => time(),
                'updateuser_id' => $user_id,
            ];
            $msg['stock_user'] = db('stock_user')->where('id',$old_user_stock['id'])->data($data)->update();
            // fdbg($msg['stock_user']);
            $new_stock_used = intval($stock_used) + intval($number);
            $stock_data = [
                'used_number' => $new_stock_used,
                'updateuser_id' => $user_id,
                'updatetime' => time(),
            ];
            $msg['stock'] = db('stock')->where('id',$stock_id)->data($stock_data)->update();
        }
        // fdbg($msg);
        return $msg;
    }
    //微信支付
    public function pay($data){
        $miniProgramInfo = db('miniprogram_parameter')->where('is_delete','0')->field('id,appid,appsecret,mch_id,mch_password,mch_key')->find();
        $unifiedorderRes = $this->unifiedorder($data['price'],$data['body'],$data['order_no'],$data['openid'],$miniProgramInfo);

        $payParams = [
            'appId' => $miniProgramInfo['appid'],
            'timeStamp' => (string)time(),
            'nonceStr' => (string)mt_rand(10000000,99999999),
            'package' => "prepay_id=".$unifiedorderRes['prepay_id'],
            'signType' => 'MD5',
        ];
        ksort($payParams);
        $string2 = '';
        foreach($payParams as $key => $v) {
            if (empty($v)) {
                continue;
            }
            $string2 .= "{$key}={$v}&";
        }
        $string2 .= "key={$miniProgramInfo['mch_key']}";
        $payParams['paySign'] = strtoupper(md5($string2));

        return $payParams;
    }
    //微信支付 -- 统一下单
    public function unifiedorder($price,$body,$order_no,$openid,$miniProgramInfo){
        
        $url = 'https://api.mch.weixin.qq.com/pay/unifiedorder';
        $ip = get_client_ip();
        $notify_url = 'http://shop.changzhenlong.com/index.php/eastshop/ApiEntrance/notify';

        $params = [
            'appid' => $miniProgramInfo['appid'],
            'mch_id' => $miniProgramInfo['mch_id'],
            'nonce_str' => (string)mt_rand(10000000,99999999),
            'body' => $body,
            'out_trade_no' => $order_no,
            'total_fee' => floatval($price) * floatval(100),
            'openid' => $openid,
            'spbill_create_ip' => $ip,
            'notify_url' => $notify_url,
            'trade_type' => 'JSAPI',
        ];
        ksort($params);
        $string1 = '';
        foreach($params as $key => $v) {
            if (empty($v)) {
                continue;
            }
            $string1 .= "{$key}={$v}&";
        }
        $string1 .= "key={$miniProgramInfo['mch_key']}";
        $params['sign'] = strtoupper(md5($string1));
        $params = array2xml($params);
        $apiRes = _http_wechat_pay($url,$params,'POST');
        $apiRes = xml2array($apiRes);

        return $apiRes;
    }
    //生成订单编号
    public function getOrderNo(){

        $orderNo = date('Y',time()).time().mt_rand(1000,9999);

        return $orderNo;
    }
    //获取手机验证码
    public function getcaptcha(){

        $mobile = getParameterByRedirect('mobile');
        $actiontype = getParameterByRedirect('actiontype');

        if (strcmp('register',$actiontype) === 0) {
            $userinfo = db('user')->where(['mobile'=>$mobile])->field('id,mobile')->find();
            if (!empty($userinfo)) {
                $apiRes = [
                    'code' => 1,
                    'data' => $code,
                    'msg' => '手机号已存在'
                ];
                apiResponse($apiRes);exit();
            }
        }
        // $code = 1;
        $code = rand(100000,999999);
        $result = $this->sendcaptchaSms($mobile,$code);

        $apiRes = [
            'code' => 0,
            'data' => $code,
            'msg' => '验证码已发送，请注意查收！'
        ];
        apiResponse($apiRes);
    }

    public function sendcaptchaSms($phone,$code){

        header("Content-type: text/html; charset=utf-8");
        date_default_timezone_set('PRC'); //设置默认时区为北京时间
        //短信接口用户名 $uid
        // $uid = 'XAJS007168';
        $uid = 'XAJS008113';
        $passwd = 'so8113';

        $message = "此次操作验证码：".$code."，如非本人操作，请忽略！";
        $msg = rawurlencode(mb_convert_encoding($message, "gb2312", "utf-8"));
        $gateway = "https://sdk2.028lk.com/sdk2/BatchSend2.aspx?CorpID={$uid}&Pwd={$passwd}&Mobile={$phone}&Content={$msg}&Cell=&SendTime=";
        
        $result = file_get_contents($gateway);

        return $result;
    }


    //用户第一次使用推广二维码，需要从微信服务器获取
    public function getQrcodeFirstFromWechat($user_id){
        $scene = "parent_id/".$user_id;
        $width = 440;
        $page = 'pages/index/index';
        $qrcodeinfo = $this->getQrcode($scene, $width, $page,$type = null);

        if ($qrcodeinfo['code'] == 0) {
            $save_name = $qrcodeinfo['save_name'];
            $data = [
                'invitation_qrcode' => $save_name,
                'updateuser_id' => session('uid'),
                'updatetime' => time(),
            ];
            $res = db('user')->where('id',$user_id)->data($data)->update();
            if ($res) {
                $promoteQrcode = $save_name;
            }else{
                $promoteQrcode = '存储二维码失败';
            }
        }else{
            $promoteQrcode = '请求二维码失败';
        }
        return $promoteQrcode;
    }
    //获取微信接口的accessToken
    public function getAccessToken(){
        $miniProgramParameter = db('miniprogram_parameter')->where(['is_delete'=>0])->field('id,appid,appsecret')->find();
        $appid = $miniProgramParameter['appid'];
        $appsecret = $miniProgramParameter['appsecret'];

        require_once APP_PATH.'common/Wechat/TPWechat.php';
        $options = array();
        $wechatclient = new \TPWechat($options);//创建微信开发实例对象
        $access_token = $wechatclient->checkAuth($appid,$appsecret);
        if(!$access_token){
            $access_token = $wechatclient->errMsg;
        }
        return $access_token;
    }
    //获取二维码
    public function getQrcode($scene, $width = 430, $page = null,$type = null){
        
        $access_token = $this->getAccessToken();
        if (!$access_token) {
            return [
                'code' => 1,
                'msg' => $access_token,
            ];
        }
        $api = "https://api.weixin.qq.com/wxa/getwxacodeunlimit?access_token={$access_token}";
        $params = [
            'scene' => $scene,
            'width' => $width,
            'is_hyaline' => true,
        ];
        if ($page) {
            $params['page'] = $page;
        }
        $apiResult = $this->_http($api,$params,'POST');
        $apiResult_code = json_decode($apiResult);
        if ($apiResult_code || $apiResult_code->errcode) {
            return [
                'code' => 1,
                'msg' => '获取二维码失败',
            ];
        }else{
            return [
                'code' => 0,
                'save_name' => $this->saveTempImageByContent($apiResult,$type=null),
            ];
        }
    }
    //保存图片内容文件
    private function saveTempImageByContent($content,$type = null){

        $root_path = config('QRCODE_DIR');
        $save_name = md5(base64_encode($content)) . '.png';
        $save_path = $root_path.$save_name;

        $res = file_put_contents($save_path,$content);
        if (!$res) {
            return [
                'code' => 1,
                'msg' => '写入二维码失败',
            ];
        }
        return $save_name;
    }
    function _http($url,$params,$method = 'GET', $multi = false){
        $opts = array(
            CURLOPT_TIMEOUT        => 30,
            CURLOPT_RETURNTRANSFER => 1,
            CURLOPT_SSL_VERIFYPEER => false,
            CURLOPT_SSL_VERIFYHOST => false
        );
        $url = str_replace(' ','+',$url);
        /* 根据请求类型设置特定参数 */
        switch(strtoupper($method)){
            case 'GET':
                // $opts[CURLOPT_URL] = $url . '?' . http_build_query($params);
                $opts[CURLOPT_URL] = $url;
                break;
            case 'POST':
                //判断是否传输文件
                // $params = $multi ? $params : http_build_query($params);
                $params = json_encode($params);
                $opts[CURLOPT_URL] = $url;
                $opts[CURLOPT_POST] = 1;
                $opts[CURLOPT_POSTFIELDS] = $params;
                break;
            default:
                throw new Exception('不支持的请求方式！');
        }
        /* 初始化并执行curl请求 */
        $ch = curl_init();
        curl_setopt_array($ch, $opts);
        $data  = curl_exec($ch);
        $error = curl_error($ch);
        curl_close($ch);
        if($error) {
            return false;
        }
        return  $data;
    }

}