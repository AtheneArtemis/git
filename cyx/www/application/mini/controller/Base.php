<?php
namespace app\mini\controller;
use think\Controller;
use think\Session;

class Base extends Controller{

    protected $uploadurl;//上传图片访问路径
    public function _initialize(){
        
        $session_id = getparameter('sid');
        Session::init([
            'id'             => $session_id,
            'prefix'         => 'think',
            'type'           => '',
            'auto_start'     => true,
            'expire'         => 0,
        ]);
        $this->uploadurl = config("UPLOADIMG_URL");
    }
    public function getuserid(){
        $user_id = session('user_id');
        if (empty($user_id)) {
            $user_id = getparameter('cyx');
        }
        return $user_id;
    }
    public function getUserinfo(){
        $user_id = $this->getuserid();
        $map = [
            'is_delete' => 0,
            'id' => $user_id,
        ];
        $fields = 'id,token';
        $userinfo = db('user')->where($map)->field($fields)->find();
        return $userinfo;
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

    //生成订单编号
    public function getOrderNo(){

        $orderNo = date('Y',time()).time().mt_rand(1000,9999);

        return $orderNo;
    }
    //获取手机验证码
    public function getcaptcha(){

        $mobile = getparameter('mobile');
        $actiontype = getparameter('actiontype');

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
    public function notify(){

        $xmlstr= file_get_contents("php://input");
        fdbg(1);
        fdbg($xmlstr);

        $new_xmlstr = xml2array($xmlstr);
        fdbg(2);
        fdbg($new_xmlstr);

        $data = [
            'return_code' => 'SUCCESS',
            'return_msg' => 'OK'
        ];
        $new_data = array2xml($data);
        echo $new_data;

    }
}