<?php
namespace app\admin\controller;
use app\admin\controller\Publictable;
use think\Controller;
class DividendStatistics extends Controller{
    
    function _initialize(){
        
        
    }
    function index(){
    	
        $this->statistics();


    }
    
    public function statistics(){

        // $userinfo = db('user')->where(['is_delete'=>0])->order('id')->page($page,$count)->field('id,nickname')->select();

        // var_dump($userinfo);
        $data = [
            'account' => time(),
            'nickname' => '测试用户'.time(),
            'createtime' => time(),
            'status' => 1
        ];
        $res = db('user')->insert($data);

    }
    
    
    
}