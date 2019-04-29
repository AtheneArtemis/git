<?php
namespace app\admin\model;
use app\admin\model\Index;
class Customer extends Index{
    
    public function customertype(){
    	return $this->hasOne('Customertype','id','customertype_id')->field('id,name');
    }
}