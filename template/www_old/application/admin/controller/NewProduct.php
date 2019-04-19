<?php
namespace app\admin\controller;
use app\admin\controller\Product;

class NewProduct extends Product{
    
    function _initialize(){
        parent::_initialize();
        $this->model = 'product';
        $this->controllername = '新品上架';
        $this->attr_id = 1;
        $this->title = '新品上架';

        $this->assign('title',$this->title);
        $this->assign('attr_id',$this->attr_id);
    }
    







    
}