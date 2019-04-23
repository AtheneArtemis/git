<?php
namespace app\admin\Controller;
use think\Controller;
class Login extends Controller {

	public function login(){
		session_destroy();
        return $this->fetch();
	}
	public function loginact(){
		$username = I('post.username');
		$password = I('post.password');
		$mod = M('users');
		$user = $mod->where('username="'.$username.'"')->find();
		if($user){
			if($user['password']==md5($password)){
				$_SESSION['user'] = $user;
				$json = array('code'=>0,'msg'=>'登陆成功');
			}else{
				$json = array('code'=>1,'msg'=>'密码错误');
			}
		}else{
			$json = array('code'=>1,'msg'=>'用户名不存在');
		}
		$this->ajaxReturn($json);
	}

	public function editpwd(){
		$id = $_SESSION['user']['id'];
		$password = I('post.password');
		if(preg_match('/[\x7f-\xff]/', $password)){
			$josn = array('code'=>1,'msg'=>'不能有中文');
			$this->ajaxReturn($josn);
			exit;
		}
		if(empty($id)){
			$josn = array('code'=>1,'msg'=>'修改失败');
			$this->ajaxReturn($josn);
			exit;
		}
		$pwd = md5(I('post.password'));

		$res = M('users')->where('id='.$id)->save(array('password'=>$pwd));
		if($res){
			$josn = array('code'=>0,'msg'=>'修改成功');
		}else{
			$josn = array('code'=>1,'msg'=>'修改失败');
		}
		$this->ajaxReturn($josn);

	}
	
}