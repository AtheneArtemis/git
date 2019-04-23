<?php
namespace app\admin\Controller;
use app\admin\Controller\Admin;
class Share extends Admin {

 public function index(){
       return $this->fetch();
    }
}