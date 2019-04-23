<?php
namespace app\admin\Controller;
use app\admin\Controller\Admin;
class Activity extends Admin {

	public function index(){
		return $this->fetch();
	}
 public function add(){
       return $this->fetch();
    }
	public function check(){
       return $this->fetch();
    }


}