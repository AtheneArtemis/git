<?php
namespace app\admin\controller;
use app\admin\controller\Base;
class Servicetitle extends Base{
    
    function _initialize(){
        parent::_initialize();
        $this->model = 'servicetitle';
        $this->controllername = '定制服务标题';
    }
    function _filter(&$map,&$querycond){
        $map["is_delete"] = array('eq','0');
    }
    function _generatetabledatahtml($html,$id=null){
        $model = model($this->model);
        $value = $model->where("id",$id)->find();
        $tablename = $this->getTableName($value['tablename']);
        $html = $html.'
    		<tr>
    			<td class="bs-checkbox"><input data-index="3" name="btSelectItem" type="checkbox" value="'.$value["id"].'"></td>
                <td>'.$value["id"].'</td>
    			<td>'.$value["name"].'</td>
    			<td>'.$value["intro"].'</td>
                <td>'.$tablename.'</td>
                <td>'.$value["sort"].'</td>
                <td><a href="'.url(request()->controller().'/edit',array('id'=>$value['id'])).'"><button class="btn btn-outline btn-default">修改</button></a>
                    <a href="javascript:del(\''.$value['id'].'\')"><button class="btn btn-outline btn-default">删除</button></a>
                </td>
    		</tr>';
        return $html;
    }
    
    function index(){

        $this->_filter($map,$querycond);
        $this->_index($this->model,$map);
    	return $this->fetch(request()->controller().'/index');
    }
    public function getTableName($tablename){
        switch ($tablename) {
            case 'flow':
                $name = '开发流程';
                break;
            case 'advantage':
                $name = '我们的优势';
                break;
            case 'customization':
                $name = '定制开发服务';
                break;
            default:
                $name = '开发流程';
                break;
        }
        return $name;
    }
}