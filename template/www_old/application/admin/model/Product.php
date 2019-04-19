<?php
namespace app\admin\model;
use app\admin\model\Index;
class Product extends Index{
    
    public function roles(){
        return $this->belongsToMany('Role','role_user','role_id','user_id')->wherePivot('status','gt','0');
        //belongsToMany('关联模型名','中间表名','外键名','当前模型关联键名',['模型别名定义']);
    }
    function productCat(){
        return $this->hasone('ProductCat','id','cat_id')->field('id,name');
    }
}