<?php
namespace app\admin\model;
use app\admin\model\Index;
class AwardRecord extends Index{
    
    public function user(){
    	return $this->hasOne('User','id','user_id')->field('id,nickname');
    }
    public function award(){
    	return $this->hasOne('Award','id','award_id')->field('id,name');
    }
    public function address(){
    	return $this->hasOne('Address','id','address_id');
    }
}