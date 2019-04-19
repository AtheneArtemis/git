<?php
namespace app\admin\controller;
use app\admin\controller\Publictable;

class MiniProgramParameter extends Publictable{
    
    function _initialize(){
        parent::_initialize();
        $this->model = 'miniprogram_parameter';
        $this->controllername = '小程序参数设置';
        
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
                <td>'.$value["price"].'</td>
                <td>'.$value["stock_profit"].'</td>
                <td>'.$switch_btn.'</td>
                <td>'.$value["sort"].'</td>
    			<td>'.$value["note"].'</td>
    		</tr>';
        return $html;
    }
    
    function index(){

        $list = db($this->model)->where('is_delete','0')->find();
        $list['appsecret'] = '********';
        $list['mch_password'] = '********';
        $list['mch_key'] = '********';


        $this->assign('list',$list);
        return $this->fetch(request()->controller().'/index');
    }
   
    
    
    
    
}