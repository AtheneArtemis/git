<?php
namespace app\admin\controller;
use app\admin\controller\Publictable;

class ProductType extends Publictable{
    
    function _initialize(){
        parent::_initialize();
        $this->model = 'product_cat';
        $this->controllername = '商品分类';
        
    }
    function _filter(&$map,&$querycond){
        $map['is_delete'] = array('eq','0');
    }
    function _generatetabledatahtml($html,$id=null){
        $model = db("product_cat");
        $value = $model->where("id",$id)->find();
        if (!empty($value['icon'])) $value['icon'] = $this->uploadurl.$value['icon'];
        if ($value['status'] == 2) $status = '显示';
        else $status = '不显示';
        if ($value['level'] == 1) $levelStr='<a href="'.url('ProductType/add',array('id'=>$value['id'])).'"><button class="btn btn-outline btn-default">添加子分类</button></a>';
        else $levelStr = '';
        
        $html = $html.'
    		<tr>
    			<td class="bs-checkbox"><input data-index="3" name="btSelectItem" type="checkbox" value="'.$value["id"].'"></td>
                <td>'.$value["id"].'</td>
    			<td>'.$value["name"].'</td>
                <td><img src="'.$value["icon"].'" style="width:55px;height:55px;"/></td>
                <td>'.$status.'</td>
    			<td>'.$value["sort"].'</td>
    			<td>'.$value["note"].'</td>
                <td>
                    <a href="'.url('ProductType/edit',array('id'=>$value['id'])).'"><button class="btn btn-outline btn-default">修改</button></a>
                    '.$levelStr.'
                </td>
    		</tr>';
        return $html;
    }
    
    function index(){
        /*$this->_filter($map,$querycond);
        $this->_index("product_cat",$map);*/
        $model = db($this->model);
        $map['is_delete'] = array('eq','0');

        $list = $model->where($map)->where('level',1)->order('sort,createtime desc')->select();
        foreach ($list as $key => $value) {
            if (!empty($value['icon'])) {
                $list[$key]['icon'] = $this->uploadurl.$value['icon'];
            }
            $child[$key] = $model->where($map)->where('parent_id',$value['id'])->order('sort,createtime desc')->select();
            if (!empty($child[$key])) {
                foreach ($child[$key] as $k1 => $v1) {
                    if (!empty($v1['icon'])) {
                        $child[$key][$k1]['icon'] = $this->uploadurl.$v1['icon'];
                    }
                }
            }
            $list[$key]['child'] = $child[$key];
        }
        // var_dump($list);die;
        $this->assign('list',$list);

    	return $this->fetch(request()->controller().'/index');
    }
    public function add(){
        $id = getparameter('id');
        if (!empty($id)) {
            $list = db('product_cat')->where('id',$id)->field('id,name')->find();
            $this->assign('list',$list);
        }

        return $this->fetch(request()->controller().'/add');
    }
   
    public function edit(){
        $id = getparameter('id');
        $list = db($this->model)->where('id',$id)->find();
        if (!empty($list['icon'])) $list['icon'] = $this->uploadurl.$list['icon'];
        $this->assign('list',$list);

        $map = [
            'is_delete' => 0,
            'level' => 1
        ];
        $parentlist = db($this->model)->where($map)->field('id,name')->select();
        $this->assign('parentlist',$parentlist);

        return $this->fetch(request()->controller().'/edit');
    }
    
    
    
}