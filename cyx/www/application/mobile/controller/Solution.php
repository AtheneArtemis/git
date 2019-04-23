<?php
namespace app\mobile\Controller;
use app\mobile\Controller\Index;
class Solution extends Index {
 public function index(){
 	
       return $this->fetch();
    }
}