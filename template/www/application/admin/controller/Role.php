<?php
namespace app\admin\controller;
use app\admin\controller\Base;
class Role extends Base{
    
    function _initialize(){
        parent::_initialize();
        $this->model = 'role';
        $this->modelname = 'role';
        $this->controllername = '角色管理';
    }
    Public function index(){
        $role = db('role')->where('status','gt','0')->select();
        foreach ($role as $key =>$value){
            $role[$key]['number'] = $key + 1;
        }
        $this->assign('list',$role);
        return $this->fetch("Role/index");
    }
    function _generatetabledatahtml($html,$id=null){
        $model = model("user");
        $value = $model->where("id",$id)->relation("province,city,zone,whetheridentified")->find();
        $createtime = date('Y-m-d H:i:s',$value["createtime"]);
        if(strcmp($value["account"],"admin") === 0) $createtime = "";
    
        $roles = getuserroles($id);
        if(empty($roles)) {
            $roles = '--';
        }
        $html = $html.'
    		<tr>
    			<td class="bs-checkbox"><input data-index="3" name="btSelectItem" type="checkbox" value="'.$value["id"].'"></td>
    			<td>'.$value["account"].'</td>
    			<td>'.$value["nickname"].'</td>
    			<td>'.$value["company"]["name"].'</td>
			    <td>'.$roles.'</td>
    		</tr>';
        return $html;
    }
    function _user_filter(&$map,&$querycond){
        $map["status"] = array('gt','0');
        $map["account"] = array('neq','admin');
        $usertypeid = getparameter('usertypeid');
        if (!empty($usertypeid)){
            if (strcmp('-10000',$usertypeid) !==0){
                $map['usertype_id'] = $usertypeid;
            }
        }
        $provinceid = getparameter('provinceid');
        if (!empty($provinceid)){
            if (strcmp('-10000',$provinceid) !==0){
                $map['province_id'] = $provinceid;
            }
        }
        $cityid = getparameter('cityid');
        if (!empty($cityid)){
            if (strcmp('-10000',$cityid) !==0){
                $map['city_id'] = $cityid;
            }
        }
        $zoneid = getparameter('zoneid');
        if (!empty($zoneid)){
            if (strcmp('-10000',$zoneid) !==0){
                $map['zone_id'] = $zoneid;
            }
        }
        $account = getparameter('account');
        if (!empty($account)){
            $map['account'] = array("like","%".$account."%");
        }
    }
    
    function add() {
    	return $this->fetch(request()->controller().'/add');
    }
    
    //详情页面
    function detail(){
        $id = getparameter('id');
        $roleinfo = db('role')->where('id',$id)->find();
        $this->assign('roleinfo',$roleinfo);
        
        $userlist = model('RoleUser')->relation('users')->where('role_id',$id)->paginate(20);
        foreach ($userlist as $key => $value){
        	$userid = $value["user_id"];
        	$usertypeid = gettablecolumnvaluebyid("user","usertype_id",$userid);
        	$userlist[$key]["usertype"] = getenumname("usertype",$usertypeid);
        	$userlist[$key]["username"] = getuserrealname($userid);
        }
        $this->assign('userlist',$userlist);
        $this->assign('page', $userlist->render());
        
        return $this->fetch(request()->controller().'/detail');
    }
    //添加用户
    function addUser(){
        $roleid = getparameter('role_id');
        $roleinfo = db('role')->where('id',$roleid)->find();
        $this->assign('roleinfo',$roleinfo);
        
        $usertypelist = getenumerationlist('usertype');
        $this->assign('usertypelist',$usertypelist);
        
        $this->_user_filter($map,$querycond);
        $this->_index("user",$map);
        
        $this->getinitprovincecityzonelist(true);
        return $this->fetch(request()->controller().'/addUser');
    }
    function insertuser(){
        $userarray = getparameter('userarray/a');
        $roleid = getparameter('role_id');
        foreach ($userarray as $key => $value){
            if (strcmp($value, 'on') !== 0){
                $data[$key] = array(
                    'role_id' => $roleid,
                    'user_id' => $value,
                    'status' => 1,
                );
            }
        }
        $ret = db('role_user')->insertAll($data);
        if($ret){
            $this->result('',1,'为角色添加用户成功','json');
        }else{
            $this->result('',0,'系统繁忙','json');
        }
        
    }
    function deleteuser(){
        $userid = getparameter('user_id');
        $roleid = getparameter('role_id');
        $model = db('RoleUser');
        
        $map = array(
            'user_id' => $userid,
            'role_id' => $roleid,
        );
        $ret = $model->where($map)->delete();
        if($ret){
            $this->result('',1,'移除用户成功','json');
        }else{
            $this->result('',0,'系统繁忙','json');
        }
    
    }
    function access(){
        
        $roleid = getparameter('roleid');
        $rlist = db('role')->where('id',$roleid)->find();
        $this->assign('rlist',$rlist);
        $this->assign('roleid',$roleid);
        $accessmodel = db('access');
        $groupmodel = db('group');
        
        $modulemap = [
            'parent_id' => 'app',
            'status' => ['gt','0'],
        ];
        $module = $groupmodel->where($modulemap)->field('id,name,title')->select();
        foreach ($module as $ko => $vo){
            $groupmap = [
                'parent_id' => $vo['id'],
                'status' => ['gt','0'],
            ];
            $module[$ko]['group'] = $groupmodel->where($groupmap)->field('id,name,title')->order('sort asc')->select();
            foreach ($module[$ko]['group'] as $key => $value){
                $groupischecked = $accessmodel->where('node_id',$value['id'])->where('role_id',$roleid)->find();
                if (!empty($groupischecked)){
                    $module[$ko]['group'][$key]['Rbacstatus'] = 1;
                }else{
                    $module[$ko]['group'][$key]['Rbacstatus'] = 0;
                }
                $controllermap = [
                    'status' => ['gt','0'],
                    'group_id' => $value['id'],
                    'level' => 2
                ];
                $module[$ko]['group'][$key]['controller'] = db('node')->where($controllermap)->field('id,name,title,sort,pid')->order('sort asc')->select();
                foreach ($module[$ko]['group'][$key]['controller'] as $k => $v){
                    $groupischecked = $accessmodel->where('node_id',$v['id'])->where('role_id',$roleid)->find();
                    if (!empty($groupischecked)){
                        $module[$ko]['group'][$key]['controller'][$k]['Rbacstatus'] = 1;
                    }else{
                        $module[$ko]['group'][$key]['controller'][$k]['Rbacstatus'] = 0;
                    }
                    $actionmap = [
                        'status' => ['gt','0'],
                        'group_id' => $value['id'],
                        'level' => 3,
                        'pid' => $v['id']
                    ];
                    $module[$ko]['group'][$key]['controller'][$k]['action'] = db('node')->where($actionmap)->field('id,name,title,sort,pid')->order('sort asc')->select();
                    foreach ($module[$ko]['group'][$key]['controller'][$k]['action'] as $ke => $vo){
                        $groupischecked = $accessmodel->where('node_id',$vo['id'])->where('role_id',$roleid)->find();
                        if (!empty($groupischecked)){
                            $module[$ko]['group'][$key]['controller'][$k]['action'][$ke]['Rbacstatus'] = 1;
                        }else{
                            $module[$ko]['group'][$key]['controller'][$k]['action'][$ke]['Rbacstatus'] = 0;
                        }
                    }
                }
            }
        }
        $this->assign('module',$module);
        return $this->fetch(request()->controller().'/access');
    }
    function setAccess(){
        
        $access = getparameter('access/a');
        $roleid = getparameter('roleid');
        $module = db('group')->where('parent_id','app')->field('id')->select();
        foreach ($module as $k => $v){
            $mdata[$k] = [
                'role_id' => $roleid,
                'node_id' => $v['id'],
                'level' => 1,
                'pid' => 0,
                'module' => 'modulename'
            ];
        }
        $db = db('access');
        $db->where('role_id',$roleid)->delete();
        foreach ($access as $key => $value){
            if (strpos($value, '-')){
                $nodeinfo = explode('-',$value);
                $ndata[$key] = [
                    'role_id' => $roleid,
                    'node_id' => $nodeinfo[0],
                    'level' => $nodeinfo[1]
                ];
            }else{
                $ndata[$key] = [
                    'role_id' => $roleid,
                    'node_id' => $value,
                    'level' => '-1',
                    'module' => 'group'
                ];
            }
        }
        // var_dump($ndata);die;
        if (!empty($mdata) && !empty($ndata)){
            $data = array_merge($mdata,$ndata);
        }else{
            $this->result('',0,'系统繁忙','json');
        }
        $ret = model('Access')->saveAll($data);
        if($ret){
            $this->result('',1,'授权成功','json');
        }else{
            $this->result('',0,'系统繁忙','json');
        }
    }
    
    function delete(){
        $info = url(request()->controller() . '/index');
        $id = getparameter('id');
        //有几种角色是系统固定的，不能删除
        $systefixmrole = array("firstleveldistributor","distributor","electrician","companyshop","personalshop");
        if(in_array($id,$systefixmrole)) {
        	$rolename = gettablecolumnvaluebyid("role","name",$id);
        	$this->result('',0,$rolename.' 为系统固定角色，不能删除','json');
        	return;
        }
        $data['status'] = '-1';
        $data['updatetime'] = time();
        $ret = db($this->model)->where('id',$id)->update($data);
        if ($ret){
            $this->result($info,1,'删除成功','json');
        }else{
            $this->result($info,0,'删除失败','json');
        }
    }
    function insert(){
        $plist = getparameter('post.');
        $data = [
            'id' => generateprimerykey(),
            'name' => $plist['name'],
            'remark' => $plist['remark'],
            'status' => $plist['status'],
            'createtime' => $plist['createtime'],
        ];
        $ret = db('role')->insert($data);
        if ($ret){
            $this->success('添加成功',url(request()->controller().'/index'));
        }else{
            $this->error('系统繁忙');
        }
    }
    function shiftdelete(){
        $action = request()->controller();
        $info = url($action . '/index');
        $id = getparameter('id');
    	//有几种角色是系统固定的，不能删除
        $systefixmrole = array("firstleveldistributor","distributor","electrician","companyshop","personalshop");
        if(in_array($id,$systefixmrole)) {
        	$rolename = gettablecolumnvaluebyid("role","name",$id);
        	$this->result('',0,$rolename.' 为系统固定角色，不能删除','json');
        	return;
        }
        //_shiftdelete
        $result = db('role')->where('id',$id)->delete();
        if ($result){
            $this->result($info,1,'删除成功','json');
        }else{
            $this->result($info,0,'删除失败','json');
        }
    }
    
}