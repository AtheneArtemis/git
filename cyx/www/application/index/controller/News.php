<?php
namespace app\index\Controller;
use app\index\Controller\Index;
class News extends Index{
 	public function index(){

 		$page = getparameter('page');
 		if (empty($page)) {
 			$page = 1;
 		}
 		$fields = '';
 		$map = [
 			'is_delete' => 0,
 			'status' => 2,
 		];
 		// $list = db('article')->where($map)->field($fields)->order('updatetime desc')->limit(10)->page($page)->select();
 		$list = model('article')->where($map)->field($fields)->order('publishtime desc')->paginate(10);
 		$this->assign('list',$list);

 		$this->assign('page', $list->render());

       	return $this->fetch();
    }
    public function article(){
       	return $this->fetch();
    }
}