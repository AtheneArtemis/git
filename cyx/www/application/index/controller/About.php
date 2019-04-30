<?php
namespace app\index\Controller;
use app\index\Controller\Index;
class About extends Index{
 	public function index(){

 		$about = db('station')->where(['is_delete'=>0,'id'=>2])->find();
 		$loginbg = unserialize($about['loginbg']);
        $i=0;
        if (!empty($loginbg)) {
            foreach ($loginbg as $k1 => $v1) {
                $about['newloginbg'][$i] = $v1;
                $i++;
            }
        }
 		$this->assign('about',$about);
       	return $this->fetch(request()->controller().'/'.request()->action());
    }
}