<?php
namespace app\admin\controller;
use app\admin\controller\Publictable;
use app\common\RBAC;
use think\Db;
use think\Url;
class Index extends Publictable{

    protected function _initialize(){
        parent::_initialize();
        Url::root('/index.php');
        if (!session('?uid')){
            $this->redirect(url('Login/login'));
        }
        $notAuth = in_array(request()->module(), explode(',',config('NOT_AUTH_MODULE'))) || in_array(request()->controller(), explode(',', config('NOT_AUTH_ACTION')));
        if(config('USER_AUTH_ON')&& !$notAuth){
            if(!(RBAC::AccessDecision(request()->module()))){
                $this->error('没有权限');
            }
        }
        $sysset = [
            'storename' => '宸亦轩',
            'loginbg' =>dirname(config('UPLOADIMG_URL')).'/img/login-background.jpg'
        ];
        $this->assign('sysset',$sysset);
    }
    public function index(){
        
        if(session('?adminid')){
            $list = $this->getadminmenu();
            $this->assign('adminid',session('adminid'));
        }else{
            $list = $this->getmenu();
        }
        //获取分组前图标
        if (!empty($list)){
            foreach ($list as $key => $value){
                $list[$key]['icon'] = $this->geticon($value['name']);
            }
        }
        $this->assign('menu',$list);
        
        $ulist = model('user')->where('id',session('uid'))->field('id,nickname')->find();
       	$this->assign('ulist',$ulist);
        return $this->fetch(request()->controller().'/index');
    }
    function geticon($name){
        switch ($name){
            case 'system':$icon = 'fa-cog';break;
            default:$icon = 'fa-table';
        }
        return $icon;
    }
    function getadminmenu(){
        
        $module = db('group')->where('name','admin')->where('status','gt','0')->field('id')->order('sort asc')->select();
        $group = db('group')->where('parent_id',$module[0]['id'])->where('status','gt','0')->field('id,name,title,sort')->order('sort asc')->select();
        foreach ($group as $key => $value){
            $controllermap = [
                'status' => ['gt','0'],
                'group_id' => $value['id'],
                'level' => 2,
            ];
            $group[$key]['controller'] = db('node')->where($controllermap)->field('id,name,title,sort,pid')->order('sort asc')->select();
        }
        return $group;
    }
    function getmenu(){
        // Db方式权限数据
        $authId = session('uid');
        $uid = session('uid');
        $db     =   Db::connect(config('RBAC_DB_DSN'));
        $table = array('role'=>config('RBAC_ROLE_TABLE'),'user'=>config('RBAC_USER_TABLE'),'access'=>config('RBAC_ACCESS_TABLE'),'node'=>config('RBAC_NODE_TABLE'),'group'=>config('RBAC_GROUP_TABLE'),);
        $sql = "select `group`.id,`group`.name,`group`.title,`group`.sort from ".
            $table['role']." as role,".
            $table['user']." as user, `".
            $table['access']."` as access , `".
            $table['group']."` as `group` ".
            "where user.user_id='{$authId}' and user.role_id=role.id and `access`.role_id=role.id and `access`.module = 'group' and `access`.node_id = `group`.id and `group`.parent_id = 'vkqcwn1520320816oyqxml' order by `sort` asc";
            $apps =   $db->query($sql);
            //             dump($apps);
            $access =  array();
            foreach($apps as $key=>$app) {
                $appId	=	$app['id'];
                $appName	 =	 $app['id'];
                // 读取项目的控制器权限
                $access[strtoupper($appName)]   =  array();
                $sql    =   "select node.id,node.name,node.title,node.sort from ".
                    $table['role']." as role,".
                    $table['user']." as user,".
                    $table['access']." as access ,".
                    $table['node']." as node ".
                    "where user.user_id='{$authId}' and user.role_id=role.id and ( access.role_id=role.id  or (access.role_id=role.pid and role.pid!=0 ) ) and role.status=1 and access.node_id=node.id and node.level=2 and node.group_id='{$appId}' and node.status=1 order by sort";
                    $modules =   $db->query($sql);
                    $menu[$appName]['id'] = $appId;
                    $menu[$appName]['title'] = $app['title'];
                    $menu[$appName]['name'] = $app['name'];
                    $menu[$appName]['controller'] = $modules;
                    //                     dump($modules);
                    // 判断是否存在公共控制器的权限
                    $publicAction  = array();
                    foreach($modules as $key=>$module) {
                        $moduleId	 =	 $module['id'];
                        $moduleName = $module['name'];
                        if('PUBLIC'== strtoupper($moduleName)) {
                            $sql    =   "select node.id,node.name,node.title,node.sort from ".
                                $table['role']." as role,".
                                $table['user']." as user,".
                                $table['access']." as access ,".
                                $table['node']." as node ".
                                "where user.user_id='{$authId}' and user.role_id=role.id and ( access.role_id=role.id  or (access.role_id=role.pid and role.pid!=0 ) ) and role.status=1 and access.node_id=node.id and node.level=3 and node.pid='{$moduleId}' and node.status=1 order by sort";
                                $rs =   $db->query($sql);
                                foreach ($rs as $a){
                                    $publicAction[$a['name']]	 =	 $a['id'];
                                }
                                unset($modules[$key]);
                                break;
                        }
                    }
                    //                     dump($modules);
                    // 依次读取控制器的操作权限
                    foreach($modules as $key=>$module) {
                        $moduleId	 =	 $module['id'];
                        $moduleName = $module['name'];
                        $sql    =   "select node.id,node.name,node.title,node.sort from ".
                            $table['role']." as role,".
                            $table['user']." as user,".
                            $table['access']." as access ,".
                            $table['node']." as node ".
                            "where user.user_id='{$authId}' and user.role_id=role.id and ( access.role_id=role.id  or (access.role_id=role.pid and role.pid!=0 ) ) and role.status=1 and access.node_id=node.id and node.level=3 and node.pid='{$moduleId}' and node.status=1 order by sort";
                            $rs =   $db->query($sql);
                            //                             dump($rs);
                            $menu[$appName]['controller'][$key]['action'] = $rs;

                            $action = array();
                            foreach ($rs as $a){
                                $action[$a['name']]	 =	 $a['id'];
                            }
                            // 和公共模块的操作权限合并
                            $action += $publicAction;

                            $access[strtoupper($appName)][strtoupper($moduleName)]   =  array_change_key_case($action,CASE_UPPER);
                    }
            }
            session('accesslist',$menu);
            //             dump($menu);
            return $menu;
    }
    
    public function welcome(){

        return $this->fetch(request()->controller().'/welcome');
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}