<?php
namespace app\admin\model;
use app\admin\model\Index;
class Address extends Index{
    
    public function province(){
    	return $this->hasOne('District','id','province_id');
    }
    public function city(){
    	return $this->hasOne('District','id','city_id');
    }
    public function district(){
    	return $this->hasOne('District','id','district_id');
    }
}