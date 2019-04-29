<?php
namespace app\admin\controller;
use app\admin\controller\Base;
class Advantage extends Base{
    
    function _initialize(){
        parent::_initialize();
        $this->model = 'advantage';
        $this->controllername = '我们的优势';
    }
    function _filter(&$map,&$querycond){
        $map["is_delete"] = array('eq','0');
    }
    function _generatetabledatahtml($html,$id=null){
        $model = model($this->model);
        $value = $model->where("id",$id)->find();
        $html = $html.'
    		<tr>
    			<td class="bs-checkbox"><input data-index="3" name="btSelectItem" type="checkbox" value="'.$value["id"].'"></td>
                <td>'.$value["id"].'</td>
    			<td>'.$value["name"].'</td>
                <td><img src="'.$this->uploadurl.$value["icon"].'" /></td>
    			<td>'.$value["intro"].'</td>
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

    public function getArticleType(){
        $gid = getparameter('gid');
        $pid = getparameter('pid');
        $html = '';
        if (!empty($gid)) {
            $map = [
                'is_delete' => 0,
                'level' => 1,
                'gid' => $gid,
                'type' => 'cat',
            ];
            $list = db('articletype')->where($map)->field('id,name,level')->select();
            $html = '<option value="-10000">无上级</option>';
            foreach ($list as $key => $value) {
                $html .= '<option value="'.$value['id'].'" >'.$value['name'].'</option>';
            }
        }

        return $html;
    }
}