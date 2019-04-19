<?php
namespace app\admin\controller;
use app\admin\controller\Base;
class Group extends Base{
    
    function _initialize(){
        
        parent::_initialize();
        $this->model = 'group';
        $this->controllername = '节点分组';
    }
    function index(){
        
        $list = db('group')->order('sort asc')->select();
        
        $this->assign('list',$list);
        return $this->fetch('index');
    }
}