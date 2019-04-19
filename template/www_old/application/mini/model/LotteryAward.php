<?php
namespace app\eastshop\model;
use app\eastshop\model\Index;
class LotteryAward extends Index{
    
	public function awardinfo(){
		return $this->hasOne('Award','id','award_id')->field('id,name');
	}
	


    
}