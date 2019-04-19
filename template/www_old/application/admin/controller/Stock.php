<?php
namespace app\admin\controller;
use app\admin\controller\Publictable;

class Stock extends Publictable{
    
    function _initialize(){
        parent::_initialize();
        $this->model = 'stock';
        $this->controllername = '股票列表';
        
    }
    function _filter(&$map,&$querycond){
        $map['is_delete'] = array('eq','0');
    }
    function _generatetabledatahtml($html,$id=null){
        
        $value =  db($this->model)->where("id",$id)->find();
       	$createtime = date('Y-m-d H:i:s',$value["createtime"]);
        if(strcmp($value["account"],"admin") === 0) $createtime = "";
        if ($value['switch_btn'] == 2) $switch_btn = '已开启';
        else $switch_btn = '已关闭';
        $html = $html.'
    		<tr>
    			<td class="bs-checkbox"><input data-index="3" name="btSelectItem" type="checkbox" value="'.$value["id"].'"></td>
                <td>'.$value["id"].'</td>
    			<td>'.$value["name"].'</td>
                <td>'.$value["number"].'</td>
                <td>'.$value["used_number"].'</td>
                <td>'.$value["price"].'</td>
                <td>'.$value["stock_profit"].'</td>
                <td>'.$switch_btn.'</td>
                <td>'.$value["sort"].'</td>
    			<td>'.$value["note"].'</td>
                <td>
                    <a href="'.url(request()->controller().'/edit',array('id'=>$value['id'])).'"><button class="btn btn-outline btn-default">修改</button></a>
                </td>
    		</tr>';
        return $html;
    }
    
    function index(){
    	// $this->getinitprovincecityzonelist(true);
        $this->_filter($map,$querycond);
        $this->_index($this->model,$map,$fields="id",$order='sort');
    	return $this->fetch(request()->controller().'/index');
    }
   
    function opend(){

        $data = [
            'updateuser_id' => session('uid'),
            'updatetime' => time(),
            'switch_btn' => 2
        ];
        $res = db($this->model)->where('id','4')->data($data)->update();

        if ($res){
            $ApiRes = [
                'code' => 0,
                'data' => $res,
                'msg' => 'D轮开启成功'
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
    function closed(){

        $data = [
            'updateuser_id' => session('uid'),
            'updatetime' => time(),
            'switch_btn' => 1
        ];
        $res = db($this->model)->where('id','4')->data($data)->update();

        if ($res){
            $ApiRes = [
                'code' => 0,
                'data' => $res,
                'msg' => 'D轮关闭成功'
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
    
    
}