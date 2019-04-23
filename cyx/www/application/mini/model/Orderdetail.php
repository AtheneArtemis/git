<?php
namespace app\eastshop\model;
use app\eastshop\model\Index;
class Orderdetail extends Index{
    

	public function product(){
		return $this->hasOne('Product','id','product_id')->field('id,name,price,share_commission');
	}


    
}