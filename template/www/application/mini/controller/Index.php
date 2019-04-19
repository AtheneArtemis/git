<?php
namespace app\eastshop\controller;
use think\Controller;
class Index extends Controller{
    
    public function index(){

        $apiRes = [
            'code' => 1,
            'data' => [],
            'msg' => 'sign error'
        ];
        apiResponse($apiRes);
    }
}