<?php
namespace app\eastshop\controller;
use think\Controller;
class DividendStatistics extends Controller{
    
    function _initialize(){
        $plist = getparameter('post.');
        $glist = getparameter('get.');
        if (!empty($plist) || !empty($glist)) {
            echo "sorry,you no access!";
        }
    }
    function index(){
    	
        //php获取今日开始时间戳和结束时间戳
        $beginToday = mktime(0,0,0,date('m'),date('d'),date('Y'));
        $endToday = mktime(0,0,0,date('m'),date('d')+1,date('Y'))-1;
        $currentTime = time();
        $time = 1;
        $url = "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];

        if ($currentTime % 3 == 0) {
            //执行统计
            $this->statistics();
        }

        sleep($time);
        file_get_contents($url);


    }
    
    public function statistics($page=1,$count=20){

        var_dump('测试统计'.time());

        // $user_map = [
        //     'is_delete' => 0
        // ];
        // $fields = 'id';
        // $userinfo = db('user')->where($user_map)->order('id')->page($page,$count)->field($fields)->select();

        // var_dump($userinfo);
        

    }
    
    
    
}