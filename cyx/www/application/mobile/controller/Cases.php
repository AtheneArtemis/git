<?php
namespace app\mobile\Controller;
use app\mobile\Controller\Index;
class Cases extends Index{
 	public function index(){
       return $this->fetch();
    }
}