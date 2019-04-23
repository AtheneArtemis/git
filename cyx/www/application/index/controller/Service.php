<?php
namespace app\index\Controller;
use app\index\Controller\Index;
class Service extends Index {
 public function index(){
       return $this->fetch();
    }
}