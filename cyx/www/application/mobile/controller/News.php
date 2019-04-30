<?php
namespace app\mobile\Controller;
use app\mobile\Controller\Base;
class News extends Base{
 	public function index(){
       return $this->fetch();
    }

     public function article(){
       	return $this->fetch();
    }
}