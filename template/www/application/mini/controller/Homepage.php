<?php
namespace app\mini\controller;
use app\mini\controller\Common;

class Homepage extends Common{

    public function _initialize(){
        parent::_initialize();

    }
    //首页接口
    public function index(){
        $user_id = $this->getuserid();
        $id = getparameter('id');
        
        $carousel = $this->getCarouselList();


        
        $data = [
            'id' => $id,
            'carousel' => $carousel,
            'productCat' => $productCat,
            'newMember' => $newMember,
            'newProduct' => $newProduct,
            'hotsell' => $hotsell,
            'featured' => $featured,
            'userinfo' => $userinfo,
            'memberUpgrade' => $memberUpgrade,
            'newMemberOpen' => $newMemberOpen,
        ];
        $apiRes = [
            'code' => 0,
            'data' => $data,
            'msg' => 'success'
        ];
        apiResponse($apiRes);
    }

    











}