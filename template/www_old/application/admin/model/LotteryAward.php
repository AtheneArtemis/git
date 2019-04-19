<?php
namespace app\admin\model;
use think\Model;
class LotteryAward extends Model {

    public function user(){
        return $this->hasOne('User','id','user_id')->field('id,nickname,avatar_url');
    }

    public function award(){
        return $this->hasOne('Award','id','award_id')->field('id,name');
    }
    public function address(){
    	return $this->hasOne('Address','id','address_id');
    }
}