<?php
namespace app\eastshop\model;
use app\eastshop\model\Index;
class User extends Index{
    

	public function userlevel(){
		return $this->hasOne('Userlevel','id','userlevel_id')->field('id,name');
	}


    
}