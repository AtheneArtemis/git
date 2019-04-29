<?php
namespace app\admin\controller;
use app\admin\controller\Base;
class Articletype extends Base{
    
    function _initialize(){
        parent::_initialize();
        $this->model = 'articletype';
        $this->controllername = '文章类型管理';

        $grouplist = db('articletype')->where(['is_delete'=>0,'type'=>'group'])->field('id,name')->select();
        $this->assign('grouplist',$grouplist);
    }
    function _filter(&$map,&$querycond){
        $map["is_delete"] = array('eq','0');
    }
    function _generatetabledatahtml($html,$id=null){
        $model = model($this->model);
        $value = $model->where("id",$id)->find();
       	$createtime = date('Y-m-d H:i:s',$value["createtime"]);
        $gid = '';
        $pid = '';
        $level = '';
        if ($value["gid"] > 0) {
            $gid = $value["group"]["name"];
        }
        if ($value["pid"] > 0) {
            $pid = $value["parent"]["name"];
        }
        if ($value["level"] > 0) {
            $level = $value["level"];
        }
        if ($value['type'] == 'cat') {
            if ($value['level'] == 1) {
                $type = '一级分类';
            }else{
                $type = '二级分类';
            }
        }else{
            $type = '分组';
        }

        $html = $html.'
    		<tr>
    			<td class="bs-checkbox"><input data-index="3" name="btSelectItem" type="checkbox" value="'.$value["id"].'"></td>
                <td>'.$value["id"].'</td>
                <td>'.$type.'</td>
    			<td>'.$value["name"].'</td>
    			<td>'.$value["intro"].'</td>
                <td>'.$gid.'</td>
                <td>'.$pid.'</td>
                <td>'.$level.'</td>
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