<?php
namespace app\index\Controller;
use think\Controller;
class Index extends Controller {

	protected $uploadurl;
	public function _initialize(){

		\think\Url::root('/index.php');

		$station = db('station')->where(['id'=>1])->find();
 		$this->assign('station',$station);

 		$this->uploadurl = config('UPLOADIMG_URL');
 		$this->assign('uploadurl',$this->uploadurl);
	}

    public function index(){
        echo "hello world";
    }
}