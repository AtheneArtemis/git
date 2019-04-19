<?php
namespace app\admin\controller;
use app\admin\controller\Publictable;

class MemberUpgradeCat extends Publictable{
    
    function _initialize(){
        parent::_initialize();
        $this->model = 'member_upgrade_cat';
        $this->controllername = '会员升级套餐分类';
        
    }
    function _filter(&$map,&$querycond){
        $map['is_delete'] = array('eq','0');
    }
    function _generatetabledatahtml($html,$id=null){
        
        $value =  model($this->model)->where("id",$id)->find();
        if (!empty($value["icon"])) {
            $icon = $this->uploadurl.$value["icon"];
        }
        $html = $html.'
    		<tr>
    			<td class="bs-checkbox"><input data-index="3" name="btSelectItem" type="checkbox" value="'.$value["id"].'"></td>
                <td>'.$value["id"].'</td>
    			<td>'.$value["name"].'</td>
                <td><img src="'.$icon.'" style="width:100px;height:30px;"/></td>
                <td>'.$value["sort"].'</td>
                <td><a href="'.url(request()->controller().'/edit',array('id'=>$value['id'])).'"><button class="btn btn-outline btn-default">修改</button></a></td>
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