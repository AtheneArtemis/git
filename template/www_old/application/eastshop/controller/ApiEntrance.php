<?php
namespace app\eastshop\controller;
use think\Controller;
use app\common\RBAC;
use think\Db;
use think\Url;
use think\Session;
class ApiEntrance extends Controller{

    // public $str_replace_sign_old = '/';
    // public $str_replace_sign_new = '--+-+--';

    public function apiRoute(){
        $plist = getparameter('get.');
        $newParams = [];
        //安全验证 --- 签名 sign

        if (strcmp($plist['a'], 'miniProgramLogin') ===0) {
            $nickname = paramsReplaceSignOld($plist['nickname']);
            $avatar_url = paramsReplaceSignOld($plist['avatar_url']);
            $url = $plist['m'].'/'.$plist['c'].'/'.$plist['a'];
            $newParams = [
                'code' => $plist['code'],
                'parent_id' => $plist['parent_id'],
                // 'nickname' => $plist['nickname'],
                // 'avatar_url' => $plist['avatar_url'],
                'nickname' => $nickname,
                'avatar_url' => $avatar_url,
            ];
        }
        if (!empty($plist['state'])) {
            
            $newParams = paramsReplaceSignOld($plist);
            // $newParams = $plist;
            $url = $plist['m'].'/'.$plist['c'].'/'.$plist['a'];
        }
        if (!empty($url)) {
            $this->redirect($url,$newParams);
            // $this->redirect($url);
        }
        $apiRes = 'no access';
        apiResponse($apiRes);
    }
    public function miniProgramLogin(){
        
        $code = getparameter('code');
        $parent_id = getparameter('parent_id');
        $nickname = paramsReplaceSignNew(getparameter('nickname'));
        $avatar_url = paramsReplaceSignNew(getparameter('avatar_url'));
        // $nickname = getparameter('nickname');
        // $avatar_url = getparameter('avatar_url');
        $miniProgramParameter = db('miniprogram_parameter')->where(['is_delete'=>0])->field('id,appid,appsecret')->find();
        $appId = $miniProgramParameter['appid'];
        $appSecret = $miniProgramParameter['appsecret'];

        // $appId = 'wx955de1cdbf5d67ef';
        // $appSecret = '66d64494a4183ff8198b7bdbd4a50b2d';
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
            exit();
        }
        //记录用户信息
        $data = [
            'nickname' => $nickname,
            'avatar_url' => $avatar_url,
            'openid' => $openid,
            'usertype_id' => 'member',
            // 'userlevel_id' => 1,
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
        ];
        $apiRes = [
            'code' => 0,
            'data' => $apiResData,
            'msg' => ''
        ];
        apiResponse($apiRes);
    }
    public function notify(){
        echo '';
    }
}