<?php
namespace app\mobile\Controller;
use app\mobile\Controller\Base;
class Homepage extends Base {

	public function __construct()
 	{
 		parent::__construct();
    }

 	public function index(){
       	return $this->fetch();
    }
}