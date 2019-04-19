<?php
namespace app\admin\controller;
use app\admin\controller\Publictable;

class MemberWithdraw extends Publictable{
    
    function _initialize(){
        parent::_initialize();
        $this->model = 'withdraw';
        $this->controllername = '会员提现';
        
    }
    function _filter(&$map,&$querycond){
        $map['is_delete'] = array('eq','0');
        $mobile = getparameter('mobile');
        if (!empty($mobile)) {
            $userinfo = db('user')->where(['mobile'=>$mobile,'is_delete'=>0])->field('id')->find();
            if (!empty($userinfo)) {
                $map['user_id'] = $userinfo['id'];
            }
        }
        $status = getparameter('status');
        if (!empty($status)) {
            if (strcmp($status,'-10000') !== 0) {
                $map['status'] = $status;
            }
        }

    }
    function _generatetabledatahtml($html,$id=null){
        
        $value = model($this->model)->where("id",$id)->field('id,name,user_id,type,money,actual_money,status,note,createtime')->find();
       	$createtime = date('Y-m-d H:i:s',$value["createtime"]);
        $applyBtn = '';
        if (strcmp($value['type'], 'dividend') === 0) $type="分红提现";
            else $type = '佣金提现';
        if ($value['status'] == 1){
            $status = '待审核';
            $applyBtn = '<a href="'.url(request()->controller().'/apply',array('id'=>$value['id'])).'"><button class="btn btn-primary">审核</button></a>';
        }elseif ($value['status'] == 2){
            $status = '审核中';
        }elseif ($value['status'] == 3) {
            $status = '审核通过';
        }else{
            $status = '未通过审核';
        }
        $html = $html.'
    		<tr>
    			<td class="bs-checkbox"><input data-index="3" name="btSelectItem" type="checkbox" value="'.$value["id"].'"></td>
                <td>'.$value["id"].'</td>
                <td>'.$value["user"]['nickname'].'</td>
                <td>'.$type.'</td>
                <td>'.$value["money"].'</td>
                <td>'.$value["actual_money"].'</td>
                <td>'.$status.'</td>
                <td>'.$createtime.'</td>
                <td>'.$value["note"].'</td>
    			<td>'.$applyBtn.'</td>
    		</tr>';
        return $html;
    }
    
    function index(){
    	// $this->getinitprovincecityzonelist(true);
        $this->_filter($map,$querycond);
        $this->_index($this->model,$map,$fields="id",$order='status,createtime desc');
    	return $this->fetch(request()->controller().'/index');
    }
   
    public function apply(){
        $id = getparameter('id');
        $list = model($this->model)->where('id',$id)->field('id,user_id,type,withdraw_account_id,money,actual_money,note,status')->find();
        $setting = db('other_parameter')->where(['is_delete'=>0])->field('id,withdraw_commission,withdraw_commission_initiation')->find();
        if (empty($list['actual_money']) || $list['actual_money'] == 0 || !$list['actual_money']){
            //需要收取手续费的部分
            $need_withdraw_commission_initiation = $list['money'] - $setting['withdraw_commission_initiation'];
            $withdraw_commission_money = $need_withdraw_commission_initiation * $setting['withdraw_commission'] / 100;
            //实际到账金额
            $actual_money = $list['money'] - $withdraw_commission_money;
            $list['actual_money'] = $actual_money;
        }
        $this->assign('list',$list);
        return $this->fetch(request()->controller().'/apply');
    }

    public function submitApply(){
        $id = getparameter('id');
        $status = getparameter('status');

        $list = db($this->model)->where('id',$id)->field('id,user_id,type,withdraw_account_id,money,actual_money,note')->find();
        $setting = db('other_parameter')->where(['is_delete'=>0])->field('id,withdraw_commission,withdraw_commission_initiation')->find();
        if (empty($list['actual_money']) || $list['actual_money'] == 0 || !$list['actual_money']){
            //需要收取手续费的部分
            $need_withdraw_commission_initiation = $list['money'] - $setting['withdraw_commission_initiation'];
            $withdraw_commission_money = $need_withdraw_commission_initiation * $setting['withdraw_commission'] / 100;
            //实际到账金额
            $actual_money = $list['money'] - $withdraw_commission_money;
            $list['actual_money'] = $actual_money;
        }
        if($status == 3){
            //审核通过
            $data = [
                'name' => '审核通过',
                'apply_user_id' => session('uid'),
                'apply_time' => time(),
                'actual_money' => $list['actual_money'],
                'updateuser_id' => session('uid'),
                'updatetime' => time(),
                'status' => 3
            ];
            $res = db($this->model)->where('id',$id)->data($data)->update();
            if ($res){
                $apiRes = [
                    'code' => 0,
                    'msg' => '操作成功'
                ];
            }else{
                $apiRes = [
                    'code' => 1,
                    'msg' => '系统繁忙'
                ];
            }
        }else{
            //审核不通过
            $data = [
                'name' => '未通过审核',
                'apply_user_id' => session('uid'),
                'apply_time' => time(),
                'actual_money' => '',
                'updateuser_id' => session('uid'),
                'updatetime' => time(),
                'status' => 4
            ];
            $res = db($this->model)->where('id',$id)->data($data)->update();
            //返还用户提现金额
            $userinfo = db('user')->where('id',$list['user_id'])->field('id,commission,dividend')->find();
            if (strcmp('commission', $list['type']) === 0){
                $new_commission = floatval($userinfo['commission']) + floatval($list['money']);
                $user_data = [
                    'commission' => $new_commission,
                    'updateuser_id' => session('uid'),
                    'updatetime' => time(),
                ];
                $userRes = db('user')->where('id',$list['user_id'])->data($user_data)->update();
            }else{
                $new_dividend = floatval($userinfo['dividend']) + floatval($list['money']);
                $user_data = [
                    'dividend' => $new_dividend,
                    'updateuser_id' => session('uid'),
                    'updatetime' => time(),
                ];
                $userRes = db('user')->where('id',$list['user_id'])->data($user_data)->update();
            }
            if ($res && $userRes){
                $apiRes = [
                    'code' => 0,
                    'msg' => '操作成功'
                ];
            }else{
                $apiRes = [
                    'code' => 1,
                    'msg' => '系统繁忙'
                ];
            }
        }
        return $apiRes;
    }
}