<?php
namespace app\admin\controller;
use app\admin\controller\Base;
class Article extends Base{
    
    function _initialize(){
        parent::_initialize();
        $this->model = 'article';
        $this->controllername = '文章管理';

        $grouptype = db('articletype')->where(['is_delete'=>0,'type'=>'group'])->field('id,name,title')->select();
        $this->assign('grouptype',$grouptype);
    }
    function _filter(&$map,&$querycond){
        $map["is_delete"] = array('eq','0');
        $name = getparameter('name');
        if (!empty($name)) {
            $map['name'] = ['like','%'.$name.'%'];
        }
    }
    function _generatetabledatahtml($html,$id=null){
        $model = model($this->model);
        $value = $model->where("id",$id)->find();
       	$createtime = date('Y-m-d H:i:s',$value["createtime"]);
        $value["statusName"] = $this->getArticleStatusName($value["status"]);
        $html = $html.'
    		<tr>
    			<td class="bs-checkbox"><input data-index="3" name="btSelectItem" type="checkbox" value="'.$value["id"].'"></td>
                <td>'.$value["id"].'</td>
    			<td>'.$value["articletype"]["title"].'</td>
    			<td>'.$value["title"].'</td>
                <td>'.$value["secondtitle"].'</td>
                <td>'.$value["intro"].'</td>
                <td><a href="javascript:publish(\''.$value["id"].'\',\''.$value["status"].'\')">'.$value["statusName"].'</a></td>
                <td><a href="'.url(request()->controller().'/edit',array('id'=>$value['id'])).'"><button class="btn btn-outline btn-default">修改</button>
                    <a href="javascript:del(\''.$value['id'].'\')"><button class="btn btn-outline btn-default">删除</button>
                </td>
    		</tr>';
        return $html;
    }
    public function getArticleStatusName($status){
        switch ($status) {
            case 1:
                $statusName = '未发布';
                break;
            case 2:
                $statusName = '已发布';
                break;
            default:
                $statusName = '未发布';
                break;
        }
        return $statusName;
    }
    function index(){

        $this->_filter($map,$querycond);
        $this->_index($this->model,$map);
    	return $this->fetch(request()->controller().'/index');
    }
    public function publish(){
        $id = getparameter('id');
        $status = getparameter('status');
        $data = [
            'publishtime' => time(),
            'updatetime' => time(),
            'updateuser_id' => session('uid'),
        ];
        if ($status == 1) {
            $data['status'] = 2;
            $msg = '发布成功';
        }else{
            $data['status'] = 1;
            $msg = '取消发布成功';
        }

        $res = db('article')->where(['id'=>$id])->data($data)->update();
        if ($res) {
            $apiRes = [
                'code' => 0,
                'msg' => $msg
            ];
        }else{
            $apiRes = [
                'code' => 1,
                'msg' => '系统繁忙'
            ];
        }
        return $apiRes;
    }
    public function getArticleType(){
        $id = getparameter('id');
        $type = getparameter('type');
        $articletype = db('articletype');
        $phtml = '';
        $shtml = '';

        if (strcmp($type, 'group') === 0) {
            $parent = $articletype->where(['is_delete'=>0,'gid'=>$id,'level'=>1])->field('id,name,title')->select();
            if (!empty($parent)) {
                foreach ($parent as $k1 => $v1) {
                    $phtml .= '<option value="'.$v1['id'].'">'.$v1['title'].'</option>';
                }
                $sub = $articletype->where(['is_delete'=>0,'gid'=>$id,'pid'=>$parent[0]['id'],'level'=>2])->field('id,name,title')->select();
                if (!empty($sub)) {
                    foreach ($sub as $k2 => $v2) {
                        $shtml .= '<option value="'.$v2['id'].'">'.$v2['title'].'</option>';
                    }
                }else{
                    $shtml = '<option value="-10000">暂无下属分类</option>';
                }
            }else{
                $phtml = '<option value="-10000">暂无下属分类</option>';
            }
        }elseif (strcmp($type, 'parent') === 0) {
            $sub = $articletype->where(['is_delete'=>0,'pid'=>$id,'level'=>2])->field('id,name,title')->select();
            if (!empty($sub)) {
                foreach ($sub as $k2 => $v2) {
                    $shtml .= '<option value="'.$v2['id'].'">'.$v2['title'].'</option>';
                }
            }else{
                $shtml = '<option value="-10000">暂无下属分类</option>';
            }
        }
        $apiRes = [
            'phtml' => $phtml,
            'shtml' => $shtml,
        ];
        return $apiRes;
    }
}