<?php
namespace app\admin\model;
use app\admin\model\Index;
class Withdraw extends Index{
    
    public function user(){
    	return $this->hasOne('User','id','user_id')->field('id,nickname,mobile');
    }
    public function withdrawAccount(){
    	return $this->hasOne('WithdrawAccount','id','withdraw_account_id')->field('id,user_id,name,mobile,wechat,alipay,bank_name,bank_account');
    }
}