<?php
namespace app\index\Controller;
use app\index\Controller\Index;
class Homepage extends Index {

 	public function index(){

 		$this->uploadurl = config('UPLOADIMG_URL');
 		$this->assign('uploadurl',$this->uploadurl);

 		$list = db('station')->where(['is_delete'=>0,'id'=>1,'status'=>1])->field('id,banner_title,banner_content,banner')->find();
        $banner = unserialize($list['banner']);
        $i=0;
        if (!empty($banner)) {
            foreach ($banner as $k1 => $v1) {
                $list['newbanner'][$i] = $v1;
                $i++;
            }
        }
 		$this->assign('list',$list);

 		$articlelist = db('article')->where(['is_delete'=>0,'status'=>2])->limit(2)->select();
 		$this->assign('articlelist',$articlelist);

       	return $this->fetch(request()->controller().'/index');
    }
}