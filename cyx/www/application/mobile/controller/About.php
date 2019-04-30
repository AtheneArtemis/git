<?php
namespace app\mobile\Controller;
use app\mobile\Controller\Base;

class About extends Base{
 public function index(){
       return $this->fetch();
    }
}