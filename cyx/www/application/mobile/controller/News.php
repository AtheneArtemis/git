<?php
namespace app\mobile\Controller;
use app\mobile\Controller\Index;
class News extends Index{
 public function index(){
       return $this->fetch();
    }
     public function article(){
       return $this->fetch();
    }
}