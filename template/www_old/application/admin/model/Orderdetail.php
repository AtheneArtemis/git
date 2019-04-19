<?php
namespace app\admin\model;
use think\Model;
class Orderdetail extends Model {

    public function product(){
    	return $this->hasOne('Product','id','product_id');
    }
}