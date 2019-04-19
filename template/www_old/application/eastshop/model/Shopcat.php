<?php
namespace app\eastshop\model;
use app\eastshop\model\Index;
class Shopcat extends Index{
    

	public function product(){
		return $this->hasOne('Product','id','product_id');
	}


    
}