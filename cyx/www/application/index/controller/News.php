<?php
namespace app\index\Controller;
use app\index\Controller\Index;
class News extends Index{
 public function index(){
       return $this->fetch();
    }
     public function article(){
       return $this->fetch();
    }
}