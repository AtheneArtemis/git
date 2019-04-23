<?php
namespace app\mobile\Controller;
use app\mobile\Controller\Index;
class About extends Index{
 public function index(){
       return $this->fetch();
    }
}