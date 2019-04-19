<?php
namespace app\admin\controller;
use app\admin\controller\Publictable;

class ProductAttr extends Publictable{
    
    function _initialize(){
        parent::_initialize();
        $this->model = 'product_attr';
        $this->controllername = '商品属性';
        
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
    		</tr>';
        return $html;
    }
    
    function index(){
    	// $this->getinitprovincecityzonelist(true);
        $this->_filter($map,$querycond);
        $this->_index($this->model,$map,$fields="id",$order='sort');
    	return $this->fetch(request()->controller().'/index');
    }
   
    
    
    
    
}