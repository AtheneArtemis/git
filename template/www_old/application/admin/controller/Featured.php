<?php
namespace app\admin\controller;
use app\admin\controller\Product;

class Featured extends Product{
    
    function _initialize(){
        parent::_initialize();
        $this->model = 'product';
        $this->controllername = '精选商品';
        $this->attr_id = 3;
        $this->title = '精选商品';

        $this->assign('title',$this->title);
        $this->assign('attr_id',$this->attr_id);
    }
    







    
}