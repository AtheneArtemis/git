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

       	return $this->fetch(request()->controller().'/'.request()->action());
    }
    public function article(){

    	$id = getparameter('id');

    	$article = db('article')->where(['is_delete'=>0,'id'=>$id])->find();
    	$article['createtime'] = date('Y-m-d',$article['createtime']);
    	$article['publishtime'] = date('Y-m-d',$article['publishtime']);

    	$prvId = intval($id) - 1;
    	$prvArticle = db('article')->where(['id'=>$prvId])->find();
    	$this->assign('prvArticle',$prvArticle);

    	$nextId = intval($id) + 1;
    	$nextArticle = db('article')->where(['id'=>$nextId])->find();
    	$this->assign('nextArticle',$nextArticle);

    	$this->assign('article',$article);

       	return $this->fetch(request()->controller().'/'.request()->action());
    }
}