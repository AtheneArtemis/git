<?php
namespace app\admin\controller;
use app\admin\controller\Publictable;

class MemberLevel extends Publictable{
    
    function _initialize(){
        parent::_initialize();
        $this->model = 'userlevel';
        $this->controllername = '会员等级';
        
    }
    function _filter(&$map,&$querycond){
        $map['is_delete'] = array('eq','0');
    }
    function _generatetabledatahtml($html,$id=null){
        
        $value =  db($this->model)->where("id",$id)->find();

        $html = $html.'
    		<tr>
    			<td class="bs-checkbox"><input data-index="3" name="btSelectItem" type="checkbox" value="'.$value["id"].'"></td>
                <td>'.$value["id"].'</td>
    			<td>'.$value["name"].'</td>
                <td>'.$value["sort"].'</td>
                <td>'.$value["note"].'</td>
    			<td><a href="'.url('MemberLevel/edit',array('id'=>$value['id'])).'"><button class="btn btn-outline btn-default">修改</button></a></td>
    		</tr>';
        return $html;
    }
    
    function index(){
    	// $this->getinitprovincecityzonelist(true);
        $this->_filter($map,$querycond);
        $this->_index($this->model,$map,$fields="id",$order='sort desc');
    	return $this->fetch(request()->controller().'/index');
    }
    
   
    
    
    
    
}