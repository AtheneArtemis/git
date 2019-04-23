<?php
namespace app\admin\Controller;
use app\admin\Controller\Admin;
class Statistics extends Admin {

 public function index(){
       return $this->fetch();
    }
	 
}