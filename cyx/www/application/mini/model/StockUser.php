<?php
namespace app\eastshop\model;
use app\eastshop\model\Index;
use app\eastshop\model\Stock;
class StockUser extends Index{
    
	public function stock(){
		return $this->hasOne('Stock','id','stock_id')->field('id,name,price,number,stock_profit,switch_btn,sort');
	}
	


    
}