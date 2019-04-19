<?php
namespace app\mini\controller;
use app\mini\controller\Base;
class ApiEntrance extends Base{

    private $programName = 'mini';
    private $randomKey = 'cyx';
    public function _initialize(){

        parent::_initialize();
        
        $this->apiRoute();
    }
    //安全验证函数
    public function apiRoute(){

        $userinfo = $this->getUserinfo();
        $sign = getparameter('sign');
        if (!empty($sign)) {
            $token = $userinfo['token'];
            $local_sign = md5('programName='.$this->programName.'&randomKey='.$this->randomKey.'&token='.$token);
            if (strcmp($local_sign, $sign) !== 0) {
                $apiRes = [
                    'code' => 1,
                    'data' => [],
                    'msg' => 'sign error'
                ];
                apiResponse($apiRes);
            }
        }else{
            $action = request()->action();
            if (strcmp($action, 'miniProgramLogin') === 0) {
                $this->miniProgramLogin();
            }else{
                $apiRes = [
                    'code' => 1,
                    'data' => [],
                    'msg' => 'no access'
                ];
                apiResponse($apiRes);
            }
        }
    }
    public function miniProgramLogin(){
        
        $code = getparameter('code');
        $parent_id = getparameter('parent_id');
        $nickname = getparameter('nickname');
        $avatar_url = getparameter('avatar_url');
        // $miniProgramParameter = db('miniprogram_parameter')->where(['is_delete'=>0])->field('id,appid,appsecret')->find();
        // $appId = $miniProgramParameter['appid'];
        // $appSecret = $miniProgramParameter['appsecret'];
        $appId = 'wx57bd7abcfd38cbb6';
        $appSecret = '9d0b694c50012a7e20c5d0dc2a17ed6b';

        if (empty($code)) {
            $apiRes = [
                'code' => 1,
                'data' => [],
                'msg' => '预授权失败'
            ];
            apiResponse($apiRes);
        }
        $url = 'https://api.weixin.qq.com/sns/jscode2session?appid='.$appId.'&secret='.$appSecret.'&js_code='.$code.'&grant_type=authorization_code';
        $result = json_decode(_http($url));
        $result = object2array($result);
        $openid = $result['openid'];
        if (empty($openid)) {
            $apiRes = [
                'code' => 1,
                'data' => [],
                'msg' => '授权失败'
            ];
            apiResponse($apiRes);
        }
        $signToken = $this->createSignToken();
        //记录用户信息
        $data = [
            'nickname' => $nickname,
            'avatar_url' => $avatar_url,
            'openid' => $openid,
            'token' => $signToken['token'],
            'usertype_id' => 'member',
            'createtime' => time(),
            'status' => 1
        ];
        $old_user = db('user')->where(['openid'=>$openid,'is_delete'=>0])->find();
        if (empty($old_user)) {
            $data['userlevel_id'] = 1;
            $data['parent_id'] = $parent_id;
            $user = db('user')->data($data)->insert();
            $user_id = db('user')->getLastInsID();
        }else{
            if (empty($old_user['parent_id'])) {
                $data['parent_id'] = $parent_id;
            }
            $user_id = $old_user['id'];
            $user = db('user')->where('id',$user_id)->update($data);
        }
        session('user_id',$user_id);
        $session_id = session_id();
        $apiResData = [
            'session_id' => $session_id,
            'user_id' => $user_id,
            'sign' => $signToken['sign'],
        ];
        $apiRes = [
            'code' => 0,
            'data' => $apiResData,
            'msg' => ''
        ];
        apiResponse($apiRes);
    }
    public function createSignToken(){

        $time = uniqid('login');
        $randstring = randomkeys(6);
        $token = md5($time.$randstring);

        $signToken['sign'] = md5('programName='.$this->programName.'&randomKey='.$this->randomKey.'&token='.$token);
        $signToken['token'] = $token;

        return $signToken;
    }
}