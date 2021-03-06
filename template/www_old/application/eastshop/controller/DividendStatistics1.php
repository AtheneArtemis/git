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
    //http://localhost/index.php/eastshop/DividendStatistics/index
    function index(){
        // var_dump('测试123');die;
        // ignore_user_abort();//关掉浏览器，PHP脚本也可以继续执行.
        // set_time_limit(0);// 通过set_time_limit(0)可以让程序无限制的执行下去
        //php获取今日开始时间戳和结束时间戳
        $beginToday = mktime(0,0,0,date('m'),date('d'),date('Y'));
        $endToday = mktime(0,0,0,date('m'),date('d')+1,date('Y'))-1;
        //昨天的时间戳
        $beginYesterday = mktime(0,0,0,date('m'),date('d')-1,date('Y'));
        $endYesterday = mktime(0,0,0,date('m'),date('d'),date('Y'))-1;

        // $currentTime = time();
        // $time = 1;
        // $url = "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];

        // if ($currentTime % 3 == 0) {
            //商城订单商品销售总额 -- 状态为2，支付时间在昨天的
        $map = [
            'is_delete' => 0,
            'paytime' => ['between',[$beginYesterday,$endYesterday]],
            'status' => 2
        ];
        $total_money = db('order')->where($map)->sum('product_price');
        if ($total_money == 0) {
            fdbg('商城销售总额为零，无统计');
            exit();
        }
        // var_dump($total_money);
        //执行统计
        $this->getuserinfo($total_money);
        // }

        // sleep($time);
        // file_get_contents($url);
    }
    
    public function getuserinfo($total_money,$page=1,$count=100){
        fdbg('第'.$page.'次统计开始');
        // var_dump('第'.$page.'次统计开始');
        $user_map = [
            'is_delete' => 0
        ];
        $fields = 'id';

        $userinfo = db('user')->where($user_map)->order('id')->page($page,$count)->field($fields)->select();
        if (!empty($userinfo)) {
            $this->statistics($total_money,$userinfo);
            fdbg('第'.$page.'统计结束');
            // var_dump('第'.$page.'次统计结束');
            $page += 1;
            $this->getuserinfo($total_money,$page);
        }else{
            fdbg('第'.$page.'次统计结束,该次统计无数据，为无效统计');
            // var_dump('第'.$page.'次统计结束,该次统计无数据，为无效统计');
        }
    }
    public function statistics($total_money,$userinfo){

        /*$stock = db('stock');
        
        //获取股票派发情况
        $stockinfo = $stock->where(['is_delete'=>0])->field('id,name,number,stock_profit')->order('id')->select();
        //获取A轮股票派发情况
        $stockinfo_A = $stockinfo[0];
        //获取B轮股票派发情况
        $stockinfo_B = $stockinfo[1];
        //获取C轮股票派发情况
        $stockinfo_C = $stockinfo[2];
        //获取D轮股票派发情况
        $stockinfo_D = $stockinfo[3];*/

        $stock_user = model('stock_user');
        $usermodel = db('user');
        $dividend_record = db('dividend_record');
        //获取用户龙蛋（股票）信息
        foreach ($userinfo as $k1 => $v1) {
            $userStock = $stock_user->where(['is_delete'=>0,'user_id'=>$v1['id']])->field('id,stock_id,user_id,number')->select();
            if (!empty($userStock)) {
                $userinfo[$k1]['total_dividend'] = 0;
                foreach ($userStock as $k2 => $v2) {
                    /*var_dump($v2->id);
                    var_dump($v2->stock_id);
                    var_dump($v2->stock->stock_profit);
                    var_dump($v2->user_id);
                    var_dump($v2->number);
                    var_dump($v2->stock->number);*/
                    // $userinfo[$k1]['total_dividend']
                    $total_dividend[$k2] = $total_money * $v2->stock->stock_profit / 100 / $v2->stock->number * $v2->number;
                    $userinfo[$k1]['total_dividend'] += $total_dividend[$k2];
                    $dividend_data[$k2] = [
                        'user_id' => $v2->user_id,
                        'stock_id' => $v2->stock_id,
                        'dividend' => $total_dividend[$k2],
                        'createtime' => time(),
                        'status' =>1
                    ];
                    $dividend_recordRes = $dividend_record->insert($dividend_data[$k2]);
                }
            }
        }
        foreach ($userinfo as $k2 => $v2) {
            $old_userinfo = $usermodel->where('id',$v2['id'])->field('id,dividend')->find();
            $new_dividend = floatval($old_userinfo['dividend']) + floatval($v2['total_dividend']);
            $user_data = [
                'dividend' => $new_dividend,
                'updatetime' => time(),
            ];
            $res = $usermodel->where('id',$v2['id'])->data($user_data)->update();
        }
        unset($total_dividend);unset($dividend_data);
    }
    
    
}