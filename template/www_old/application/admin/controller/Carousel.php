<?php
namespace app\admin\controller;
use app\admin\controller\Publictable;

class Carousel extends Publictable{
    
    function _initialize(){
        parent::_initialize();
        $this->model = 'pictures';
        $this->controllername = '轮播图管理';
        
        $uploadurl = config("UPLOADIMG_URL");
        $this->assign('uploadurl',$uploadurl);
    }
    
    function index(){
        $map['is_delete'] = array('eq','0');
        $map['pictureattr_id'] = array('eq','carousel');
        $map['tablename'] = array('eq','carousel');
        $uploadurl = config("UPLOADIMG_URL");

        $list = db($this->model)->where($map)->order('sort,createtime desc')->select();
        foreach ($list as $k1 => $v1) {
            $list[$k1]['picture'] = $uploadurl.$v1['picture'];
        }
        $this->assign('list',$list);

    	return $this->fetch(request()->controller().'/index');
    }
    
    function insert(){

        $plist = getparameter('post.');
        $pictureSaveInfo = $this->uploadpicturefile();

        $data = [
            'tablename' => 'carousel',
            'pictureattr_id' => 'carousel',
            'title' => $plist['title'],
            'secondtitle' => $plist['secondtitle'],
            'sort' => $plist['sort'],
            'createtime' => time(),
            'user_id' => session('uid'),
            'status' => 1
        ];
        if (!empty($pictureSaveInfo)) {
            $data['picture'] = $pictureSaveInfo[0]['savename'];
        }
        $res = db($this->model)->data($data)->insert();
        if ($res){
            $this->success('操作成功',url(request()->controller().'/index'));
        }else{
            $this->error('操作失败');
        }
    }
    function update(){

        $plist = getparameter('post.');
        if(!empty($_FILES)) {
            $pictureSaveInfo = $this->uploadpicturefile();
        }
        $id = $plist['id'];

        $data = [
            'tablename' => 'carousel',
            'pictureattr_id' => 'carousel',
            'title' => $plist['title'],
            'secondtitle' => $plist['secondtitle'],
            'sort' => $plist['sort'],
            'createtime' => time(),
            'user_id' => session('uid'),
            'status' => 1
        ];
        if (!empty($pictureSaveInfo)) {
            $data['picture'] = $pictureSaveInfo[0]['savename'];
        }
        $res = db($this->model)->where('id',$id)->data($data)->update();
        // $res = db($this->model)->data($data)->insert();
        if ($res){
            $this->success('操作成功',url(request()->controller().'/index'));
        }else{
            $this->error('操作失败');
        }
    }
    
    
}