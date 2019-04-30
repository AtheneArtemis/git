<?php
namespace app\index\Controller;
use app\index\Controller\Index;
class Service extends Index {
 	public function index(){

 		$flow = db('flow')->where(['is_delete'=>0])->order('sort')->select();
 		$this->assign('flow',$flow);

 		$advantage = db('advantage')->where(['is_delete'=>0])->order('sort')->select();
 		$this->assign('advantage',$advantage);

 		$customization = db('customization')->where(['is_delete'=>0])->order('sort')->select();
 		$this->assign('customization',$customization);

 		$title = db('servicetitle')->where(['is_delete'=>0])->select();
 		foreach ($title as $k1 => $v1) {
 			if (strcmp($v1['tablename'],'flow') === 0) {
 				$flowtitle = $v1;
 			}elseif (strcmp($v1['tablename'],'advantage') === 0) {
 				$advantagetitle = $v1;
 			}elseif (strcmp($v1['tablename'],'customization') === 0) {
 				$customizationtitle = $v1;
 			}
 		}
 		
 		$this->assign('flowtitle',$flowtitle);
 		$this->assign('advantagetitle',$advantagetitle);
 		$this->assign('customizationtitle',$customizationtitle);

       	return $this->fetch(request()->controller().'/'.request()->action());
    }
}