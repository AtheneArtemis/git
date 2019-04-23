<?php
namespace app\admin\Controller;
use app\admin\Controller\Admin;

class Homepage extends Admin {
 	public function index(){
       	
 		return $this->fetch();
    }

}