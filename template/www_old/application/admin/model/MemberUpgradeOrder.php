<?php
namespace app\admin\model;
use think\Model;
class MemberUpgradeOrder extends Model {

    public function user(){
        return $this->hasOne('User','id','user_id')->field('id,nickname');
    }
    public function address(){
    	return $this->hasOne('Address','id','address_id');
    }
    public function product(){
    	return $this->hasOne('Product','id','product_id');
    }
}