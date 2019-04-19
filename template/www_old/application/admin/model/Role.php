<?php
namespace app\admin\model;
use think\Model;
class Role extends Model {

    public function users(){
        
        return $this->belongsToMany('User');
    }

}