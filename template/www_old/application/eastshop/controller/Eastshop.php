<?php
namespace app\eastshop\controller;
use app\eastshop\controller\Base;
use app\eastshop\controller\Personal;
use think\Controller;
use app\common\RBAC;
use think\Db;
use think\Url;
use think\Session;
class Eastshop extends Base{
    public $rewardMoney;        #红包金额、单位元
    public $rewardNum;          #红包数量
    public function _initialize(){
        parent::_initialize();
    }
    //首页接口
    public function index(){

        $user_id = $this->getuserid();
        //轮播图
        $carousel = $this->getCarousellist();
        //分类导航
        $productCatmap = ['status' => 2];
        $productCat = $this->getProductCatlist($productCatmap);
        //获取新增加的会员
        $newMember = $this->getUserlist();
        //获取商品 -- 新品上架
        $productmap = ['attr_id' => 1];
        $newProduct = $this->getProductlist($productmap,$isOnlyThumbpicture=true,$isNeedSales=false,$fields='',$order='sort',$count=3);
        //获取商品 -- TOP热销
        $hotsellmap = ['attr_id' => 2];
        $hotsell = $this->getProductlist($hotsellmap,$isOnlyThumbpicture=true,$isNeedSales=false,$fields='',$order='sort',$count=3);
        //获取商品 -- 精选商品
        $featuredmap = ['attr_id' => 3];
        $featured = $this->getProductlist($featuredmap,$isOnlyThumbpicture=true,$isNeedSales=false,$fields='',$order='sort',$count=30);
        //会员升级套餐图标
        $memberUpgrade = db('member_upgrade_cat')->field('id,icon')->select();
        foreach ($memberUpgrade as $km => $vm) {
            $memberUpgrade[$km]['icon'] = $this->uploadurl.$vm['icon'];
        }

        $user_fields = 'id,account,realname,nickname,openid,avatar_url,mobile,usertype_id,userlevel_id';
        $userinfo = db('user')->where('id',$user_id)->field($user_fields)->find();

        // $newMemberOpen = 1;
        $other_parameter = db('other_parameter')->where('is_delete','0')->field('id,switch_member')->find();
        $newMemberOpen = $other_parameter['switch_member'];
        $data = [
            'carousel' => $carousel,
            'productCat' => $productCat,
            'newMember' => $newMember,
            'newProduct' => $newProduct,
            'hotsell' => $hotsell,
            'featured' => $featured,
            'userinfo' => $userinfo,
            'memberUpgrade' => $memberUpgrade,
            'newMemberOpen' => $newMemberOpen,
        ];
        $apiRes = [
            'code' => 0,
            'data' => $data,
            'msg' => 'success'
        ];
        apiResponse($apiRes);
    }
    //设置用户信息
    public function setuserinfo(){
        $user_id = $this->getuserid();
        $realname = getParameterByRedirect('realname');
        $phoneNo = getParameterByRedirect('phoneNo');
        $invitationCode = getParameterByRedirect('invitationCode');
        $parent_id = getParameterByRedirect('parent_id');
        $usermodel = db('user');

        $userinfo = $usermodel->where('id',$user_id)->field('id,parent_id')->find();
        $user_data = [
            'realname' => $realname,
            'mobile' => $phoneNo,
            'updateuser_id' => $user_id,
            'updatetime' => time(),
        ];
        if (!empty($invitationCode)) {
            $parent_user = $usermodel->where('invitation_code',$invitationCode)->field('id')->find();
            if (!empty($parent_user)) {
                $new_parent_id = $parent_user['id'];
                if (empty($userinfo['parent_id'])) {
                    $user_data['parent_id'] = $new_parent_id;
                }
            }
        }
        if (!empty($parent_id) && $parent_id != undefined && $parent_id != 0) {
            if (empty($userinfo['parent_id'])) {
                $user_data['parent_id'] = $parent_id;
            }
        }
        $res = $usermodel->where('id',$user_id)->data($user_data)->update();
        $apiRes = [
            'code' => 0,
            'data' => $res,
            'msg' => 'success'
        ];
        apiResponse($apiRes);
    }
    //获取地区列表
    public function getdistrict(){

        $list = cache('districtArr');
        if (empty($list)) {
            $list = $this->getDistrictArr();
        }

        $apiRes = $list;
        apiResponse($apiRes);
    }

    //商品列表 -- 获取商品
    public function getProductListByCat(){
        $user_id = $this->getuserid();
        $id = getParameterByRedirect('id');
        $cat_id = getParameterByRedirect('cat_id');
        $attr_id = getParameterByRedirect('attr_id');
        $name = getParameterByRedirect('name');
        $isOnlyThumb = getParameterByRedirect('isOnlyThumbpicture');
        $sales = getParameterByRedirect('sales');
        $page = getParameterByRedirect('page');
        $parent_id = getParameterByRedirect('parent_id');

        $isOnlyThumbpicture = true;
        if (!empty($id)) $map['id'] = $id;
        if (!empty($cat_id)) $map['cat_id'] = $cat_id;
        if (!empty($attr_id)) $map['attr_id'] = $attr_id;
        if (!empty($name) && strcmp($name, 'undefined') !== 0) $map['name'] = ['like','%'.$name.'%'];
        if ($isOnlyThumbpicture == 2) $isOnlyThumbpicture = false;
        if ($sales == 2) $isNeedSales = true;

        $list = $this->getProductlist($map,$isOnlyThumbpicture,$isNeedSales,$fields='',$order='sort',$count=5,$page);
        if (!empty($parent_id) && $parent_id != undefined) {
            $userinfo = db('user')->where('id',$user_id)->field('id,parent_id')->find();
            if (empty($userinfo['parent_id'])) {
                $res = db('user')->where('id',$user_id)->data(['parent_id'=>$parent_id])->update();
            }
        }
        if (!empty($id)) {
            $shareinfo = [
                'title' => '分享商品得好礼',
                'path' => 'pages/detail/detail?parent_id='.$user_id.'&id='.$id,
                'imageUrl' => '',
            ];
        }
        $apiRes = [
            'code' => 0,
            'data' => $list,
            'shareinfo' => $shareinfo,
            'msg' => 'success'
        ];
        apiResponse($apiRes);
    }
    //商品结算页面
    public function settlement(){
        $user_id = $this->getuserid();
        $id = getParameterByRedirect('id');
        $number = getParameterByRedirect('number');
        if (!empty($id)) $map['id'] = $id;
        $setting = db('other_parameter')->where('is_delete','0')->field('id,switch_freight')->find();
        $user_fields = 'id,account,realname,nickname,openid,avatar_url,mobile,usertype_id,userlevel_id,commission,dividend,manual_integral';
        $userinfo = db('user')->where('id',$user_id)->field($user_fields)->find();
        $userinfo['manual_integral_used'] = 0;

        $total_price = 0;
        $freight = 0;

        if (!empty($id)) {
            //单商品结算
            $fields='id,name,price,original_price,share_commission,intro,specification,stock,freight';
            $list[0] = $this->getProductlist($map,$isOnlyThumbpicture=true,$isNeedSales=false,$fields,$order='sort',$count=10);
            $list[0]['number'] = $number;
        }else{
            //购物车结算
            $shopcart_map = [
                'user_id' => $user_id,
                'is_delete' => 0,
                'status' => 2
            ];
            $shopcart = db('shopcart');
            $shopcartlist = $shopcart->where($shopcart_map)->field('id,product_id,user_id,number')->select();
            foreach ($shopcartlist as $k1 => $v1) {
                $productmap[$k1] = [
                    'id' => $v1['product_id']
                ];
                $fields = 'id,name,price,original_price,attr_id,share_commission,specification,stock,unit,freight';
                $list[$k1] = $this->getProductlist($productmap[$k1],$isOnlyThumbpicture=true,$isNeedSales=false,$fields,$order='sort',$count=1000);
                $list[$k1]['number'] = $v1['number'];
                // $cart_data[$k1] = [
                //     'updateuser_id' => $user_id,
                //     'updatetime' => time(),
                //     'is_delete' => 1
                // ];
                // $cart_res = $shopcart->where('id',$v1['id'])->data($cart_data[$k1])->update();
            }
        }
        //计算订单总价
        foreach ($list as $k2 => $v2) {
            $total_price = floatval($total_price) + (floatval($v2['price']) * $v2['number']);
            if (!$setting['switch_freight']){
                $freight = $freight > $v2['freight'] ? $freight : $v2['freight'];
            }
        }
        $product_price = $total_price;
        $total_price = floatval($total_price) + floatval($freight); //加上运费
        if (!($userinfo['manual_integral'] == 0)) {
            if ($total_price >= $userinfo['manual_integral']) {
                $total_price = floatval($total_price) - floatval($userinfo['manual_integral']);
                $userinfo['manual_integral_used'] = floatval($userinfo['manual_integral']);
            }else{
                $total_price = 0;
                $userinfo['manual_integral_used'] = $total_price;
            }
        }
        //获取默认收货地址
        $picker_address = model('address')->where(['is_delete'=>0,'user_id'=>$user_id,'is_default'=>1])->field('id,user_id,username,mobile,province_id,city_id,district_id,address,is_default,note,createtime,status')->find();
        $picker_address['province'] = $picker_address->province;
        $picker_address['city'] = $picker_address->city;
        $picker_address['district'] = $picker_address->district;
        $apiRes = [
            'code' => 0,
            'data' => $list,
            'total_price' => $total_price,
            'freight' => $freight,
            'userinfo' => $userinfo,
            'product_price' => $product_price,
            'picker_address' => $picker_address,
            'msg' => 'success'
        ];
        apiResponse($apiRes);
    }
    //结算页面支付
    public function payNow(){
        $user_id = $this->getuserid();
        $product_list = object2array(json_decode(getParameterByRedirect('product_list')));//商品信息列表
        $total_price = getParameterByRedirect('total_price');//总价
        $userinfo = object2array(json_decode(getParameterByRedirect('userinfo')));//用户信息
        $address_id = getParameterByRedirect('address_id');//地址ID
        $freight = getParameterByRedirect('freight');//运费
        $commission_used = getParameterByRedirect('commission_used');//当次佣金
        $dividend_used = getParameterByRedirect('dividend_used');//当次积分
        $manual_integral_used = getParameterByRedirect('manual_integral_used');//当次手动添加的购物券
        $product_price = getParameterByRedirect('product_price');//当次商品总价
        $note = getParameterByRedirect('note');//备注
        $user_openid = db('user')->where('id',$user_id)->field('id,openid,commission,dividend,manual_integral')->find();

        $orderNo = $this->getOrderNo();
        //生成订单
        $orderData = [
            'orderNo' => $orderNo,
            'user_id' => $user_id,
            'address_id' => $address_id,
            'product_price' => $product_price,
            'price' => $total_price,
            'commission_used' => $commission_used,
            'dividend_used' => $dividend_used,
            'manual_integral_used' => $manual_integral_used,
            'freight' => $freight,
            'note' => $note,
            'createtime' => time(),
            'status' => 1
        ];
        if (!empty($commission_used) && $commission_used != 0) {
            $user_data['commission'] = $user_openid['commission'] - $commission_used;
        }
        if (!empty($dividend_used) && $dividend_used != 0) {
            $user_data['dividend'] = $user_openid['dividend'] - $dividend_used;
        }
        if (!empty($manual_integral_used) && $manual_integral_used != 0) {
            $user_data['manual_integral'] = $user_openid['manual_integral'] - $manual_integral_used;
        }
        $tablePrefix = config("database.prefix");
        
        $shopcart_map = [
            'user_id' => $user_id,
            'is_delete' => 0,
            'status' => 2
        ];
        $shopcart = db('shopcart');
        $shopcartlist = $shopcart->where($shopcart_map)->field('id,product_id,user_id,number')->select();
        foreach ($shopcartlist as $k1 => $v1) {
            /*$productmap[$k1] = [
                'id' => $v1['product_id']
            ];
            $fields = 'id,name,price,original_price,attr_id,share_commission,specification,stock,unit,freight';
            $list[$k1] = $this->getProductlist($productmap[$k1],$isOnlyThumbpicture=true,$isNeedSales=false,$fields,$order='sort',$count=1000);
            $list[$k1]['number'] = $v1['number'];*/
            $cart_data[$k1] = [
                'updateuser_id' => $user_id,
                'updatetime' => time(),
                'is_delete' => 1
            ];
            $cart_res = $shopcart->where('id',$v1['id'])->data($cart_data[$k1])->update();
        }
        // 启动事务
        \think\Db::startTrans();
        $tablePrefix = config("database.prefix");
        $msg = [];
        try{   
            $msg['order'] = \think\Db::table($tablePrefix.'order')->insert($orderData);//保存订单
            $order_id =  db($tablePrefix.'order')->getLastInsID();
            //保存订单详细
            foreach ($product_list as $k1 => $v1) {
                $orderdetailData[$k1] = [
                    'order_id' => $order_id,
                    'product_id' => $v1['id'],
                    'productNum' => $v1['number'],
                    'user_id' => $user_id,
                    'createtime' => time(),
                    'status' => 1
                ];
                $msg['orderdetail'][$k1] = \think\Db::table($tablePrefix.'orderdetail')->insert($orderdetailData[$k1]);//保存订单
            }
            //扣减用户相关优惠
            if (!empty($user_data)) {
                $msg['user'] = \think\Db::table($tablePrefix.'user')->where('id',$user_id)->data($user_data)->update();//保存订单
            }
            fdbg($msg);
            $result = [
                'code' => 1,
                'msg' => $msg,
                'info' => '事务提交成功'
            ];
            // 提交事务
            \think\Db::commit();
        } catch (\Exception $e) {
            $result = [
                'code' => 0,
                'msg' => $msg,
                'info' => '事务提交失败'
            ];
            // 回滚事务
            \think\Db::rollback();
        }
        if ($result[code]) {
            //订单生成成功，请求微信支付参数
            $data = [
                'body' => '商品订单',
                'order_no' => $orderNo,
                'price' => $total_price,
                // 'price' => 0.01,
                'openid' => $user_openid['openid'],
            ];
            $payParams = $this->pay($data);
            $payParams['order_id'] = $order_id;
            $apiRes = [
                'code' => 0,
                'data' => $payParams,
                'msg' => 'success'
            ];
        }else{
            $apiRes = [
                'code' => 1,
                'data' => [],
                'msg' => '系统繁忙'
            ];
        }
        
        apiResponse($apiRes);
    }
    

    //添加/删除收藏
    public function enshrine(){

        $product_id = getParameterByRedirect('product_id');
        $user_id = $this->getuserid();
        $model = db('product_enshrine');

        $enshrinemap = [
            'product_id' => $product_id,
            'user_id' => $user_id,
            'is_delete' => 0,
        ];

        $old_enshrine = $model->where($enshrinemap)->field('id')->order('createtime desc')->limit(3)->select();
        $old_enshrine_id = $old_enshrine[0]['id'];
        if (empty($old_enshrine)){
            $data = [
                'product_id' => $product_id,
                'user_id' => $user_id,
                'createtime' => time(),
                'status' => 1
            ];
            $res = $model->insert($data);
            $enshrine = 1;
        }else{
            $udata = [
                'is_delete' => 1,
            ];
            $res = $model->where('id',$old_enshrine_id)->data($udata)->update();
            $enshrine = 0;
        }

        $apiRes = [
            'code' => 0,
            'data' => $enshrine,
            'msg' => 'success'
        ];
        apiResponse($apiRes);
    }

    //获取订单列表
    public function orderlist(){

        $user_id = $this->getuserid();
        $status = getParameterByRedirect('status');
        if (empty($status)) $status = 1;

        if ($status == 12){
            $map = [
                'status' => ['gt',1],
                'is_pay' => 1,
                'user_id'=>$user_id,
            ];
            $list = db('member_upgrade_order')->where($map)->order('createtime desc')->select();
            $Personal = new Personal();
            foreach ($list as $k1 => $v1) {
                $list[$k1]['createtime'] = date('Y-m-d H:i:s',$v1['createtime']);
                $map = ['id'=>$v1['product_id']];
                $list[$k1]['product_list'][$k1] = $Personal->getMemberUpgradelist($map,$isOnlyThumbpicture=true,$isNeedSales=false,$fields,$order='sort',$count=10);
                $list[$k1]['price'] = $list[$k1]['product_list'][$k1]['price'];
            }
        }else{
            $list = db('order')->where(['status'=>$status,'user_id'=>$user_id])->order('createtime desc')->select();
            $detailmodel = db('orderdetail');
            foreach ($list as $k1 => $v1) {
                $list[$k1]['createtime'] = date('Y-m-d H:i:s',$v1['createtime']);
                $orderdetail = $detailmodel->where('order_id',$v1['id'])->order('createtime desc')->field('id,order_id,product_id,productNum')->limit(1)->select();
                foreach ($orderdetail as $k2 => $v2) {
                    $map = ['id'=>$v2['product_id']];
                    $list[$k1]['product_list'][0] = $this->getProductlist($map,$isOnlyThumbpicture=true,$isNeedSales=false,$fields='',$order='sort',$count=10);
                    $list[$k1]['product_list'][0]['productNum'] = $v2['productNum'];
                }
            }
        }
        $apiRes = [
            'code' => 0,
            'data' => $list,
            'msg' => 'success'
        ];
        apiResponse($apiRes);
    }
    //获取单个订单信息
    public function getOrderdetail(){
        $user_id = $this->getuserid();
        $order_id = getParameterByRedirect('order_id');
        $fields = 'id,orderNo,user_id,address_id,product_price,price,commission_used,dividend_used,manual_integral_used,freight,note,createtime,status';

        $list = db('order')->where('id',$order_id)->field($fields)->find();
        $detailmodel = db('orderdetail');

        $list['createtime'] = date('Y-m-d H:i:s',$list['createtime']);
        $orderdetail = $detailmodel->where('order_id',$list['id'])->order('createtime desc')->field('id,order_id,product_id,productNum')->select();
        $productNum_total = 0;
        foreach ($orderdetail as $k2 => $v2) {
            $map = ['id'=>$v2['product_id']];
            $list['product_list'][$k2] = $this->getProductlist($map,$isOnlyThumbpicture=true,$isNeedSales=false,$fields='',$order='sort',$count=10);
            $list['product_list'][$k2]['productNum'] = $v2['productNum'];
            $productNum_total += $v2['productNum'];
        }
        $list['productNum_total'] = $productNum_total;

        $apiRes = [
            'code' => 0,
            'data' => $list,
            'msg' => 'success'
        ];
        apiResponse($apiRes);
    }
    //取消订单
    public function orderCancel(){
        $user_id = $this->getuserid();
        $order_id = getParameterByRedirect('order_id');
        $fields = 'id,commission_used,dividend_used,manual_integral_used';
        $ufields = 'id,commission,dividend,manual_integral';

        $order = db('order')->where('id',$order_id)->field($fields)->find();
        $userinfo = db('user')->where('id',$user_id)->field($ufields)->find();

        if (!empty($order['commission_used']) && $order['commission_used'] != 0) {
            $new_udata['commission'] = $order['commission_used'];
            $udata['commission'] = floatval($userinfo['commission']) + floatval($order['commission_used']);
        }
        if (!empty($order['dividend_used']) && $order['dividend_used'] != 0) {
            $new_udata['dividend'] = $order['dividend_used'];
            $udata['dividend'] = floatval($userinfo['dividend']) + floatval($order['dividend_used']);
        }
        if (!empty($order['manual_integral_used']) && $order['manual_integral_used'] != 0) {
            $new_udata['manual_integral'] = $order['manual_integral_used'];
            $udata['manual_integral'] = intval($userinfo['manual_integral']) + intval($order['manual_integral_used']);
        }
        $order_data = [
            'status' => -1,
            'updateuser_id' => $user_id,
            'updatetime' => time(),
        ];
        // 启动事务
        \think\Db::startTrans();
        $tablePrefix = config("database.prefix");
        $msg = [];
        try{   
            //执行订单取消操作
            $msg['order'] = \think\Db::table($tablePrefix.'order')->where('id',$order_id)->data($order_data)->update();
            //返还用户相关优惠
            if (!empty($udata)) {
                $udata['updateuser_id'] = $user_id;
                $udata['updatetime'] = time();
                $msg['user'] = \think\Db::table($tablePrefix.'user')->where('id',$user_id)->data($udata)->update();
            }
            $apiRes = [
                'code' => 0,
                'data' => $msg,
                'msg' => '订单取消成功'
            ];
            // 提交事务
            \think\Db::commit();
        } catch (\Exception $e) {
            $apiRes = [
                'code' => 1,
                'data' => $msg,
                'msg' => '系统繁忙'
            ];
            // 回滚事务
            \think\Db::rollback();
        }
        
        apiResponse($apiRes);
    }
    //订单 - 确认收货
    public function orderConfirm(){

        $user_id = $this->getuserid();
        $order_id = getParameterByRedirect('order_id');

        $data = [
            'status' => 4,
            'updateuser_id' => session('uid'),
            'updatetime' => time(),
        ];
        $res = db('order')->where('id',$order_id)->data($data)->update();
        if ($res) {
            $apiRes = [
                'code' => 0,
                'data' => $msg,
                'msg' => '确认收货成功'
            ];
        }else{
            $apiRes = [
                'code' => 1,
                'data' => $msg,
                'msg' => '系统繁忙'
            ];
        }
        apiResponse($apiRes);
    }

    //未支付订单再次支付
    public function payAgain(){
        $user_id = $this->getuserid();
        $order_id = getParameterByRedirect('order_id');

        $order = db('order')->where('id',$order_id)->field('id,orderNo,price')->find();
        $user_openid = db('user')->where('id',$user_id)->field('id,openid,commission,dividend,manual_integral')->find();
        $orderNo = $this->getOrderNo();

        $order_data = [
            'orderNo' => $orderNo,
            'updateuser_id' => $user_id,
            'updatetime' => time()
        ];
        $orderRes = db('order')->where('id',$order_id)->data($order_data)->update();

        if ($orderRes) {
            //订单单号重新生成成功，请求微信支付参数
            $data = [
                'body' => '商品订单二次支付',
                'order_no' => $orderNo,
                'price' => $order['price'],
                'openid' => $user_openid['openid'],
            ];
            $payParams = $this->pay($data);
            $payParams['order_id'] = $order_id;
            $apiRes = [
                'code' => 0,
                'data' => $payParams,
                'msg' => 'success'
            ];
        }else{
            $apiRes = [
                'code' => 1,
                'data' => [],
                'msg' => '该订单无法再次支付，请重新下单'
            ];
        }
        apiResponse($apiRes);
    }


    /****============================================ 抽 奖 ================================================****/
    public function lottery(){

        $user_id = $this->getuserid();
        //php获取今日开始时间戳和结束时间戳
        $beginToday = mktime(0,0,0,date('m'),date('d'),date('Y'));
        $endToday = mktime(0,0,0,date('m'),date('d')+1,date('Y'))-1;
        $lottery_apply_model = db('lottery_apply');

        //获取系统设置
        $setting = db('other_parameter')->where('is_delete','0')->field('id,humanNum,number,switch_jackpot')->find();
        //用户信息
        $userinfo = db('user')->where('id',$user_id)->field('id,nickname,userlevel_id,avatar_url')->find();
        //获取当轮报名人数
        $humanNum_map = [
            'createtime' => ['between',[$beginToday,$endToday]],
            'is_delete' => 0,
            'status' => 1,
        ];
        $humanNum = $lottery_apply_model->where($humanNum_map)->count();
        //当前报名人数百分比
        $humanNum_percent = $humanNum / $setting['humanNum'];
        //获取中奖列表
        $lottery_award = db('lottery_award')->where('is_delete','0')->field('id,user_id,number,money,award_id')->order('createtime desc')->limit(20)->select();
        $user_model = db('user');
        $award_model = db('award');
        foreach ($lottery_award as $k1 => $v1) {
            $lottery_award[$k1]['user'] = $user_model->where('id',$v1['user_id'])->field('id,nickname,avatar_url')->find();
            if (empty($v1['award_id'])) {
                $lottery_award[$k1]['awardinfo'] = $v1['money'].'元';
            }elseif ($v1['award_id'] == -3 && $v1['money'] > 0){
                $lottery_award[$k1]['awardinfo'] = '购物券'.$v1['money'].'元';
            }else{
                $award = $award_model->where('id',$v1['award_id'])->field('id,name')->find();
                $lottery_award[$k1]['awardinfo'] = $award['name'];
            }
        }
        $list = [
            'humanNum' => $humanNum,
            'humanNum_percent' => $humanNum_percent,
            'setting' => $setting,
            'userinfo' => $userinfo,
            'lottery_award' => $lottery_award,
        ];
        $apiRes = [
            'code' => 0,
            'data' => $list,
            'msg' => 'success'
        ];
        apiResponse($apiRes);
    }

    //报名
    public function signIn(){

        $user_id = $this->getuserid();
        $beginToday = mktime(0,0,0,date('m'),date('d'),date('Y'));
        $endToday = mktime(0,0,0,date('m'),date('d')+1,date('Y'))-1;
        //获取系统设置
        $setting = db('other_parameter')->where('is_delete','0')->field('id,humanNum,number,switch_jackpot')->find();
        
        $isAlready_lottery_number_map = [
            'createtime' => ['between',[$beginToday,$endToday]],
            'is_delete' => 0,
        ];
        //当天抽奖轮数是否已完
        $isAlready_lottery_number = db('lottery_apply')->where($isAlready_lottery_number_map)->max('number');
        if ($isAlready_lottery_number > $setting['number']) {
            $apiRes = [
                'code' => 1,
                'data' => [],
                'msg' => '对不起，今日抽奖活动已结束'
            ];
            apiResponse($apiRes);
            exit();
        }
        //用户是否已报名
        $isAlready_lottery_map = [
            'user_id' => $user_id,
            'createtime' => ['between',[$beginToday,$endToday]],
            'is_delete' => 0,
        ];
        $isAlready_lottery = db('lottery_apply')->where($isAlready_lottery_map)->field('id')->find();
        if (!empty($isAlready_lottery)) {
            $apiRes = [
                'code' => 1,
                'data' => [],
                'msg' => '你已报名'
            ];
            apiResponse($apiRes);
            exit();
        }else{
            if (empty(cache('isHaveApplying'))) {
                $new_lottery_data = [
                    'user_id' => $user_id,
                    'number' => 0,
                    'createtime' => time(),
                    'status' => 1
                ];
                $res = db('lottery_apply')->insert($new_lottery_data);
                if ($res) {
                    cache('isHaveApplying',NULL);
                    $apiRes = [
                        'code' => 0,
                        'data' => [],
                        'msg' => '报名成功'
                    ];
                }
            }else{
                $this->signIn();
            }
        }
        //判断用户数量，足够时执行抽奖
        $this->executeLottery();
        apiResponse($apiRes);
    }
    //判断用户数量，足够时执行抽奖
    public function executeLottery(){
        $user_id = $this->getuserid();
        $beginToday = mktime(0,0,0,date('m'),date('d'),date('Y'));
        $endToday = mktime(0,0,0,date('m'),date('d')+1,date('Y'))-1;
        //获取系统设置
        $setting = db('other_parameter')->where('is_delete','0')->field('id,humanNum,number,switch_jackpot,award_money,card_number,card_money')->find();
        //已抽奖轮数
        $isAlready_lottery_map = [
            'createtime' => ['between',[$beginToday,$endToday]],
            'is_delete' => 0,
        ];
        $already_lottery_number = db('lottery_apply')->where($isAlready_lottery_map)->max('number');
        //查询奖品
        $lottery_award_map = [
            'number' => ['gt','0'],
            'status' => 1,
            'is_delete' => 0
        ];
        $lottery_award = db('award')->where($lottery_award_map)->field('id,name,number')->order('sort')->select();
        //查询当前报名人数
        $isAlready_lottery_map = [
            'createtime' => ['between',[$beginToday,$endToday]],
            'is_delete' => 0,
            'status' => 1
        ];
        $isAlready_lottery_humanNum = db('lottery_apply')->where($isAlready_lottery_map)->count();
        if ($isAlready_lottery_humanNum == $setting['humanNum']) {
            //用户数量达到，执行抽奖
            $userinfo = db('lottery_apply')->where($isAlready_lottery_map)->field('id,user_id')->select();
            $lottery_userids = $userinfo;
            $new_lottery_award = $lottery_award;
            $user_number = count($userinfo);//中奖人数
            foreach ($userinfo as $k0 => $v0) {
                $userids[] = $v0['user_id'];
                $rand_number[] = $k0;
            }
            foreach ($userinfo as $k1 => $v1) {
                //选取中奖用户
                $user_id_number = array_rand($rand_number);
                //中奖用户
                $win_user_data[$k1] = [
                    'user_id' => $userids[$user_id_number],
                    'number' => intval($already_lottery_number) + 1,
                    'createtime' => time(),
                    'status' => 1
                ];
                //派发奖品
                foreach ($new_lottery_award as $k2 => $v2) {
                    if ($v2['number'] > 0) {
                        $win_user_data[$k1]['award_id'] = $v2['id'];
                        $win_user_data[$k1]['money'] = 0;
                        $new_lottery_award[$k2]['number'] = $v2['number'] - 1;
                        unset($lottery_userids[$user_id_number]);
                        $user_number--;
                        break;
                    }else{
                        unset($new_lottery_award[$k2]);
                    }
                }
                unset($rand_number[$user_id_number]);
            }
            //派发购物券
            if(empty($new_lottery_award) && $user_number > 0){
                $card_money = $setting['card_money'];
                $card_number = $setting['card_number'];
                foreach ($win_user_data as $k5 => $v5) {
                    if (empty($v5['award_id'])) {
                        $win_user_data[$k5]['award_id'] = '-3';
                        $win_user_data[$k5]['money'] = $card_money;
                        $user_number--;
                    }
                }
            }
            //奖品派发完，派发现金
            if (empty($new_lottery_award) && $user_number > 0) {
                $win_user_money_number = count($lottery_userids);
                $hongbao = $this->splitReward($setting['award_money'], $user_number, '200.00', '1.00');
                $hongbao_key = 0;
                foreach ($win_user_data as $k4 => $v4) {
                    if (empty($v4['award_id'])) {
                        $win_user_data[$k4]['award_id'] = 0;
                        $win_user_data[$k4]['money'] = $hongbao[$hongbao_key] / 100; //返回的单位为分，除以100换算为元
                        $hongbao_key++;
                    }
                }
            }
            // fdbg($win_user_data);
            // 启动事务
            \think\Db::startTrans();
            $tablePrefix = config("database.prefix");
            $msg = [];
            try{
                $msg['lottery_award'] = \think\Db::table($tablePrefix.'lottery_award')->insertAll($win_user_data);
                $lottery_apply_already_lottery_number_data = [
                    'number' => intval($already_lottery_number) + 1,
                    'status' => 2,
                    'updatetime' => time(),
                ];
                foreach ($userinfo as $k5 => $v5) {
                    $msg['lottery_apply'][$k5] = \think\Db::table($tablePrefix.'lottery_apply')->where('id',$v5['id'])->data($lottery_apply_already_lottery_number_data)->update();
                }
                fdbg($msg);
                // 提交事务
                \think\Db::commit();
            } catch (\Exception $e) {
                // 回滚事务
                \think\Db::rollback();
            }
        }

    }

    

    #执行红包生成算法
    public function splitReward($rewardMoney, $rewardNum, $max, $min)
    {
        #传入红包金额和数量，因为小数在计算过程中会出现很大误差，所以我们直接把金额放大100倍，后面的计算全部用整数进行
        $min = $min * 100;
        $max = $max * 100;
        #预留出一部分钱作为误差补偿，保证每个红包至少有一个最小值
        $this->rewardMoney = $rewardMoney * 100 - $rewardNum * $min;
        $this->rewardNum = $rewardNum;
        #计算出发出红包的平均概率值、精确到小数4位。
        $avgRand = 1 / $this->rewardNum;
        $randArr = array();
        #定义生成的数据总合sum
        $sum = 0;
        $t_count = 0;
        while ($t_count < $rewardNum) {
            #随机产出四个区间的额度
            $c = rand(1, 100);
            if ($c < 15) {
                $t = round(sqrt(mt_rand(1, 1500)));
            } else if ($c < 65) {
                $t = round(sqrt(mt_rand(1500, 6500)));
            } else if ($c < 95) {
                $t = round(sqrt(mt_rand(6500, 9500)));
            } else {
                $t = round(sqrt(mt_rand(9500, 10000)));
            }
            ++$t_count;
            $sum += $t;
            $randArr[] = $t;
        }
        #计算当前生成的随机数的平均值，保留4位小数
        $randAll = round($sum / $rewardNum, 4);
        #为将生成的随机数的平均值变成我们要的1/N，计算一下每个随机数要除以的总基数mixrand。此处可以约等处理，产生的误差后边会找齐
        #总基数 = 均值/平均概率
        $mixrand = round($randAll / $avgRand, 4);
        #对每一个随机数进行处理，并乘以总金额数来得出这个红包的金额。
        $rewardArr = array();
        foreach ($randArr as $key => $randVal) {
            #单个红包所占比例randVal
            $randVal = round($randVal / $mixrand, 4);
            #算出单个红包金额
            $single = floor($this->rewardMoney * $randVal);
            #小于最小值直接给最小值
            if ($single < $min) {
                $single += $min;
            }
            #大于最大值直接给最大值
            if ($single > $max) {
                $single = $max;
            }
            #将红包放入结果数组
            $rewardArr[] = $single;
        }
        #对比红包总数的差异、将差值放在第一个红包上
        $rewardAll = array_sum($rewardArr);
        $rewardArr[0] = $rewardMoney * 100 - ($rewardAll - $rewardArr[0]);#此处应使用真正的总金额rewardMoney，$rewardArr[0]可能小于0
        #第一个红包小于0时,做修正
        if ($rewardArr[0] < 0) {
            rsort($rewardArr);
            $this->add($rewardArr, $min);
        }
        rsort($rewardArr);
        #随机生成的最大值大于指定最大值
        if ($rewardArr[0] > $max) {
            #差额
            $diff = 0;
            foreach ($rewardArr as $k => &$v) {
                if ($v > $max) {
                    $diff += $v - $max;
                    $v = $max;
                } else {
                    break;
                }
            }
            $transfer = round($diff / ($this->rewardNum - $k + 1));
            $this->diff($diff, $rewardArr, $max, $min, $transfer, $k);
        }
        return $rewardArr;
    }
    #处理所有超过最大值的红包
    public function diff($diff, &$rewardArr, $max, $min, $transfer, $k)
    {
        #将多余的钱均摊给小于最大值的红包
        for ($i = $k; $i < $this->rewardNum; $i++) {
            #造随机值
            if ($transfer > $min * 20) {
                $aa = rand($min, $min * 20);
                if ($i % 2) {
                    $transfer += $aa;
                } else {
                    $transfer -= $aa;
                }
            }
            if ($rewardArr[$i] + $transfer > $max) continue;
            if ($diff - $transfer < 0) {
                $rewardArr[$i] += $diff;
                $diff = 0;
                break;
            }
            $rewardArr[$i] += $transfer;
            $diff -= $transfer;
        }
        if ($diff > 0) {
            $i++;
            $this->diff($diff, $rewardArr, $max, $min, $transfer, $k);
        }
    }
    #第一个红包小于0,从大红包上往下减
    public function add(&$rewardArr, $min)
    {
        foreach ($rewardArr as &$re) {
            $dev = floor($re / $min);
            if ($dev > 2) {
                $transfer = $min * floor($dev / 2);
                $re -= $transfer;
                $rewardArr[$this->rewardNum - 1] += $transfer;
            } elseif ($dev == 2) {
                $re -= $min;
                $rewardArr[$this->rewardNum - 1] += $min;
            } else {
                break;
            }
        }
        if ($rewardArr[$this->rewardNum - 1] > $min || $rewardArr[$this->rewardNum - 1] == $min) {
            return;
        } else {
            $this->add($rewardArr, $min);
        }
    }


    /******** =========================================== 购物车 ================================================== ********/

    //加入购物车
    public function addToCart(){

        $product_id = getParameterByRedirect('product_id');
        $number = getParameterByRedirect('number');
        $user_id = $this->getuserid();
        $model = db('shopcart');

        $old_map = [
            'product_id' => $product_id,
            'user_id' => $user_id,
            'is_delete' => 0,
        ];
        $old_shopcat = $model->where($old_map)->field('id,product_id,user_id,number')->find();
        if (empty($old_shopcat)) {
            $data = [
                'product_id' => $product_id,
                'user_id' => $user_id,
                'number' => $number,
                'createtime' => time(),
                'status' => 1
            ];
            $res = $model->insert($data);
        }else{
            $new_number = intval($old_shopcat['number']) + intval($number);
            $data = [
                'number' => $new_number,
            ];
            $res = $model->where('id',$old_shopcat['id'])->data($data)->update();
        }

        $apiRes = [
            'code' => 0,
            'data' => $res,
            'msg' => 'success'
        ];
        apiResponse($apiRes);
    }
    //购物车界面
    public function shopcartList(){
        $user_id = $this->getuserid();
        $cartmodel = db('shopcart');

        $shopcart_map = [
            'user_id' => $user_id,
            'is_delete' => 0,
            'status' => 2
        ];
        $shopcartlist_old = $cartmodel->where($shopcart_map_old)->field('id')->select();
        foreach ($shopcartlist_old as $k3 => $v3) {
            $data_lod[$k3] = [
                'status' => 1
            ];
            $cartmodel->where('id',$v3['id'])->update($data_lod[$k3]);
        }
        unset($data_lod);
        $shopcart_map = [
            'user_id' => $user_id,
            'is_delete' => 0,
            'status' => 1
        ];
        $shopcartlist = $cartmodel->where($shopcart_map)->field('id,product_id,user_id,number')->select();
        foreach ($shopcartlist as $k1 => $v1) {
            $productmap[$k1] = [
                'id' => $v1['product_id']
            ];
            $fields = 'id,name,price,original_price,attr_id,share_commission,specification,stock,unit,freight';
            $shopcartlist[$k1]['product'] = $this->getProductlist($productmap[$k1],$isOnlyThumbpicture=true,$isNeedSales=false,$fields,$order='sort',$count=3);
        }


        $list = [
            'shopcartlist' => $shopcartlist,
        ];
        $apiRes = [
            'code' => 0,
            'data' => $list,
            'msg' => 'success'
        ];
        apiResponse($apiRes);
    }   
    public function entrySettlement(){
        $user_id = $this->getuserid();
        $productlist = object2array(json_decode(getParameterByRedirect('productlist')));//商品信息列表
        // 启动事务
        \think\Db::startTrans();
        $tablePrefix = config("database.prefix");
        $msg = [];
        try{   
            foreach ($productlist as $k1 => $v1) {
                $data[$k1] = [
                    'number' => $v1['number'],
                    'status' => 2,
                    'updateuser_id' => $user_id,
                    'updatetime' => time(),
                ];
                $msg['shopcart'][$k1] = \think\Db::table($tablePrefix.'shopcart')->where('id',$v1['id'])->data($data[$k1])->update();
            }
            $apiRes = [
                'code' => 0,
                'data' => $msg,
                'msg' => 'success'
            ];
            // 提交事务
            \think\Db::commit();
        } catch (\Exception $e) {
            $apiRes = [
                'code' => 1,
                'data' => $msg,
                'msg' => '系统繁忙'
            ];
            // 回滚事务
            \think\Db::rollback();
        }
        apiResponse($apiRes);
    }
    //购物车删除
    public function shopcartDel(){
        $user_id = $this->getuserid();
        $shopcartids = object2array(json_decode(getParameterByRedirect('shopcartids')));
        // 启动事务
        \think\Db::startTrans();
        $tablePrefix = config("database.prefix");
        try{   
            foreach ($shopcartids as $k1 => $v1) {
                if (!empty($v1)){
                    $data[$k1] = [
                        'is_delete' => 1,
                        'updateuser_id' => $user_id,
                        'updatetime' => time(),
                    ];
                    $msg['shopcart'][$k1] = \think\Db::table($tablePrefix.'shopcart')->where('id',$v1)->data($data[$k1])->update();
                }
            }
            $apiRes = [
                'code' => 0,
                'data' => $msg,
                'msg' => 'success'
            ];
            // 提交事务
            \think\Db::commit();
        } catch (\Exception $e) {
            $apiRes = [
                'code' => 1,
                'data' => $msg,
                'msg' => '系统繁忙'
            ];
            // 回滚事务
            \think\Db::rollback();
        }
        apiResponse($apiRes);
    }






}