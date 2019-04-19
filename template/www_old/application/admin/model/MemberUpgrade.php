<?php
namespace app\admin\model;
use app\admin\model\Index;
class MemberUpgrade extends Index{
    
    public function cat(){
    	return $this->hasOne("MemberUpgradeCat",'id','cat_id')->field('id,name');
    }
}