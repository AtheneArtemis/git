<?php
namespace app\eastshop\controller;
use app\eastshop\controller\Base;
use think\Controller;
use app\common\RBAC;
use think\Db;
use think\Url;
use think\Session;
class Personal extends Base{
    
    public function _initialize(){
        parent::_initialize();
    }
    public function getuserid(){
        $user_id = session('user_id');
        return $user_id;
    }
    //个人中心首页接口
    public function homepage(){
        $user_id = $this->getuserid();
        $userinfo = model('user')->where('id',$user_id)->find();
        $userinfo['userlevel_name'] = $userinfo->userlevel->name;
        $userinfo['total_money'] = floatval($userinfo->commission) + floatval($userinfo->dividend);
        //股票
        $stock = db('stock_user')->where(['is_delete'=>0,'user_id'=>$user_id])->order('stock_id')->select();
        $i = 0;
        foreach ($stock as $k1 => $v1) {
            if ($v1['stock_id'] == 1) {
                $new_stock[0] = $v1;
            }elseif ($v1['stock_id'] == 2) {
                $new_stock[1] = $v1;
            }elseif ($v1['stock_id'] == 3) {
                $new_stock[2] = $v1;
            }elseif ($v1['stock_id'] == 4) {
                $new_stock[3] = $v1;
            }
        }
        //收益
        $earnings = $this->getEarnings();
        $setting = db('other_parameter')->where(['is_delete'=>0])->field('id,mobile')->find();
        $apiRes = [
            'code' => 0,
            'data' => $list,
            'userinfo' => $userinfo,
            'stock' => $new_stock,
            'earnings' => $earnings,
            'setting' => $setting,
            'msg' => 'success'
        ];
        apiResponse($apiRes);
    }
    //收益
    public function getEarnings(){
        $user_id = $this->getuserid();
        //昨天的时间戳
        $beginYesterday = mktime(0,0,0,date('m'),date('d')-1,date('Y'));
        $endYesterday = mktime(0,0,0,date('m'),date('d'),date('Y'))-1;
        //获取昨天的佣金
        $yesterday_map = [
            'user_id'=>$user_id,
            'is_delete'=>0,
            'status'=>1,
            'createtime' => ['between',[$beginYesterday,$endYesterday]],
        ];
        $yesterdayCommission = db('commission_record')->where($yesterday_map)->sum('commission');
        //昨日分红
        $yesterdayDividend = db('dividend_record')->where($yesterday_map)->sum('dividend');
        //昨日收益
        $yesterday = floatval($yesterdayCommission) + floatval($yesterdayDividend);
        //累计佣金
        $total_map = [
            'user_id'=>$user_id,
            'is_delete'=>0,
            'status'=>1,
        ];
        $commission = db('commission_record')->where($total_map)->sum('commission');
        $dividend = db('dividend_record')->where($total_map)->sum('dividend');
        $total = floatval($commission) + floatval($dividend);

        $earnings = [
            'yesterday' => $yesterday,
            'total' => $total
        ];
        return $earnings;
    }
    //获取团队
    public function myTeam(){
        $user_id = $this->getuserid();

        $subUserinfo = model('user')->where(['is_delete'=>0,'parent_id'=>$user_id])->field('id,nickname,avatar_url,createtime,userlevel_id')->select();
        foreach ($subUserinfo as $k1 => $v1) {
            $subUserinfo[$k1]['createtime'] = date('Y-m-d H:i',$v1['createtime']);
            $subUserinfo[$k1]['userlevel'] = $v1->userlevel;
        }

        $apiRes = [
            'code' => 0,
            'subUserinfo' => $subUserinfo,
            'msg' => 'success'
        ];
        apiResponse($apiRes);
    }
    //我的收藏
    public function enshrine(){
        $user_id = $this->getuserid();

        $enshrine_list = model('product_enshrine')->where(['is_delete'=>0,'user_id'=>$user_id])->field('id,product_id,user_id,createtime')->select();
        foreach ($enshrine_list as $k1 => $v1) {
            $enshrine_list[$k1]['product'] = $this->getProductlist(['id'=>$v1['product_id']],$isOnlyThumbpicture=true,$isNeedSales=false,$fields='',$order='sort',$count=5);
        }

        $apiRes = [
            'code' => 0,
            'enshrine_list' => $enshrine_list,
            'msg' => 'success'
        ];
        apiResponse($apiRes);
    }
    //我的奖品
    public function prize(){
        $user_id = $this->getuserid();

        $prize = model('lottery_award')->where(['is_delete'=>0,'user_id'=>$user_id])->field('id,user_id,number,award_id,money,createtime,status')->order('status,createtime desc')->select();
        foreach ($prize as $k1 => $v1) {
            if (empty($v1['award_id'])) {
                $prize[$k1]['award'] = $v1['money'].'元';
            }elseif ($v1['award_id'] == -3) {
                $prize[$k1]['award'] = $v1['money'].'元';
            }else{
                $prize[$k1]['award'] = $v1['awardinfo']['name'];
            }
            $prize[$k1]['createtime'] = date('Y-m-d H:i',$v1['createtime']);
        }
        $defaultAddress = model('address')->where(['is_delete'=>0,'user_id'=>$user_id,'is_default'=>1])->field('id,user_id,username,mobile,province_id,city_id,district_id,address,is_default,note,createtime,status')->find();
        $apiRes = [
            'code' => 0,
            'prize' => $prize,
            'defaultAddress' => $defaultAddress,
            'msg' => 'success'
        ];
        apiResponse($apiRes);
    }
    //兑奖
    public function redeem(){
        $id = getParameterByRedirect('id');
        $address_id = getParameterByRedirect('address_id');
        $user_id = $this->getuserid();
        $userinfo = db('user')->where('id',$user_id)->field('id,commission')->find();

        $lottery_award_info = db('lottery_award')->where('id',$id)->field('id,user_id,number,award_id,money,status')->find();
        if (empty($lottery_award_info['award_id']) && $lottery_award_info['money'] > 0) {
            //奖品为现金，直接发送红包
            $msg = '发送红包中！';
        }elseif ($lottery_award_info['award_id'] == -3 && $lottery_award_info['money'] > 0) {
            //发放购物券
            $msg = $this->setUserManualIntegral($userinfo,$lottery_award_info['money']);
            if ($msg['code'] == 0) {
                $data = [
                    'status' => 3,
                    'updateuser_id' => $user_id,
                    'updatetime' => time(),
                ];
                $res = db('lottery_award')->where('id',$id)->data($data)->update();
                $msg = '购物券已发放！';
            }
        }else{
            $data = [
                'status' => 2,
                'address_id' => $address_id,
                'updateuser_id' => $user_id,
                'updatetime' => time(),
            ];
            $res = db('lottery_award')->where('id',$id)->data($data)->update();
            $msg = '兑奖申请已提交，请等待审核！';
        }
        $apiRes = [
            'code' => 0,
            'msg' => $msg,
        ];
        apiResponse($apiRes);
    }
    //获取收货地址
    public function getAddress(){
        $address_id = getParameterByRedirect('address_id');
        $user_id = $this->getuserid();
        $model = model('address');
        $dmodel = db('district');
        if (empty($address_id)) {
            $map = [
                'user_id' => $user_id,
                'is_delete' => 0,
            ];
            $list = $model->where($map)->order('is_default desc,createtime desc')->select();
            foreach ($list as $k1 => $v2) {
                $list[$k1]['province'] = $v2['province'];
                $list[$k1]['city'] = $v2['city'];
                $list[$k1]['district'] = $v2['district'];
            }
        }else{
            $list = $model->where('id',$address_id)->find();
            $edit_district['province'] = $list['province'];
            $edit_district['city'] = $list['city'];
            $edit_district['district'] = $list['district'];
        }

        $apiRes = [
            'code' => 0,
            'data' => $list,
            'edit_district' => $edit_district,
            'msg' => 'success'
        ];
        apiResponse($apiRes);
    }
    //保存收货地址
    public function saveAddress(){

        $address_id = getParameterByRedirect('address_id');
        $username = getParameterByRedirect('username');
        $mobile = getParameterByRedirect('mobile');
        $province_id = getParameterByRedirect('province_id');
        $city_id = getParameterByRedirect('city_id');
        $district_id = getParameterByRedirect('district_id');
        $address = getParameterByRedirect('address');
        $is_default = getParameterByRedirect('is_default');
        $user_id = $this->getuserid();
        $tablePrefix = config("database.prefix");
        $tablename = 'address';

        $data = [
            'username' => $username,
            'mobile' => $mobile,
            'province_id' => $province_id,
            'city_id' => $city_id,
            'district_id' => $district_id,
            'address' => $address,
        ];
        if (empty($address_id)) {
            //新增
            $data['createtime'] = time();
            $data['user_id'] = $user_id;
            $data['status'] = 1;
            \think\Db::startTrans();
            
            try{
                if ($is_default) {
                    $addressmap = [
                        'user_id' => $user_id,
                        'is_delete' => 0,
                    ];
                    $addressdata = ['is_default' => 0];
                    $msg['setIsDefault'] = \think\Db::table($tablePrefix.$tablename)->where($addressmap)->update($addressdata);
                    $data['is_default'] = 1;
                }
                $msg['address'] = \think\Db::table($tablePrefix.$tablename)->insert($data);
                $result = [
                    'code' => 0,
                    'data' => [],
                    'msg' => '保存成功'
                ];
                // 提交事务
                \think\Db::commit();
            } catch (\Exception $e) {
                $result = [
                    'code' => 1,
                    'data' => [],
                    'msg' => '系统繁忙'
                ];
                // 回滚事务
                \think\Db::rollback();
            }
        }else{
            try{
                if ($is_default) {
                    $addressmap = [
                        'user_id' => $user_id,
                        'is_delete' => 0,
                    ];
                    $addressdata = ['is_default' => 0];
                    $msg['setIsDefault'] = \think\Db::table($tablePrefix.$tablename)->where($addressmap)->update($addressdata);
                    $data['is_default'] = 1;
                }
                $msg['address'] = \think\Db::table($tablePrefix.$tablename)->where('id',$address_id)->update($data);
                $result = [
                    'code' => 0,
                    'data' => [],
                    'msg' => '保存成功'
                ];
                // 提交事务
                \think\Db::commit();
            } catch (\Exception $e) {
                $result = [
                    'code' => 1,
                    'data' => [],
                    'msg' => '系统繁忙'
                ];
                // 回滚事务
                \think\Db::rollback();
            }
        }
        $apiRes = $result;
        apiResponse($apiRes);
    }
    //设置默认地址
    public function setDefaultAddress(){
        $address_id = getParameterByRedirect('address_id');
        $user_id = $this->getuserid();

        \think\Db::startTrans();
        $tablePrefix = config("database.prefix");
        $tablename = 'address';
        try{
            
            $addressmap = [
                'user_id' => $user_id,
                'is_delete' => 0,
            ];
            $addressdata = ['is_default' => 0];
            $msg['setIsDefault'] = \think\Db::table($tablePrefix.$tablename)->where($addressmap)->update($addressdata);
            
            $msg['address'] = \think\Db::table($tablePrefix.$tablename)->where('id',$address_id)->data(['is_default' => 1])->update();
            $result = [
                'code' => 0,
                'data' => [],
                'msg' => '保存成功'
            ];
            // 提交事务
            \think\Db::commit();
        } catch (\Exception $e) {
            $result = [
                'code' => 1,
                'data' => [],
                'msg' => '系统繁忙'
            ];
            // 回滚事务
            \think\Db::rollback();
        }
        $apiRes = $result;
        apiResponse($apiRes);
    }
    public function memberUpgradeList(){
        $cat_id = getParameterByRedirect('cat_id');
        $user_id = $this->getuserid();
        if (!empty($cat_id) && $cat_id != undefined) $map['cat_id'] = $cat_id;
        else $map['cat_id'] = 1;
        $fields = 'id,name,intro,price,original_price,share_commission,stock,sort,createtime';
        $list = $this->getMemberUpgradelist($map,$isOnlyThumbpicture=true,$isNeedSales=false,$fields,$order='sort',$count=10);

        $apiRes = [
            'code' => 0,
            'data' => $list,
            'msg' => '保存成功'
        ];
        apiResponse($apiRes);
    }
    public function memberUpgrade(){
        $id = getParameterByRedirect('id');
        $user_id = $this->getuserid();

        if (!empty($id)) $map['id'] = $id;
        else $map['id'] = 1;
        $list = $this->getMemberUpgradelist($map,$isOnlyThumbpicture=false,$isNeedSales=false,$fields,$order='sort',$count=10);
        $shareinfo = [
            'title' => '分享会员得好礼',
            'path' => 'pages/member-upgrade/member-upgrade?parent_id='.$user_id.'&id='.$id,
            'imageUrl' => '',
        ];
        //会员通过分享链接进入，绑定其上级
        /*$parent_id = getParameterByRedirect('parent_id');
        if (!empty($parent_id) && strcmp($parent_id, 'undefined') !== 0) {
            $userRes = db('user')->where('id',$user_id)->data(array('parent_id'=>$parent_id))->update();
        }*/
        $user_fields = 'id,account,realname,nickname,mobile,usertype_id,userlevel_id';
        $userinfo = db('user')->where('id',$user_id)->field($user_fields)->find();
        $apiRes = [
            'code' => 0,
            'data' => $list,
            'shareinfo' => $shareinfo,
            'userinfo' => $userinfo,
            'msg' => '保存成功'
        ];
        apiResponse($apiRes);
    }
    //获取商品信息
    /*
    * map
    * isOnlyThumbpicture 是否只查询缩略图
    * isNeedSales 是否查询销量
    * fields
    * order
    * count
    */
    public function getMemberUpgradelist($map=[],$isOnlyThumbpicture=false,$isNeedSales=false,$fields='',$order='createtime desc',$count=10,$page=0){
        if (empty($fields)) {
            if (empty($map['id'])) {
                $fields = 'id,name,price,original_price,share_commission,intro,specification,stock,freight';
            }else{
                $fields = 'id,name,price,original_price,share_commission,intro,specification,stock,freight,detail';
            }
        }
        if (empty($map['is_delete'])) $map['is_delete'] = 0;
        if (empty($map['status'])) $map['status'] = 2;
        $user_id = $this->getuserid();

        if ($page == 0 || $page == undefined){
            $list = db('member_upgrade')->where($map)->field($fields)->order($order)->limit($count)->select();
        }else{
            $list = db('member_upgrade')->where($map)->field($fields)->order($order)->page($page,$count)->select();
        }
        foreach ($list as $k1 => $v1) {
            $list[$k1]['rebate'] = floatval($v1['price']) * floatval($v1['share_commission']) / 100;
            $thumbpicturemap = [
                'tablename' => 'member_upgrade',
                'objectprimarykey' => $v1['id'],
                'is_delete' => 0,
                'pictureattr_id' => array('eq','thumbpicture')
            ];
            $list[$k1]['thumbpicture'] = $this->getPicturelist($thumbpicturemap);
            //除去缩略图的图片
            if (!$isOnlyThumbpicture) {
                $picturemap = [
                    'tablename' => 'member_upgrade',
                    'objectprimarykey' => $v1['id'],
                    'is_delete' => 0,
                    'pictureattr_id' => array('neq','thumbpicture')
                ];
                $list[$k1]['picturelist'] = $this->getPicturelist($picturemap);
            }
            //商品销量
            if($isNeedSales){
                $list[$k1]['saleNumber'] = $this->getCommditySaleNumber($v1['id']);
            }
            //商品是否被收藏
            $enshrinemap = [
                'product_id' => $v1['id'],
                'user_id' => $user_id,
                'is_delete' => 0,
            ];
            $ifEnshrine = db('product_enshrine')->where($enshrinemap)->count('id');
            if ($ifEnshrine) {
                $list[$k1]['ifEnshrine'] = 1;
            }else{
                $list[$k1]['ifEnshrine'] = 0;
            }
        }
        if (!empty($map['id'])) {
            $list = $list[0];
        }
        return $list;
    }
    //购买会员升级套餐
    public function buyMemberUpgrade(){
        $user_id = $this->getuserid();
        // $product = object2array(json_decode(getParameterByRedirect('product')));//商品信息
        $product_id = getParameterByRedirect('product_id');
        $address_id = getParameterByRedirect('address_id');
        $user_openid = db('user')->where('id',$user_id)->field('id,openid')->find();
        $map['id'] = $product_id;
        $fields = 'id,name,intro,price,original_price,share_commission,stock,sort,createtime,cat_id';
        $product = $this->getMemberUpgradelist($map,$isOnlyThumbpicture=true,$isNeedSales=false,$fields);

        $orderNo = $this->getOrderNo();
        $member_upgrade_order_data = [
            'orderNo' => $orderNo,
            'user_id' => $user_id,
            'address_id' => $address_id,
            'product_id' => $product['id'],
            'createtime' => time(),
            'status' => 1
        ];
        $res = db('member_upgrade_order')->data($member_upgrade_order_data)->insert();
        $order_id =  db('member_upgrade_order')->getLastInsID();
        if ($res) {
            $data = [
                'body' => '购买会员升级套餐',
                'order_no' => $orderNo,
                'price' => $product['price'],
                'openid' => $user_openid['openid'],
            ];
            $payParams = $this->pay($data);
            $payParams['order_id'] = $order_id;
            $payParams['product_id'] = $product_id;
            $payParams['cat_id'] = $product['cat_id'];
            $apiRes = [
                'code' => 0,
                'data' => $payParams,
                'msg' => 'success'
            ];
        }else{
            $apiRes = [
                'code' => 1,
                'data' => [],
                'msg' => '系统繁忙'
            ];
        }
        apiResponse($apiRes);
    }
    //会员升级套餐 -- 支付成功回调函数
    public function pay_member_result(){
        $user_id = $this->getuserid();
        $order_id = getParameterByRedirect('order_id');
        $product_id = getParameterByRedirect('product_id');
        $cat_id = getParameterByRedirect('cat_id');
        $stock = db('stock');
        //获取股票派发情况
        $stockinfo = $stock->where('is_delete','0')->field('id,name,number,used_number,switch_btn')->order('id')->select();
        //获取A轮股票派发情况
        $stockinfo_A = $stockinfo[0];
        //获取B轮股票派发情况
        $stockinfo_B = $stockinfo[1];
        //获取C轮股票派发情况
        $stockinfo_C = $stockinfo[2];
        //获取D轮股票派发情况
        $stockinfo_D = $stockinfo[3];

        $user_data = [
            'updatetime' => time(),
            'updateuser_id' => $user_id,
        ];
        //会员自身股票派发
        if ($cat_id == 1) {
            //购买店主
            $user_data['userlevel_id'] = 2;
            if ($stockinfo_A['number'] - $stockinfo_A['used_number'] > 0) {
                $stockinfo_A_res = $this->setUserStock($stockinfo_A['id'],$stockinfo_A['used_number'],$user_id,1);
            }else{
                if ($stockinfo_D['switch_btn'] == 2 && ($stockinfo_D['number'] - $stockinfo_D['used_number'] > 0)) {
                    $stockinfo_D_res = $this->setUserStock($stockinfo_D['id'],$stockinfo_D['used_number'],$user_id,1);
                }
            }
        }elseif ($cat_id == 2) {
            //购买皇冠店主
            $user_data['userlevel_id'] = 3;
            if ($stockinfo_A['number'] - $stockinfo_A['used_number'] > 0) {
                $stockinfo_A_res = $this->setUserStock($stockinfo_A['id'],$stockinfo_A['used_number'],$user_id,5);
            }else{
                if ($stockinfo_D['switch_btn'] == 2 && ($stockinfo_D['number'] - $stockinfo_D['used_number'] > 0)) {
                    $stockinfo_D_res = $this->setUserStock($stockinfo_D['id'],$stockinfo_D['used_number'],$user_id,10);
                }
            }
            if ($stockinfo_B['number'] - $stockinfo_B['used_number'] > 0) {
                $stockinfo_B_res = $this->setUserStock($stockinfo_B['id'],$stockinfo_B['used_number'],$user_id,1);
            }
        }elseif ($cat_id == 3) {
            //购买联合创始人
            $user_data['userlevel_id'] = 4;
            /*if ($stockinfo_D['switch_btn'] == 2 && ($stockinfo_D['number'] - $stockinfo_D['used_number'] > 0)) {
                $stockinfo_D_res = $this->setUserStock($stockinfo_D['id'],$stockinfo_D['used_number'],$user_id,200);
            }*/
            if ($stockinfo_A['number'] - $stockinfo_A['used_number'] > 0) {
                $stockinfo_A_res = $this->setUserStock($stockinfo_A['id'],$stockinfo_A['used_number'],$user_id,100);
            }else{
                if ($stockinfo_D['switch_btn'] == 2 && ($stockinfo_D['number'] - $stockinfo_D['used_number'] > 0)) {
                    $stockinfo_D_res = $this->setUserStock($stockinfo_D['id'],$stockinfo_D['used_number'],$user_id,200);
                }
            }
            if ($stockinfo_B['number'] - $stockinfo_B['used_number'] > 0) {
                $stockinfo_B_res = $this->setUserStock($stockinfo_B['id'],$stockinfo_B['used_number'],$user_id,1);
            }
            if ($stockinfo_C['number'] - $stockinfo_C['used_number'] > 0) {
                $stockinfo_C_res = $this->setUserStock($stockinfo_C['id'],$stockinfo_C['used_number'],$user_id,1);
            }
        }
        //会员上级获得分享奖励
        $userinfo = db('user')->where('id',$user_id)->field('id,parent_id')->find();
        if (!empty($userinfo['parent_id'])) {
            $parent_userinfo = db('user')->where('id',$userinfo['parent_id'])->field('id,money,commission,userlevel_id')->find();
            $this->setParentUserStock($parent_userinfo,$user_data['userlevel_id']);
        }
        $order_data = [
            'is_pay' => 1,
            'status' => 2,
            'updatetime' => time(),
            'updateuser_id' => $user_id
        ];
        $msg_user = db('user')->where('id',$user_id)->update($user_data);
        $msg_member_upgrade_order = db('member_upgrade_order')->where('id',$order_id)->update($order_data);

        $apiRes = [
            'code' => 0,
            'data' => [],
            'msg' => '支付成功'
        ];
        apiResponse($apiRes);
    }
    //设置上级分享会员套餐奖励
    public function setParentUserStock($parent_userinfo,$userlevel_id){
        //获取股票派发情况
        $stock = db('stock');
        $stockinfo = $stock->where('is_delete','0')->field('id,name,number,used_number,switch_btn')->order('id')->select();
        //获取A轮股票派发情况
        $stockinfo_A = $stockinfo[0];
        //获取B轮股票派发情况
        $stockinfo_B = $stockinfo[1];
        //获取C轮股票派发情况
        $stockinfo_C = $stockinfo[2];
        //获取D轮股票派发情况
        $stockinfo_D = $stockinfo[3];
        if ($parent_userinfo['userlevel_id'] == 2) {
            //上级为店主
            if ($stockinfo_A['number'] - $stockinfo_A['used_number'] > 0) {
                $stockinfo_A_res = $this->setUserStock($stockinfo_A['id'],$stockinfo_A['used_number'],$parent_userinfo['id'],1);
            }else{
                if ($stockinfo_D['switch_btn'] == 2 && ($stockinfo_D['number'] - $stockinfo_D['used_number'] > 0)) {
                    $stockinfo_D_res = $this->setUserStock($stockinfo_D['id'],$stockinfo_D['used_number'],$parent_userinfo['id'],1);
                }
            }
            if ($userlevel_id == 3) {
                //当前用户购买皇冠店主套餐
                $new_commissionRes = $this->setUserCommission($parent_userinfo,80);
            }
            if ($userlevel_id == 4) {
                //当前用户购买联合创始人套餐
                $new_commissionRes = $this->setUserCommission($parent_userinfo,800);
            }
        }elseif ($parent_userinfo['userlevel_id'] == 3) {
            if ($userlevel_id == 2) {
                if ($stockinfo_A['number'] - $stockinfo_A['used_number'] > 0) {
                    $stockinfo_A_res = $this->setUserStock($stockinfo_A['id'],$stockinfo_A['used_number'],$parent_userinfo['id'],5);
                }else{
                    if ($stockinfo_D['switch_btn'] == 2 && ($stockinfo_D['number'] - $stockinfo_D['used_number'] > 0)) {
                        $stockinfo_D_res = $this->setUserStock($stockinfo_D['id'],$stockinfo_D['used_number'],$parent_userinfo['id'],10);
                    }
                }
            }elseif ($userlevel_id == 3) {
                if ($stockinfo_A['number'] - $stockinfo_A['used_number'] > 0) {
                    $stockinfo_A_res = $this->setUserStock($stockinfo_A['id'],$stockinfo_A['used_number'],$parent_userinfo['id'],5);
                }else{
                    if ($stockinfo_D['switch_btn'] == 2 && ($stockinfo_D['number'] - $stockinfo_D['used_number'] > 0)) {
                        $stockinfo_D_res = $this->setUserStock($stockinfo_D['id'],$stockinfo_D['used_number'],$parent_userinfo['id'],10);
                    }
                }
                if ($stockinfo_B['number'] - $stockinfo_B['used_number'] > 0) {
                    $stockinfo_B_res = $this->setUserStock($stockinfo_B['id'],$stockinfo_B['used_number'],$parent_userinfo['id'],1);
                }
                $new_commissionRes = $this->setUserCommission($parent_userinfo,100);
            }elseif ($userlevel_id == 4) {
                if ($stockinfo_A['number'] - $stockinfo_A['used_number'] > 0) {
                    $stockinfo_A_res = $this->setUserStock($stockinfo_A['id'],$stockinfo_A['used_number'],$parent_userinfo['id'],5);
                }else{
                    if ($stockinfo_D['switch_btn'] == 2 && ($stockinfo_D['number'] - $stockinfo_D['used_number'] > 0)) {
                        $stockinfo_D_res = $this->setUserStock($stockinfo_D['id'],$stockinfo_D['used_number'],$parent_userinfo['id'],100);
                    }
                }
                if ($stockinfo_B['number'] - $stockinfo_B['used_number'] > 0) {
                    $stockinfo_B_res = $this->setUserStock($stockinfo_B['id'],$stockinfo_B['used_number'],$parent_userinfo['id'],1);
                }
                $new_commissionRes = $this->setUserCommission($parent_userinfo,1000);
            }
            $parent_userinfo_child_number = db('user')->where(array('parent_id'=>$parent_userinfo['id'],'is_delete'=>0))->count();
            if ($parent_userinfo_child_number >= 19) {
                $user_id = $this->getuserid();
                $data = [
                    'userlevel_id' => 4,
                    'updateuser_id' => $user_id,
                    'updatetime' => time(),
                ];
                $res = db('user')->where('id',$parent_userinfo['id'])->data($data)->update();
                if ($stockinfo_C['number'] - $stockinfo_C['used_number'] > 0) {
                    $stockinfo_C_res = $this->setUserStock($stockinfo_C['id'],$stockinfo_C['used_number'],$user_id,1);
                }
            }
        }elseif ($parent_userinfo['userlevel_id'] == 4) {
            if ($userlevel_id == 2) {
                if ($stockinfo_A['number'] - $stockinfo_A['used_number'] > 0) {
                    $stockinfo_A_res = $this->setUserStock($stockinfo_A['id'],$stockinfo_A['used_number'],$parent_userinfo['id'],10);
                }else{
                    if ($stockinfo_D['switch_btn'] == 2 && ($stockinfo_D['number'] - $stockinfo_D['used_number'] > 0)) {
                        $stockinfo_D_res = $this->setUserStock($stockinfo_D['id'],$stockinfo_D['used_number'],$parent_userinfo['id'],20);
                    }
                }
            }elseif ($userlevel_id == 3) {
                if ($stockinfo_A['number'] - $stockinfo_A['used_number'] > 0) {
                    $stockinfo_A_res = $this->setUserStock($stockinfo_A['id'],$stockinfo_A['used_number'],$parent_userinfo['id'],10);
                }else{
                    if ($stockinfo_D['switch_btn'] == 2 && ($stockinfo_D['number'] - $stockinfo_D['used_number'] > 0)) {
                        $stockinfo_D_res = $this->setUserStock($stockinfo_D['id'],$stockinfo_D['used_number'],$parent_userinfo['id'],20);
                    }
                }
                if ($stockinfo_B['number'] - $stockinfo_B['used_number'] > 0) {
                    $stockinfo_B_res = $this->setUserStock($stockinfo_B['id'],$stockinfo_B['used_number'],$parent_userinfo['id'],2);
                }
                $new_commissionRes = $this->setUserCommission($parent_userinfo,120);
            }elseif ($userlevel_id == 4) {
                if ($stockinfo_A['number'] - $stockinfo_A['used_number'] > 0) {
                    $stockinfo_A_res = $this->setUserStock($stockinfo_A['id'],$stockinfo_A['used_number'],$parent_userinfo['id'],10);
                }else{
                    if ($stockinfo_D['switch_btn'] == 2 && ($stockinfo_D['number'] - $stockinfo_D['used_number'] > 0)) {
                        $stockinfo_D_res = $this->setUserStock($stockinfo_D['id'],$stockinfo_D['used_number'],$parent_userinfo['id'],200);
                    }
                }
                if ($stockinfo_B['number'] - $stockinfo_B['used_number'] > 0) {
                    $stockinfo_B_res = $this->setUserStock($stockinfo_B['id'],$stockinfo_B['used_number'],$parent_userinfo['id'],2);
                }
                $new_commissionRes = $this->setUserCommission($parent_userinfo,1200);
            }
        }

    }
    //修改用户佣金及添加佣金记录
    public function setUserCommission($parent_userinfo,$new_commission){
        $user_id = $this->getuserid();
        $data = [
            'commission' => floatval($parent_userinfo['commission']) + floatval($new_commission),
            'updateuser_id' => $user_id,
            'updatetime' => time(),
        ];
        $commission_data = [
            'user_id' => $parent_userinfo['id'],
            'commission' => $new_commission,
            'createtime' => time(),
            'status' => 1
        ];
        $msg['user'] = db('user')->where('id',$parent_userinfo['id'])->update($data);
        $msg['commission_record'] = db('commission_record')->insert($commission_data);

        $apiRes = [
            'code' => 0,
            'data' => $msg,
            'msg' => '操作成功'
        ];
        return $apiRes;
    }
    //我的推广二维码
    public function promoteQrcode(){
        $user_id = $this->getuserid();
        $Qrcode_url = config('QRCODE_URL');
        $poster_dir = config('POSTER_DIR');
        $poster_url = config('POSTER_URL');

        $userinfo = db('user')->where('id',$user_id)->field('id,invitation_code,invitation_qrcode')->find();
        if (empty($userinfo['invitation_qrcode']) || !$userinfo['invitation_qrcode']) {
            $userinfo['invitation_qrcode'] = $this->getQrcodeFirstFromWechat($user_id);
        }
        // $userinfo['invitation_qrcode'] = $Qrcode_url.$userinfo['invitation_qrcode'];
        if (empty($userinfo['invitation_code']) || !$userinfo['invitation_code']) {
            $userinfo['invitation_code'] = $this->getInvitationCode($user_id);
        }
        if (!is_file('./public/static/Poster/'.$userinfo['invitation_qrcode'])) {
            $image = \think\Image::open('./public/static/img/posterbg.jpg');
            $path_name = './public/static/Poster/'.$userinfo['invitation_qrcode'];
            $path_url = $poster_url.$userinfo['invitation_qrcode'];
            $invitation_qrcode = './public/static/Qrcode/'.$userinfo['invitation_qrcode'];
            $invitation_code = $userinfo['invitation_code'];
            $font = './public/static/fonts/1.ttf';

            $image->water($invitation_qrcode,[330,1143],100)->save($path_name);
            $image->text($invitation_code,$font,22,'#ffffff',[550,1635])->save($path_name);

            $userinfo['poster'] = $path_url;
        }else{
            $userinfo['poster'] = $poster_url.$userinfo['invitation_qrcode'];
        }

        

        $apiRes = [
            'code' => 0,
            'data' => $userinfo,
            'msg' => 'success'
        ];
        apiResponse($apiRes);
    }
    //获取推广码
    public function getInvitationCode($user_id){

        $currentTime = getmsectime();
        $time_16 = dechex($currentTime);
        $InvitationCode = strtoupper($time_16);
        $usermodel = db('user');

        $is_have = $usermodel->where('invitation_code',$InvitationCode)->field('id')->find();
        if (empty($is_have)) {
            $data = [
                'invitation_code' => $InvitationCode,
                'updateuser_id' => session('uid'),
                'updatetime' => time(),
            ];
            $res = $usermodel->where('id',$user_id)->data($data)->update();
            if ($res) {
                $invitation_code = $InvitationCode;
            }else{
                $invitation_code = '存储推广码失败';;
            }
        }else{
            $this->getInvitationCode($user_id);
        }
        return $invitation_code;
    }

    //修改用户购物券及添加购物券记录
    public function setUserManualIntegral($userinfo,$new_manual_integral){
        $user_id = $this->getuserid();
        $data = [
            'manual_integral' => intval($userinfo['manual_integral']) + intval($new_manual_integral),
            'updateuser_id' => $user_id,
            'updatetime' => time(),
        ];
        $commission_data = [
            'user_id' => $userinfo['id'],
            'manual_integral' => $new_manual_integral,
            'createtime' => time(),
            'status' => 1
        ];
        $tablePrefix = config("database.prefix");
        \think\Db::startTrans();
        try{
            $msg['user'] = \think\Db::table($tablePrefix.'user')->where('id',$userinfo['id'])->update($data);
            $msg['manual_integral_record'] = \think\Db::table($tablePrefix.'manual_integral_record')->insert($commission_data);
            $apiRes = [
                'code' => 0,
                'data' => $msg,
                'msg' => '操作成功'
            ];
            // 提交事务
            \think\Db::commit();
        } catch (\Exception $e) {
            $apiRes = [
                'code' => 1,
                'data' => $msg,
                'msg' => '系统繁忙'
            ];
            // 回滚事务
            \think\Db::rollback();
        }
        return $apiRes;
    }
    //我的佣金
    public function commission(){
        $user_id = $this->getuserid();

        $userinfo = db('user')->where('id',$user_id)->field('id,commission')->find();
        $commission_record = db('commission_record')->where(['is_delete'=>0,'user_id'=>$user_id,'status'=>1])->field('id,user_id,commission,createtime,status')->limit(15)->order('createtime desc')->select();
        foreach ($commission_record as $key => $value) {
            $commission_record[$key]['createtime'] = date('Y-m-d H:i',$value['createtime']);
        }
        $apiRes = [
            'code' => 0,
            'userinfo' => $userinfo,
            'commission_record' => $commission_record,
            'msg' => 'success'
        ];
        apiResponse($apiRes);
    }
    //我的分红
    public function dividend(){
        $user_id = $this->getuserid();

        $userinfo = db('user')->where('id',$user_id)->field('id,dividend')->find();
        $dividend_record = db('dividend_record')->where(['is_delete'=>0,'user_id'=>$user_id,'status'=>1])->field('id,user_id,stock_id,dividend,createtime,status')->limit(15)->order('createtime desc')->select();
        $stockmodel = db('stock');
        foreach ($dividend_record as $key => $value) {
            $dividend_record[$key]['createtime'] = date('Y-m-d H:i',$value['createtime']);
            $dividend_record[$key]['stock'] = $stockmodel->where('id',$value['stock_id'])->field('id,name')->find();
        }
        $apiRes = [
            'code' => 0,
            'userinfo' => $userinfo,
            'dividend_record' => $dividend_record,
            'msg' => 'success'
        ];
        apiResponse($apiRes);
    }
    //提现页面
    public function withdraw(){
        $user_id = $this->getuserid();
        $type = getParameterByRedirect('type');
        if ($type == '' || $type == undefined || empty($type)) {
            $apiRes = [
                'code' => 0,
                'data' => $type,
                'msg' => '提现类型不正确'
            ];
            apiResponse($apiRes);
            exit();
        }
        $userinfo = db('user')->where('id',$user_id)->field('id,commission,dividend')->find();
        $withdraw_account = db('withdraw_account')->where(['is_delete'=>0,'user_id'=>$user_id])->field('id,user_id,name,mobile,wechat,alipay,bank_name,bank_account')->order('createtime desc')->select();
        foreach ($withdraw_account as $k1 => $v1) {
            $withdraw_account_show[$k1] = $v1['name'] . ' -- ' .$v1['mobile'];
        }
        $setting = db('other_parameter')->where(['is_delete'=>0])->field('id,withdraw_min,withdraw_max,withdraw_commission,withdraw_commission_initiation,switch_withdraw')->find();
        $setting['withdraw_max'] = $setting['withdraw_max'] > 5000 ? 5000 : $setting['withdraw_max'];
        if (strcmp($type,'commission') === 0){
            //佣金提现
            $list = [
                'total_money' => $userinfo['commission'],
                'withdraw_account' => $withdraw_account,
                'withdraw_account_show' => $withdraw_account_show,
                'setting' => $setting
            ];
        }else{
            //分红提现
            $list = [
                'total_money' => $userinfo['dividend'],
                'withdraw_account' => $withdraw_account,
                'withdraw_account_show' => $withdraw_account_show,
                'setting' => $setting
            ];
        }
        $apiRes = [
            'code' => 0,
            'data' => $list,
            'msg' => 'success'
        ];
        apiResponse($apiRes);
    }
    //保存提现账号
    public function saveWithAccount(){
        $user_id = $this->getuserid();
        $id = getParameterByRedirect('id');
        $name = getParameterByRedirect('name');
        $mobile = getParameterByRedirect('mobile');
        $wechat = getParameterByRedirect('wechat');
        $alipay = getParameterByRedirect('alipay');
        $bank_name = getParameterByRedirect('bank_name');
        $bank_account = getParameterByRedirect('bank_account');

        $data = [
            'user_id' => $user_id,
            'name' => $name,
            'mobile' => $mobile,
            'wechat' => $wechat,
            'alipay' => $alipay,
            'bank_name' => $bank_name,
            'bank_account' => $bank_account,
        ];
        if (empty($id) || $id == '' || $id == undefined || $id == 0) {
            $data['createtime'] = time();
            $data['status'] = 1;
            $res = db('withdraw_account')->insert($data);
        }else{
            $data['updatetime'] = time();
            $data['updateuser_id'] = $user_id;
            $res = db('withdraw_account')->where('id',$id)->data($data)->update();
        }
        if ($res) {
            $apiRes = [
                'code' => 0,
                'data' => $res,
                'msg' => '保存成功'
            ];
        }else{
            $apiRes = [
                'code' => 1,
                'data' => $res,
                'msg' => '系统繁忙'
            ];
        }
        apiResponse($apiRes);
    }
    //提现操作
    public function saveWithdraw(){
        $user_id = $this->getuserid();
        $money = getParameterByRedirect('money');
        $withdraw_account_id = getParameterByRedirect('withdraw_account_id');
        $type = getParameterByRedirect('type');

        $beginToday=mktime(0,0,0,date('m'),date('d'),date('Y'));
        $endToday=mktime(0,0,0,date('m'),date('d')+1,date('Y'))-1;
        $withdraw_map = [
            'user_id' => $user_id,
            'createtime' => ['between',[$beginToday,$endToday]],
            'is_delete' => 0
        ];
        $withdraw_total_money = db('withdraw')->where($withdraw_map)->sum('money');
        if (5000 - $withdraw_total_money < $money || $money > 5000 || $withdraw_total_money >= 5000){
            $apiRes = [
                'code' => 1,
                'data' => $res,
                'msg' => '超出每日提现上限'
            ];
            apiResponse($apiRes);exit();
        }
        $userinfo = db('user')->where('id',$user_id)->field('id,commission,dividend')->find();
        if (strcmp($type,'commission') === 0){
            //佣金
            if ($userinfo['commission'] < $money){
                $apiRes = [
                    'code' => 1,
                    'data' => $res,
                    'msg' => '余额不足'
                ];
                apiResponse($apiRes);exit();
            }
            $new_commission = floatval($userinfo['commission']) - floatval($money);
            $user_data = [
                'commission' => $new_commission,
                'updatetime' => time(),
                'updateuser_id' => $user_id,
            ];
            $userRes = db('user')->where('id',$user_id)->data($user_data)->update();
        }else{
            //分红
            if ($userinfo['dividend'] < $money){
                $apiRes = [
                    'code' => 1,
                    'data' => $res,
                    'msg' => '余额不足'
                ];
                apiResponse($apiRes);exit();
            }
            $new_dividend = floatval($userinfo['dividend']) - floatval($money);
            $user_data = [
                'dividend' => $new_dividend,
                'updatetime' => time(),
                'updateuser_id' => $user_id,
            ];
            $userRes = db('user')->where('id',$user_id)->data($user_data)->update();
        }
        $withdraw_data = [
            'user_id' => $user_id,
            'withdraw_account_id' => $withdraw_account_id,
            'money' => $money,
            'type' => $type,
            'createtime' => time(),
            'status' => 1
        ];
        $res = db('withdraw')->insert($withdraw_data);
        
        $apiRes = [
            'code' => 0,
            'data' => $res,
            'msg' => '提现申请已提交，请等待审核'
        ];
        apiResponse($apiRes);
    }









}