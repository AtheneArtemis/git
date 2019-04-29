<?php
namespace app\admin\controller;
use app\admin\controller\Base;

class Order extends Base{
    
    function _initialize(){
        parent::_initialize();
        $this->model = 'order';
        $this->controllername = '订单列表';
        
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
        $status = getparameter('status');
        if (!empty($status)) {
            if (strcmp($status,'-10000') !== 0) {
                $map['status'] = $status;
            }
        }
        $orderNo = getparameter('orderNo');
        if (!empty($orderNo)) {
            $map['orderNo'] = $orderNo;
        }
    }
    function _generatetabledatahtml($html,$id=null){
        
        $value =  model($this->model)->where("id",$id)->find();
        $value['statusName'] = $this->getOrderStatusName($value['status']);
        /*if ($value['status'] == 2) {
            $operate = '<a href="javascript:sendGoods(\''.$value['id'].'\')"><button class="btn btn-outline btn-default">发货</button></a>';
        }*/
        $html = $html.'
    		<tr>
    			<td class="bs-checkbox"><input data-index="3" name="btSelectItem" type="checkbox" value="'.$value["id"].'"></td>
                <td>'.$value["id"].'</td>
    			<td>'.$value["orderNo"].'</td>
                <td>'.$value["user"]['nickname'].'</td>
                <td>'.$value["address"]['username'].'</td>
                <td>'.$value["address"]['mobile'].'</td>
                <td>'.$value["address"]['province']['name'].$value["address"]['city']['name'].$value["address"]['district']['name'].$value["address"]['address'].'</td>
                <td>'.$value["price"].'</td>
                <td>'.$value["statusName"].'</td>
                <td>'.$value["note"].'</td>
                <td><a href="'.url(request()->controller().'/detail',array('id'=>$value['id'])).'"><button class="btn btn-outline btn-default">查看</button></a></td>
    		</tr>';
        return $html;
    }
    
    function index(){
    	// $this->getinitprovincecityzonelist(true);
        $this->_filter($map,$querycond);
        $this->_index($this->model,$map,$fields="id",$order='status,createtime desc');
    	return $this->fetch(request()->controller().'/index');
    }
    public function getOrderStatusName($status){
        switch ($status) {
            case -1:
                $statusName = '已取消';
                break;
            case 1:
                $statusName = '待付款';
                break;
            case 2:
                $statusName = '待发货';
                break;
            case 3:
                $statusName = '待收货';
                break;
            case 4:
                $statusName = '已完成';
                break;
            default:
                $statusName = '已取消';
                break;
        }
        return $statusName;
    }
    /**
    * 详情页面
    * @author Administrator：chenkeyu 2017年9月19日 下午3:22:41
    * @param 
    * @return 
    */
    function detail(){
    
        $id = getparameter('id');
        if (!empty($id)){
            $model = model($this->model);
            $list = $model->relation($this->relation)->where('id',$id)->find();
            $this->assign('list',$list);
        }
        
        return $this->fetch(request()->controller().'/detail');
    }
    public function sendGoods(){

        $id = getparameter('id');

        $data = [
            'status' => 3,
            'updateuser_id' => session('uid'),
            'updatetime' => time(),
        ];
        $res = db('order')->where('id',$id)->data($data)->update();
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
    public function importExcel(){
        // $this->_filter($map,$querycond);
        $list = model($this->model)->where($map)->order('id')->select();
        // $user_db = db('user');
        foreach ($list as $k1 => $v1) {
            $createtime = date('Y-m-d H:i:s',$v1["createtime"]);
            foreach ($v1->detail as $k2 => $v2) {
                $product[$k1] .= '商品名称：'.$v2['product']['name'].' -- 数量：'.$v2['productNum'].' ';
            }
            $excelSpec[$k1] = [
                'A' => [
                    'width' => 10,
                    'title' => 'ID',
                    'content' => $v1['id']
                ],
                'B' => [
                    'width' => 30,
                    'title' => '订单编号',
                    'content' => $v1['orderNo']
                ],
                'C' => [
                    'width' => 20,
                    'title' => '用户昵称',
                    'content' => $v1['user']['nickname']
                ],
                'D' => [
                    'width' => 20,
                    'title' => '收货人',
                    'content' => $v1["address"]["username"]
                ],
                'E' => [
                    'width' => 20,
                    'title' => '联系方式',
                    'content' => $v1['address']['mobile']
                ],
                'F' => [
                    'width' => 20,
                    'title' => '订单总价',
                    'content' => $v1['price']
                ],
                'G' => [
                    'width' => 50,
                    'title' => '收货地址',
                    'content' => $v1["address"]['province']['name'].$v1["address"]['city']['name'].$v1["address"]['district']['name'].$v1["address"]['address']
                ],
                'H' => [
                    'width' => 100,
                    'title' => '商品信息',
                    'content' => $product[$k1]
                ],
                // 'I' => [
                //     'width' => 100,
                //     'title' => '',
                //     'content' => $createtime
                // ],
            ];
        }
        $activeSheet = 'A1:I1';
        $filename = '订单列表';
        $this->exportexcel($excelSpec,$filename,$activeSheet);
    }
}