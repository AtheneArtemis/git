<?php
namespace app\admin\model;
use think\Model;
class LotteryApply extends Model {

    public function user(){
        
        return $this->hasOne('User','id','user_id')->field('id,nickname,avatar_url');
    }

}