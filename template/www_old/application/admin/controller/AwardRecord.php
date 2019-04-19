<?php
namespace app\admin\controller;
use app\admin\controller\Publictable;

class AwardRecord extends Publictable{
    
    function _initialize(){
        parent::_initialize();
        $this->model = 'lottery_award';
        $this->controllername = '中奖记录';
        
    }
    function _filter(&$map,&$querycond){
        $map['is_delete'] = array('eq','0');
        $starttime = strtotime(getparameter('start'));
        $endtime = strtotime(getparameter('end'));
        if (!empty($starttime)){
            if (!empty($endtime)){
                $map['createtime'] = ['between',[$starttime,$endtime]];
            }else{
                $map['createtime'] = ['gt',$starttime];
            }
        }else{
            if (!empty($endtime)){
                $map['createtime'] = ['lt',$endtime];
            }
        }
        $user_id = getparameter('user_id');
        if (!empty($user_id)) {
            $map['user_id'] = $user_id;
        }
    }
    function _generatetabledatahtml($html,$id=null){
        
        $value =  model($this->model)->where("id",$id)->find();
       	$createtime = date('Y-m-d H:i:s',$value["createtime"]);
        if ($value['status'] == 1) {
            $statusName = '待领取';
        }elseif ($value['status'] == 2) {
            $statusName = '审核中';
        }elseif ($value['status'] == 3) {
            $statusName = '审核通过，已领取';
        }else{
            $statusName = '审核未通过';
        }
        if (empty($value['award_id'])) {
            $award = '现金红包：'.$value['money'].'元';
        }elseif ($value['award_id'] == -3) {
            $award = '购物券：'.$value['money'].'元';
        }else{
            $award = $value['award']['name'];
        }
        if (empty($value['award_id']) || $value['award_id'] == 0 || $value['status'] != 2) {
            $applyBtn = '';
        }else{
            $applyBtn = '<a href="javascript:transit(\''.$value['id'].'\')"><button class="btn btn-primary">通过</button></a>
                <a href="javascript:notransit(\''.$value['id'].'\')"><button class="btn btn-primary">不通过</button></a>';
        }
        $html = $html.'
    		<tr>
    			<td class="bs-checkbox"><input data-index="3" name="btSelectItem" type="checkbox" value="'.$value["id"].'"></td>
                <td>'.$value["id"].'</td>
    			<td>'.$value["user_id"].'</td>
                <td>'.$value["user"]['nickname'].'</td>
                <td>'.$award.'</td>
                <td>'.$createtime.'</td>
                <td>'.$statusName.'</td>
                <td><a href="'.url(request()->controller().'/detail',array('id'=>$value['id'])).'"><button class="btn btn-outline btn-default">查看</button></a></td>
                <td>'.$applyBtn.'</td>
    		</tr>';
        return $html;
    }
    
    function index(){
    	// $this->getinitprovincecityzonelist(true);
        $this->_filter($map,$querycond);
        $this->_index($this->model,$map,$fields="id",$order='createtime desc');
    	return $this->fetch(request()->controller().'/index');
    }
    public function sendGoods(){
        $id = getparameter('id');
        $data = [
            'status' => 3,
            'updateuser_id' => session('uid'),
            'updatetime' => time(),
        ];
        $res = db($this->model)->where('id',$id)->data($data)->update();
        if ($res) {
            $apiRes = [
                'code' => 0,
                'data' => [],
                'msg' => '发货成功'
            ];
        }else{
            $apiRes = [
                'code' => 1,
                'data' => [],
                'msg' => '系统繁忙'
            ];
        }
        return $apiRes;
    }
    public function transit(){

        $id = getparameter('id');
        $data = [
            'updateuser_id' => session('uid'),
            'updatetime' => time(),
            'status' => 3
        ];
        $res = db($this->model)->where('id',$id)->data($data)->update();
        if ($res) {
            $ApiRes = [
                'code' => 0,
                'data' => $res,
                'msg' => '操作成功'
            ];
        }else{
            $ApiRes = [
                'code' => 1,
                'data' => $res,
                'msg' => '系统繁忙'
            ];
        }
        return $ApiRes;
    }
    public function notransit(){

        $id = getparameter('id');
        $data = [
            'updateuser_id' => session('uid'),
            'updatetime' => time(),
            'status' => -1
        ];
        $res = db($this->model)->where('id',$id)->data($data)->update();
        if ($res) {
            $ApiRes = [
                'code' => 0,
                'data' => $res,
                'msg' => '操作成功'
            ];
        }else{
            $ApiRes = [
                'code' => 1,
                'data' => $res,
                'msg' => '系统繁忙'
            ];
        }
        return $ApiRes;
    }
    public function importExcel(){
        // $this->_filter($map,$querycond);
        $list = model($this->model)->where($map)->order('id')->select();
        foreach ($list as $k1 => $v1) {
            $createtime = date('Y-m-d H:i:s',$v1["createtime"]);
            if ($v1['status'] == 1) {
                $statusName = '待领取';
            }elseif ($v1['status'] == 2) {
                $statusName = '审核中';
            }elseif ($v1['status'] == 3) {
                $statusName = '审核通过，已领取';
            }else{
                $statusName = '审核未通过';
            }
            if (empty($v1['award_id'])) {
                $award = '现金红包：'.$v1['money'].'元';
            }elseif ($v1['award_id'] == -3) {
                $award = '购物券：'.$v1['money'].'元';
            }else{
                $award = $v1['award']['name'];
            }
            $excelSpec[$k1] = [
                'A' => [
                    'width' => 10,
                    'title' => 'ID',
                    'content' => $v1['id']
                ],
                'B' => [
                    'width' => 30,
                    'title' => '奖品名称',
                    'content' => $award
                ],
                'C' => [
                    'width' => 20,
                    'title' => '用户昵称',
                    'content' => $v1["user"]["nickname"]
                ],
                'D' => [
                    'width' => 20,
                    'title' => '收货人',
                    'content' => $v1['address']['username']
                ],
                'E' => [
                    'width' => 20,
                    'title' => '联系方式',
                    'content' => $v1['address']['mobile']
                ],
                'F' => [
                    'width' => 70,
                    'title' => '收货地址',
                    'content' => $v1["address"]['province']['name'].$v1["address"]['city']['name'].$v1["address"]['district']['name'].$v1["address"]['address']
                ],
                'G' => [
                    'width' => 25,
                    'title' => '中奖时间',
                    'content' => $createtime
                ],
            ];
        }
        $activeSheet = 'A1:I1';
        $filename = '中奖纪录列表';
        $this->exportexcel($excelSpec,$filename,$activeSheet);
    }
    
    
}