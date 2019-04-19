<?php
namespace app\admin\controller;
use app\admin\controller\Publictable;

class SignInRecord extends Publictable{
    
    function _initialize(){
        parent::_initialize();
        $this->model = 'lottery_apply';
        $this->controllername = '报名记录';
        
    }
    function _filter(&$map,&$querycond){
        $map['is_delete'] = array('eq','0');
    }
    function _generatetabledatahtml($html,$id=null){
        
        $value =  model($this->model)->where("id",$id)->find();
       	$createtime = date('Y-m-d H:i:s',$value["createtime"]);

        $html = $html.'
    		<tr>
    			<td class="bs-checkbox"><input data-index="3" name="btSelectItem" type="checkbox" value="'.$value["id"].'"></td>
                <td>'.$value["id"].'</td>
    			<td>'.$value["user_id"].'</td>
                <td>'.$value["user"]['nickname'].'</td>
                <td>'.$value["number"].'</td>
                <td>'.$createtime.'</td>
    		</tr>';
        return $html;
    }
    
    function index(){
    	// $this->getinitprovincecityzonelist(true);
        $this->_filter($map,$querycond);
        $this->_index($this->model,$map,$fields="id",$order='createtime desc');
    	return $this->fetch(request()->controller().'/index');
    }
   
    
    
    
    
}