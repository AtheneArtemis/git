<?php
namespace app\admin\Controller;
use app\admin\Controller\Admin;
class Question extends Admin {

 public function index(){
       return $this->fetch();
    }
	 public function add(){
       return $this->fetch();
    }
}