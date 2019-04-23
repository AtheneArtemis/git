<?php
namespace app\admin\Controller;
use think\Controller;
class Index extends Controller {

	public function _initialize(){

		\think\Url::root('/index.php');
	}
}