<?php
namespace app\admin\controller;
use think\Controller;
class Login extends Controller{
    
    public function _initialize(){
        // $map = [];
        // $sysset = db('sysset')->where($map)->find();
        $sysset = [
            'storename' => '宸亦轩',
            'loginbg' =>dirname(config('UPLOADIMG_URL')).'/img/login-background.jpg'
        ];
        $this->assign('sysset',$sysset);
    }
    function index(){
        $this->redirect(url('login'));
    }
    /**
     * 函数用途描述
     * @date: 2017年2月28日 上午7:07:49
     * @author: Administrator：chenkeyu
     * @description: 登录首页及登录验证
     * @param: variable
     * @return:
     */
    public function login(){
        $plist = getparameter('post.');
        if (!empty($plist)){
            $model = db('user');
            /*
            $condition['account'] = $plist['account'];
            $condition['status'] = array('gt','0');
            */
            // 检查账号
            $list = $model->where('status','gt','0')->where('account',$plist['account'])->find();
            if(empty($list)) {
            	 $this->result(url('Login/login'),-1,'帐户不存在...','json');
            	 return false;
            }
            if(!in_array($list['usertype_id'], ['platformadmin','superadministrator','administrator'])){
                $this->result(url('Login/login'),-1,'限制登录，请联系管理员...','json');
                return false;
            }
            $password = md5($plist['password']);
            if(strcmp($password,$list['password']) === 0){
                session('uid', $list['id']);
                session('nickname',$list['nickname']);
                session('usertypeid',$list['usertype_id']);
                session('companyid',$list['company_id']);
                if(strcmp($list['usertype_id'],'superadministrator') === 0){
                    session('adminid',$list['id']);
                }
                $this->result(url('Index/index'),2,'登录成功,正跳转至系统首页...','json');
            } else{ 
                $this->result(url('Login/login'),-1,'密码错误，请重试...','json');
            }
        }
        return view('Login/login');
    }
    function register(){
        
        $utlist = db('enumeration')->where('enumerationcategory','usertype')->where('itemname','not in',['superadministrator','platformadmin'])->select();
        $this->assign('utlist',$utlist);
        
        $rolelist = db('role')->where('name','eq','普通用户')->field('id')->order('createtime desc')->select();
        $this->assign('roleid',$rolelist[0]['id']);
        
        return $this->fetch('Login/register');
    }
    /**
    * 用户注册表单处理
    * @author: 2017年11月27日 上午9:49:45-Administrator：chenkeyu
    * @param: variable
    * @return:
    */
    function userregister(){

        $account = getparameter('account');
        $password = getparameter('password');
        //$companyname = getparameter('companyname');
        //$usertype_id = getparameter('usertype_id');
        $usertype_id = 'person';
        $roleid = getparameter('role_id');
        $verifycode = getparameter('verifycode');
        if (strcmp(md5($verifycode), session('verifycode')) !==0){
            $this->result('',0,'验证码错误','json');
        }
        $uid = generateprimerykey();
        $udata = [
            'id' => $uid,
            'account' => $account,
            'nickname' => $account,
            'mobilenumber' => $account,
            'usertype_id' => $usertype_id,
            'password' => md5($password),
            'createtime' => time(),
            'user_id' => $uid,
            'status' => 1
        ];
        $uhisdata = [
            'id' => generateprimerykey(),
            'user_id' => $uid,
            'account' => $account,
            'nickname' => $account,
            'mobilenumber' => $account,
            'usertype_id' => $usertype_id,
            'password' => md5($password),
            'createtime' => time(),
            'createuser_id' => $uid,
            'status' => 1
        ];
        $urdata = [
            'role_id' => $roleid,
            'user_id' => $uid,
            'status' => '1'
        ];
        
        \think\Db::startTrans();
        try{
            $ret['user'] = \think\Db::table('ll_user')->insert($udata);
            $ret['userhis'] = \think\Db::table('ll_userhis')->insert($uhisdata);
            $ret['roleuser'] = \think\Db::table('ll_role_user')->insert($urdata);
            // 提交事务
            \think\Db::commit();
        } catch (\Exception $e) {
            // 回滚事务
            \think\Db::rollback();
        }
        if (!in_array(0, $ret)){
            session('uid', $uid);
            session('nickname',$account);
            $this->result('',1,'注册成功,正跳转至系统首页...','json');
        }else{
            $this->result('',0,'注册失败,正跳转至系统首页...','json');
        }
    }
    /**
     * 函数用途描述
     * @date: 2017年2月28日 上午7:08:21
     * @author: Administrator：chenkeyu
     * @description: 退出函数
     * @param: variable
     * @return:
     */
    function loginout(){
        if(session('?uid')) {
            session(null);
            $this->success('成功退出...', url('Index/index','',''));
        }else {
            $this->error('已经登出！');
        }
    }
    //验证账号是否存在
    function verifyregister(){
        
        $account = getparameter('mobilenumber');
        $list = db('user')->where('account',$account)->select();
        if (!empty($list)){
            $this->result('',1,'手机号已注册','json');
        }else{
            $this->result('',0,'','json');
        }
    }
    /**
     * 生成验证短信
     * @author Administrator：chenkeyu 2018年1月3日 上午11:07:14
     * @param
     * @return
     */
    function getsmsverifycode() {
        $mobilenumber = getparameter('mobilenumber');
        $data["mobilenumber"] = $mobilenumber;
        $verifycode = getparameter('verifycode');
        $data["verifycode"] = $verifycode;
        if($this->verifymobilenumber($mobilenumber) !== false) {
            session('verifycode',md5($verifycode));
            $smscontent = "您的验证码是：".$verifycode."。请不要把验证码泄露给其他人。";
            //发送短信
            //$this->sendsms($mobilenumber,$smscontent);
            $this->result($data,1,'短消息已发送，请注意查收','json');
        } else {
            $this->result($data,-1,'手机号码有误,请重新输入','json');
        }
    }
    //验证手机号
    function verifymobilenumber($mobilenumber) {
        return true;
        /* if(preg_match("/1[73458]{1}\d{9}$/",$mobilenumber)) {
            return true;
        } else {
            return false;
        } */
    }
    function forgotpassword(){
        
        
        return $this->fetch('Login/forgotpassword');
    }
    function userforgotpassword(){
        
        $account = getparameter('account');
        $password = getparameter('password');
        $verifycode = getparameter('verifycode');
        
        if (strcmp(md5($verifycode), session('verifycode')) !==0){
            $this->result('',0,'验证码错误','json');
        }
        $userinfo = db('user')->where('account',$account)->field('id,account')->find();
        $uid = $userinfo['id'];
        $udata = [
            'account' => $account,
            'nickname' => $account,
            'mobilenumber' => $account,
            'password' => md5($password),
            'createtime' => time(),
            'status' => 1
        ];
        $uhisdata = [
            'id' => generateprimerykey(),
            'user_id' => $uid,
            'account' => $account,
            'nickname' => $account,
            'mobilenumber' => $account,
            'password' => md5($password),
            'createtime' => time(),
            'createuser_id' => $uid,
            'status' => 1
        ];
        \think\Db::startTrans();
        try{
            $ret['user'] = \think\Db::table('ll_user')->insert($udata);
            $ret['userhis'] = \think\Db::table('ll_userhis')->insert($uhisdata);
            // 提交事务
            \think\Db::commit();
        } catch (\Exception $e) {
            // 回滚事务
            \think\Db::rollback();
        }
        if (!in_array(0, $ret)){
            session('uid', $uid);
            session('nickname',$account);
            $this->result('',1,'密码重置成功,正跳转至系统首页...','json');
        }else{
            $this->result('',0,'系统繁忙，请稍后重试！','json');
        }
    }
    
    
    
    
    
    
}