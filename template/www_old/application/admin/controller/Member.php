<?php
namespace app\admin\controller;
use app\admin\controller\Publictable;

class Member extends Publictable{
    
    function _initialize(){
        parent::_initialize();
        $this->model = 'user';

        $level = db('userlevel')->where('is_delete','0')->select();
        $this->assign('level',$level);
    }
    function _filter(&$map,&$querycond,&$order){
        $map["is_delete"] = array('eq','0');
        // $map["account"] = array('neq','admin');
        $map['usertype_id'] = array('eq','member');

        $userlevel_id = getparameter('userlevel_id');
        if (!empty($userlevel_id)) {
            if (strcmp($userlevel_id,'-10000') !== 0) {
                $map['userlevel_id'] = $userlevel_id;
            }
        }
        $nickname = getparameter('nickname');
        if (!empty($nickname)) {
            $map['nickname'] = ['like','%'.$nickname.'%'];
        }
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
        $orderby = getparameter('orderby');
        $orderway = getparameter('orderway');
        if (!empty($orderby)) {
            if (!empty($orderway)) {
                $order = $orderby.' '.$orderway;
            }else{
                $order = $orderby;
            }
        }
    }
    function _generatetabledatahtml($html,$id=null){
        $model = model("user");
        $value = $model->where("id",$id)->find();
       	$createtime = date('Y-m-d H:i:s',$value["createtime"]);
        $sub_number = db('user')->where('parent_id',$value['id'])->count();
        $html = $html.'
    		<tr>
    			<td class="bs-checkbox"><input data-index="3" name="btSelectItem" type="checkbox" value="'.$value["id"].'"></td>
                <td>'.$value["id"].'</td>
    			<td><a href="'.url(request()->controller().'/detail',array('id'=>$value['id'])).'">'.$value["nickname"].'</a></td>
    			<td><img src="'.$value["avatar_url"].'"  style="width: 50px;height: 50px;"/></td>
                <td>'.$value["mobile"].'</td>
    			<td>'.$value["userlevel"]["name"].'</td>
                <td>'.$value["commission"].'</td>
                <td>'.$value["dividend"].'</td>
                <td>'.$value["manual_integral"].'</td>
                <td>'.$sub_number.'</td>
                <td>'.$createtime.'</td>
                <td>
                    <a href="'.url(request()->controller().'/edit',array('id'=>$value['id'])).'"><button class="btn btn-outline btn-default">修改</button></a>
                </td>
    		</tr>';
        return $html;
    }
    
    function index(){
    	// $this->getinitprovincecityzonelist(true);
        if (empty($order)) {
            $order = 'id';
        }
        $this->_filter($map,$querycond,$order);
        $this->_index("user",$map,$fields="id",$order);
    	return $this->fetch(request()->controller().'/index');
    }
    
    public function detail(){
        $id = getparameter('id');
        $user = model('user');
        $order = db('order');
        $fields = 'id,nickname,avatar_url,mobile,money,commission,dividend,manual_integral,usertype_id,userlevel_id,parent_id,createtime';
        $PAGE_LISTROWS = config('PAGE_LISTROWS');

        $list = $user->where('id',$id)->field($fields)->find();
        $list->order_money = $order->where(['user_id'=>$list->id,'is_delete'=>0,'status'=>['gt','1']])->sum('price');
        $list->sub_number = db('user')->where('parent_id',$id)->count();

        $sublist = $user->where('parent_id',$id)->field($fields)->paginate($PAGE_LISTROWS);
        foreach ($sublist as $k1 => $v1) {
            $sublist[$k1]['order_money'] = $order->where(['user_id'=>$v1->id,'is_delete'=>0,'status'=>['gt','1']])->sum('price');
        }
        // 获取分页显示
        $page = $sublist->render();

        $this->assign('list',$list);
        $this->assign('sublist',$sublist);
        $this->assign('page', $page);
        return $this->fetch(request()->controller().'/detail');
    }
    public function importExcel(){
        $this->_filter($map,$querycond,$order);
        if (empty($order)) {
            $order = 'id';
        }
        $list = model('user')->where($map)->order($order)->select();
        $user_db = db('user');
        foreach ($list as $k1 => $v1) {
            $createtime = date('Y-m-d H:i:s',$v1["createtime"]);
            $sub_number = $user_db->where('parent_id',$v1['id'])->count();
            $excelSpec[$k1] = [
                'A' => [
                    'width' => 10,
                    'title' => 'ID',
                    'content' => $v1['id']
                ],
                'B' => [
                    'width' => 30,
                    'title' => '用户昵称',
                    'content' => $v1['nickname']
                ],
                'C' => [
                    'width' => 20,
                    'title' => '电话',
                    'content' => $v1['mobile']
                ],
                'D' => [
                    'width' => 20,
                    'title' => '用户等级',
                    'content' => $v1["userlevel"]["name"]
                ],
                'E' => [
                    'width' => 20,
                    'title' => '佣金',
                    'content' => $v1['commission']
                ],
                'F' => [
                    'width' => 20,
                    'title' => '龙蛋分红',
                    'content' => $v1['dividend']
                ],
                'G' => [
                    'width' => 20,
                    'title' => '购物券',
                    'content' => $v1['manual_integral']
                ],
                'H' => [
                    'width' => 20,
                    'title' => '直推',
                    'content' => $sub_number
                ],
                'I' => [
                    'width' => 40,
                    'title' => '注册时间',
                    'content' => $createtime
                ],
            ];
        }
        $activeSheet = 'A1:I1';
        $filename = '会员列表';
        $this->exportexcel($excelSpec,$filename,$activeSheet);
    }
    
    
    
}