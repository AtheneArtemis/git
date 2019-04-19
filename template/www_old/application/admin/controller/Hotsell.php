<?php
namespace app\admin\controller;
use app\admin\controller\Product;

class Hotsell extends Product{
    
    function _initialize(){
        parent::_initialize();
        $this->model = 'product';
        $this->controllername = 'TOP热销';
        $this->attr_id = 2;
        $this->title = 'TOP热销';

        $this->assign('title',$this->title);
        $this->assign('attr_id',$this->attr_id);
    }
    







    
}