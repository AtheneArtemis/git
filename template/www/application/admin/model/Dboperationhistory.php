<?php
namespace app\admin\model;
use app\admin\model\Index;
class Dboperationhistory extends Index{
    
    function user(){
        return $this->belongsTo('User')->field('id,account,nickname');
    }
}