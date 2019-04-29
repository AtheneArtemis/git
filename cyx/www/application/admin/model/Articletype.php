<?php
namespace app\admin\model;
use app\admin\model\Index;
class Articletype extends Index{
    
    public function group(){
    	return $this->hasOne('Articletype','id','gid')->field('id,name');
    }
    public function parent(){
    	return $this->hasOne('Articletype','id','pid')->field('id,name');
    }
}