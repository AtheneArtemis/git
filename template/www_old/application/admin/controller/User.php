<?php
namespace app\admin\controller;
use app\admin\controller\Publictable;

class User extends Publictable{
    
    function _initialize(){
        parent::_initialize();
        
    }
    function _filter(&$map,&$querycond){
        $map["is_delete"] = array('eq','0');
        // $map["account"] = array('neq','admin');
        $map['usertype_id'] = array('neq','member');
    }
    function _generatetabledatahtml($html,$id=null){
        $model = model("user");
        $value = $model->where("id",$id)->find();
       	$createtime = date('Y-m-d H:i:s',$value["createtime"]);
        
        $html = $html.'
    		<tr>
    			<td class="bs-checkbox"><input data-index="3" name="btSelectItem" type="checkbox" value="'.$value["id"].'"></td>
                <td>'.$value["id"].'</td>
    			<td>'.$value["account"].'</td>
    			<td>'.$value["nickname"].'</td>
                <td>'.$value["roles"][0]['name'].'</td>
                <td><a href="'.url(request()->controller().'/edit',array('id'=>$value['id'])).'"><button class="btn btn-outline btn-default">修改</button></td>
    		</tr>';
        return $html;
    }
    
    function index(){
    	// $this->getinitprovincecityzonelist(true);
        $this->_filter($map,$querycond);
        $this->_index("user",$map);
    	return $this->fetch(request()->controller().'/index');
    }
    function add(){

        $rolelist = db('role')->where(['status'=>1])->select();
        $this->assign('rolelist',$rolelist);

        return $this->fetch(request()->controller().'/add');
    }
    function insert(){
        $account = getparameter('account');
        $password = getparameter('password');
        $nickname = getparameter('nickname');
        $role_id = getparameter('role_id');

        $user_data = [
            'account' => $account,
            'password' => md5($password),
            'nickname' => $nickname,
            'usertype_id' => 'administrator',
            'createtime' => time(),
            'status' => 1
        ];
        $res = db('user')->insert($user_data);
        $user_id = db('user')->getLastInsID();

        $role_user_data = [
            'role_id' => $role_id,
            'user_id' => $user_id,
            'status' => 1
        ];
        $urRes = db('role_user')->insert($role_user_data);
        if ($res && $urRes) {
            $this->success('操作成功',url(request()->controller().'/index'));
        }else{
            $this->error('操作失败');
        }
    }
    function edit(){
        $id = getparameter('id');

        $list = model('user')->where('id',$id)->find();
        $this->assign('list',$list);

        $rolelist = db('role')->where(['status'=>1])->select();
        $this->assign('rolelist',$rolelist);

        return $this->fetch(request()->controller().'/edit');
    }
    public function update(){
        $id = getparameter('id');
        $account = getparameter('account');
        $nickname = getparameter('nickname');
        $role_id = getparameter('role_id');

        $user_data = [
            'account' => $account,
            'nickname' => $nickname,
            'updatetime' => time(),
        ];
        $res = db('user')->where('id',$id)->update($user_data);

        db('role_user')->where('user_id',$id)->delete();
        $role_user_data = [
            'role_id' => $role_id,
            'user_id' => $id,
            'status' => 1
        ];
        $urRes = db('role_user')->insert($role_user_data);
        if ($res && $urRes) {
            $this->success('操作成功',url(request()->controller().'/index'));
        }else{
            $this->error('操作失败');
        }
    }
    public function resetuserpassword(){
        $uid = getparameter('uid');
        $user_data = [
            'password' => md5(123456),
            'updatetime' => time(),
        ];
        $res = db('user')->where('id',$uid)->update($user_data);
        if ($res) {
            $apiRes = [
                'code' => 0,
                'msg' => '密码重置成功'
            ];
        }else{
            $apiRes = [
                'code' => 1,
                'msg' => '系统繁忙'
            ];
        }
        return $apiRes;
    }
    
    
    
}