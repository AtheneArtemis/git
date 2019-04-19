<?php
namespace app\mini\controller;
use app\mini\controller\ApiEntrance;
class Common extends ApiEntrance{

    public function _initialize(){

        parent::_initialize();
        
    }
    //获取轮播图
    public function getCarouselList(){
    	$map['is_delete'] = array('eq','0');
        $map['pictureattr_id'] = array('eq','carousel');
        $map['tablename'] = array('eq','carousel');
        $fields = 'id,title,picture,secondtitle';

        $list = db('pictures')->where($map)->field($fields)->order('sort,createtime desc')->select();
        foreach ($list as $k1 => $v1) {
            $list[$k1]['picture'] = $this->uploadurl.$v1['picture'];
        }
        return $list;
    }


}