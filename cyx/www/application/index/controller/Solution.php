<?php
namespace app\index\Controller;
use app\index\Controller\Index;
class Solution extends Index {
 	public function index(){

 		// $page = getparameter('page');
 		// if (empty($page)) {
 		// 	$page = 1;
 		// }
 		$fields = '';
 		$map = [
 			'is_delete' => 0,
 			'status' => 2,
 		];
 		// $list = db('article')->where($map)->field($fields)->order('updatetime desc')->limit(10)->page($page)->select();
 		$list = model('article')->where($map)->field($fields)->order('publishtime desc')->paginate(10);
 		$this->assign('list',$list);

 		$this->assign('page', $list->render());

 		$articletypemodel = db('articletype');
 		$gid = $articletypemodel->where(['is_delete'=>0,'name'=>'solution','type'=>'group'])->find();
 		$articletype = $articletypemodel->where(['is_delete'=>0,'gid'=>$gid['id'],'level'=>1])->select();
 		foreach ($articletype as $k1 => &$v1) {
 			$v1['subtype'] = $articletypemodel->where(['is_delete'=>0,'pid'=>$v1['id'],'level'=>2])->select();
 		}
 		$this->assign('articletype',$articletype);
 	
       	return $this->fetch(request()->controller().'/'.request()->action());
    }
}