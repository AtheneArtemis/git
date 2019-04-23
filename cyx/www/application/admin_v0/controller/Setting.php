<?php
namespace app\admin\Controller;
use app\admin\Controller\Admin;
class Setting extends Admin {

 public function index(){
       return $this->fetch();
    }
}