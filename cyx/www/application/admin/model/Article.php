<?php
namespace app\admin\model;
use think\Model;
class Article extends Model {

    
	public function articletype(){
		return $this->hasOne('Articletype','id','articletype_id')->field('id,name');
	}
}