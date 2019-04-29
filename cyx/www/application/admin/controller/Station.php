<?php
namespace app\admin\controller;
use app\admin\controller\Base;
class Station extends Base{

	protected function _initialize(){
		parent::_initialize();
        $this->model = 'station';
        $this->controllername = '站点信息';
	}
    
    public function index(){

    	$list = db('station')->where(['is_delete'=>0,'id'=>1])->find();
    	$this->assign('list',$list);

    	return $this->fetch(request()->controller().'/index');
    }
    
}