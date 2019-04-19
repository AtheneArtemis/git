<?php
namespace app\eastshop\controller;
use think\Controller;
use app\common\RBAC;
use think\Db;
use think\Url;
class Index extends Controller{
    
    // function _initialize(){
    //     Url::root('/index.php');
    //     if (!session('?uid')){
    //         $this->redirect(url('Login/login'));
    //     }
    //     $notAuth = in_array(request()->module(), explode(',',config('NOT_AUTH_MODULE'))) || in_array(request()->controller(), explode(',', config('NOT_AUTH_ACTION')));
    //     if(config('USER_AUTH_ON')&& !$notAuth){
    //         if(!(RBAC::AccessDecision(request()->module()))){
    //             $this->error('没有权限');
    //         }
    //     }
    // }
    
    public function index(){

        $plist = '没有权限';

        echo json_encode($plist);
    }

    public function apiRoute(){

        $plist = getparameter('get.');

        echo json_encode($plist);

    }
    

    
    
    
    
    
    
    
    public function miniProgramLogin(){
        $plist = getparameter('get.');



    }
}