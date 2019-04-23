<?php
namespace app\eastshop\model;
use app\eastshop\model\Index;
class Address extends Index{
    

	public function province(){
		return $this->hasOne('District','id','province_id')->field('id,name');
	}
	public function city(){
		return $this->hasOne('District','id','city_id')->field('id,name');
	}
	public function district(){
		return $this->hasOne('District','id','district_id')->field('id,name');
	}


    
}