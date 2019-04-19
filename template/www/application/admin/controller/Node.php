<?php
/**
* 文件用途描述
* @date: 2017年8月14日 下午2:46:11
* @description:节点控制器
* @author: Administrator：chenkeyu
*/
namespace app\admin\controller;
use app\admin\controller\Base; 
class Node extends Base{
    
    function _initialize(){
        parent::_initialize();
        $this->model = 'Node';
        $this->controllername = '节点管理';
    }
    Public function index(){
        
        
        $gmodel = db('group');
        $nmodel = db('node');
        $modulemap = [
            'parent_id' => 'app',
            'status' => ['gt','0'],
        ];
        $module = $gmodel->where($modulemap)->field('id,name,title')->select();
        foreach ($module as $k1 => $v1){
            $group[$k1]['id'] = $v1['id'];
            $group[$k1]['name'] = $v1['name'];
            $group[$k1]['title'] = $v1['title'];
            $groupmap = [
                'status' => ['gt','0'],
                'parent_id' => $v1['id'],
            ];
            $group[$k1]['group']  = $gmodel->where($groupmap)->field('id,name,title')->order('sort asc')->select();
            foreach ($group[$k1]['group'] as $k2 => $v2){
                $controllermap = [
                    'status' => ['gt','0'],
                    'group_id' => $v2['id'],
                    'level' => 2
                ];
                $group[$k1]['group'][$k2]['controller'] = $nmodel->where($controllermap)->field('id,name,title,sort,pid')->order('sort asc')->select();
                foreach ($group[$k1]['group'][$k2]['controller'] as $k3 => $v3){
                    $actionmap = [
                        'status' => ['gt','0'],
                        'group_id' => $v2['id'],
                        'level' => 3,
                        'pid' => $v3['id']
                    ];
                    $group[$k1]['group'][$k2]['controller'][$k3]['action'] = $nmodel->where($actionmap)->field('id,name,title,sort,pid')->order('sort asc')->select();
                    
                }
            }
        }
        if (!empty($group)){$this->getAccessHtml($group);}
        $this->assign('group',$group);
        return $this->fetch(request()->controller().'/index');
    }
    function getAccessHtml($module){
        $nodelist = '';
        //模块start
        $nodelist = '<ul class="nav nav-tabs" role="tablist">';
        foreach ($module as $mk => $mv){
            $nodelist .= '<li role="presentation"><input type="checkbox" value="'.$mv["id"].'_m" class="nodeCheckbox"/><a href="#'.$mv["name"].'" aria-controls="profile" role="tab" data-toggle="tab" style="font-size:16px;">'.$mv["title"].'</a></li>';
        }
        $nodelist .= '</ul><div class="tab-content" style="padding:40px 0px 20px;">';
        foreach ($module as $mk => $mv){
            $nodelist .= '<div role="tabpanel" class="tab-pane" id="'.$mv["name"].'">';
            //分组start
            $nodelist .= '<ul class="nav nav-tabs" role="tablist">';
            foreach ($mv['group'] as $gk => $gv){
                $nodelist .= '<li role="presentation"><input type="checkbox" value="'.$gv["id"].'_g" class="nodeCheckbox"/><a href="#'.$gv["name"].'" aria-controls="profile" role="tab" data-toggle="tab" style="font-size:16px;">'.$gv["title"].'</a></li>';
            }
            $nodelist .= '</ul><div class="tab-content">';
            foreach ($mv['group'] as $gk => $gv){
                $nodelist .= '<div role="tabpanel" class="tab-pane" id="'.$gv["name"].'" style="padding:20px 0px;">';
                //控制器start
                foreach ($gv["controller"] as $ck => $cv){
                    $nodelist .= '<div class="controller"><input type="checkbox" value="'.$cv["id"].'_c" style="margin:0px 10px;"/>'.$cv["title"].'</div>';
                    //操作start
                    $nodelist .= '<div class="actionframe">';
                    foreach ($cv["action"] as $ak => $av){
                        $nodelist .= '<div class="action"><input type="checkbox" value="'.$av["id"].'_a" style="margin:0px 10px;"/>'.$av["title"].'</div>';
                    }
                    $nodelist .= '<div style="clear:both;"></div></div><div style="clear:both;"></div>';
                    //操作end
                }
                //控制器end
                $nodelist .= '</div><div style="clear:both;"></div>';
            }
            $nodelist .= '</div>';
            //分组end
            $nodelist .= '</div>';
        }
        $nodelist .= '</div>';
        //模块end
        $this->assign('nodelist',$nodelist);
    }
    function add(){
        
        $id = getparameter('id');
        if (empty($id)){
            //添加模块
            $list['nodetype'] = 'm';
            $list['pid'] = 'app';
            $list['level'] = '1';
        }elseif (strpos($id,'_m') !== false){
            //添加分组
            $mid = explode('_',$id);
            $mlist = db('group')->where('id',$mid[0])->field('id,parent_id,name,title,status,sort')->find();
            $list['nodetype'] = 'g';
            $list['pid'] = $mlist['id'];
        }elseif (strpos($id,'_g') !== false){
            //添加控制器
            $cid = explode('_',$id);
            $clist = db('group')->where('id',$cid[0])->field('id,parent_id,name,title,status,sort')->find();
            $list['nodetype'] = 'c';
            $list['pid'] = $clist['parent_id'];
            $list['group_id'] = $clist['id'];
            $list['level'] = '2';
        }elseif (strpos($id,'_c') !== false){
            //添加控制器
            $aid = explode('_',$id);
            $alist = db('node')->where('id',$aid[0])->field('id,pid,name,title,status,sort,level,group_id')->find();
            $list['nodetype'] = 'a';
            $list['pid'] = $alist['id'];
            $list['group_id'] = $alist['group_id'];
            $list['level'] = '3';
        }
        switch ($list['nodetype']){
            case 'm': $type = '模块';break;
            case 'g': $type = '分组';break;
            case 'c': $type = '控制器';break;
            case 'a': $type = '操作';break;
            default:$type = '未定义';$this->error('该项不能再添加下级！');
        }
        $this->assign('list',$list);
        $this->assign('type',$type);
        return $this->fetch(request()->controller().'/add');
    }
    function insert(){
        $plist = getparameter('post.');
        $nodeid = generateprimerykey();
        $gdata = [
            'id' => $nodeid,
            'name' => $plist['name'],
            'title' => $plist['title'],
            'parent_id' => $plist['pid'],
            'sort' => $plist['sort'],
            'status' => $plist['status'],
        ];
        $ndata = [
            'id' => $nodeid,
            'name' => $plist['name'],
            'title' => $plist['title'],
            'pid' => $plist['pid'],
            'sort' => $plist['sort'],
            'status' => $plist['status'],
            'level' => $plist['level'],
            'group_id' => $plist['group_id'],
        ];
        if (strcmp($plist['nodetype'],'m') ===0){
            //添加模块
            $tdata['node'] = [
                'operate' => 'insert',
                'data' => $ndata,
            ];
            $tdata['group'] = [
                'operate' => 'insert',
                'data' => $gdata,
            ];
            $operate = '添加模块';
        }elseif (strcmp($plist['nodetype'],'g') ===0){
            //添加分组
            $tdata['group'] = [
                'operate' => 'insert',
                'data' => $gdata,
            ];
            $operate = '添加分组';
        }else{
            //添加控制器、操作
            $tdata['node'] = [
                'operate' => 'insert',
                'data' => $ndata,
            ];
            $operate = '添加控制器、操作';
        }
        $sprdata = $this->saveOperateRecord($operate, $nodeid,serialize($tdata['node']['data']));
        $tdata['dboperationhistory'] = [
            'operate' => 'insert',
            'data' => $sprdata,
        ];
        $result = $this->transevent($tdata);
        if ($result['code'] == 0){
            $this->success('操作成功',url(request()->controller().'/index'));
        }else{
            $this->error('操作失败');
        }
    }
    function edit(){
        
        $ids = getparameter('id');
        $id = explode('_',$ids);
        if (strcmp($id[1],'m') ===0 || strcmp($id[1],'g') ===0){
            $list = db('group')->where('id',$id[0])->find();
            $list['nodetype'] = $id[1];
        }else{
            $list = db('node')->where('id',$id[0])->find();
            $list['nodetype'] = $id[1];
        }
        switch ($list['nodetype']){
            case 'm': $type = '模块';break;
            case 'g': $type = '分组';break;
            case 'c': $type = '控制器';break;
            case 'a': $type = '操作';break;
            default:$type = '未定义';$this->error('该项不能再添加下级！');
        }
        $this->assign('list',$list);
        $this->assign('type',$type);
        return $this->fetch(request()->controller().'/edit');
    }
    function update(){
        $plist = getparameter('post.');
        $nodeid = $plist['id'];
        $gdata = [
            'id' => $nodeid,
            'name' => $plist['name'],
            'title' => $plist['title'],
            'parent_id' => $plist['pid'],
            'sort' => $plist['sort'],
            'status' => $plist['status'],
        ];
        $ndata = [
            'id' => $nodeid,
            'name' => $plist['name'],
            'title' => $plist['title'],
            'pid' => $plist['pid'],
            'sort' => $plist['sort'],
            'status' => $plist['status'],
            'level' => $plist['level'],
            'group_id' => $plist['group_id'],
        ];
        if (strcmp($plist['nodetype'],'m') ===0){
            //修改模块
            $tdata['node'] = [
                'operate' => 'update',
                'data' => $ndata,
                'map' => ['id'=>$nodeid]
            ];
            $tdata['group'] = [
                'operate' => 'update',
                'data' => $gdata,
                'map' => ['id'=>$nodeid]
            ];
            $operate = '修改模块';
        }elseif (strcmp($plist['nodetype'],'g') ===0){
            //修改分组
            $tdata['group'] = [
                'operate' => 'update',
                'data' => $gdata,
                'map' => ['id'=>$nodeid]
            ];
            $operate = '修改分组';
        }else{
            //修改控制器、操作
            $tdata['node'] = [
                'operate' => 'update',
                'data' => $ndata,
                'map' => ['id'=>$nodeid]
            ];
            $operate = '修改控制器、操作';
        }
        $sprdata = $this->saveOperateRecord($operate, $nodeid,serialize($tdata['node']['data']));
        $tdata['dboperationhistory'] = [
            'operate' => 'insert',
            'data' => $sprdata,
        ];
        $result = $this->transevent($tdata);
        if ($result['code'] == 0){
            $this->success('操作成功',url(request()->controller().'/index'));
        }else{
            $this->error('操作失败',url(request()->controller().'/index'));
        }
    }
    
    function delete(){
    
        $info = url(request()->controller() . '/index');
        $id = getparameter('id');
        $ids = explode('_',$id);
        $data['status'] = '-1';
        if (strcmp($ids[1],'g') ===0 || strcmp($ids[1],'m') ===0){
            $model = 'group';
        }else{
            $model = 'node';
        }
        $ret = db($model)->where('id',$ids[0])->update($data);
        if ($ret){
            $this->result($info,1,'删除成功','json');
        }else{
            $this->result($info,0,'删除失败','json');
        }
    }
    function validnode(){
        $name = getparameter('name');
        $param = getparameter('param');
        $result = db('node')->where($name,$param)->select();
        $results = db('group')->where($name,$param)->select();
        if (empty($result) && empty($results)){
            //不存在
            $ret = [
                'info' => '',
                'status' => 'y',
            ];
            echo json_encode($ret);
        }else{
            //已存在
            $ret = [
                'info' => '名称已存在',
                'status' => 'n',
            ];
            echo json_encode($ret);
        }
    }
    function valideditnode(){
        $name = getparameter('name');
        $param = getparameter('param');
        $result = db('node')->where($name,$param)->select();
        $results = db('group')->where($name,$param)->select();
        if (empty($result) && empty($results)){
            //不存在
            $ret = [
                'info' => '',
                'status' => 'y',
            ];
            echo json_encode($ret);
        }elseif (count($result)==1 || count($results)==1){
            //不存在
            $ret = [
                'info' => '',
                'status' => 'y',
            ];
            echo json_encode($ret);
        }else{
            //已存在
            $ret = [
                'info' => '名称已存在',
                'status' => 'n',
            ];
            echo json_encode($ret);
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}