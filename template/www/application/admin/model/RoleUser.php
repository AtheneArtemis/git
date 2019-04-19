<?php
namespace app\admin\model;
use think\Model;
class RoleUser extends Model{
    
    public function users(){
    
        return $this->belongsTo('User')->field('id,account,nickname,company_id');
    }
}