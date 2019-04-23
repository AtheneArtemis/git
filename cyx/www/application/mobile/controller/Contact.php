<?php
namespace app\mobile\Controller;
use app\mobile\Controller\Index;
class Contact extends Index {
 public function index(){
       return $this->fetch();
    }
}