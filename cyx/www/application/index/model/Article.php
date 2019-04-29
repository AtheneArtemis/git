<?php
namespace app\index\model;
use app\index\model\Index;
class Article extends Index{
    
    public function articletype(){
    	return $this->hasOne('Articletype','id','articletype_id')->field('id,name');
    }
}