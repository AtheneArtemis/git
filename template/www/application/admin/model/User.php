<?php
namespace app\admin\model;
use app\admin\model\Index;
class User extends Index{
    

    public function userlevel(){
        return $this->hasOne('Userlevel','id','userlevel_id')->field('id,name');
    }
    public function roles(){
        return $this->belongsToMany('Role','role_user','role_id','user_id')->wherePivot('status','gt','0');
        //belongsToMany('关联模型名','中间表名','外键名','当前模型关联键名',['模型别名定义']);
    }
    /*public function roles(){
        return $this->belongsToMany('Role','role_user','role_id','user_id')->wherePivot('status','gt','0');
        //belongsToMany('关联模型名','中间表名','外键名','当前模型关联键名',['模型别名定义']);
    }
    function province(){
        return $this->belongsTo('Province')->field('id,name');
    }
    function city(){
        return $this->belongsTo('City')->field('id,name');
    }
    function zone(){
        return $this->belongsTo('Zone')->field('id,name');
    }
    function usertype(){
        return $this->belongsTo('Enumeration','usertype_id','itemname')->field('itemname,itemvalue');
    }
    function company(){
        return $this->belongsTo('Company','company_id','id');
    }
    function userlevel(){
        return $this->belongsTo('Userlevel')->field('id,name,levelnumber');
    }
    function whetheridentified(){
        return $this->belongsTo('Enumeration','whetheridentified_id','itemname')->field('itemname,itemvalue');
    }*/
}