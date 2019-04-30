<?php
namespace app\index\Controller;
use think\Controller;
class Index extends Controller {

	protected $uploadurl;
	public function _initialize(){

		\think\Url::root('/index.php');

		$this->uploadurl = config('UPLOADIMG_URL');
 		$this->assign('uploadurl',$this->uploadurl);

		$station = db('station')->where(['id'=>1])->find();
 		$station['logo'] = $this->uploadurl.$station['logo'];
 		$station['icon'] = $this->uploadurl.$station['icon'];
 		$banner = unserialize($station['banner']);
        $i=0;
        if (!empty($banner)) {
            foreach ($banner as $k1 => $v1) {
                $station['newbanner'][$i] = $v1;
                $i++;
            }
        }
 		$this->assign('station',$station);
	}

    public function index(){
        echo "hello world";
    }
}