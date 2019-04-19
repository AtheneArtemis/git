<?php
namespace app\admin\controller;
use app\admin\controller\Publictable;

class Product extends Publictable{
    public $attr_id;
    public $title;
    function _initialize(){
        parent::_initialize();
        $this->model = 'product';
        $this->controllername = '商品列表';
        $this->attr_id = 0;
        $this->title = '商品列表';
        $this->assign('title',$this->title);
        $this->assign('attr_id',$this->attr_id);
    }
    function _filter(&$map,&$querycond){
        $map['is_delete'] = array('eq','0');
        $map['attr_id'] = array('eq',$this->attr_id);
    }
    function _generatetabledatahtml($html,$id=null){
        $model = model("product");
        $value = $model->where("id",$id)->find();
        if ($value["status"] == 2) {
            $upDown = '上架';
            $upDownBtn = '<a href="javascript:upDown(\''.$value['id'].'\',\''.$value['status'].'\')"><button class="btn btn-primary">下架</button></a>';
        }else {
            $upDown = '下架';
            $upDownBtn = '<a href="javascript:upDown(\''.$value['id'].'\',\''.$value['status'].'\')"><button class="btn btn-primary">上架</button></a>';
        }
        if ($this->attr_id == 0) {
            //普通商品
            $html = $html.'
                <tr>
                    <td class="bs-checkbox"><input data-index="3" name="btSelectItem" type="checkbox" value="'.$value["id"].'"></td>
                    <td>'.$value["id"].'</td>
                    <td>'.$value["name"].'</td>
                    <td>'.$value['productCat']["name"].'</td>
                    <td>'.$value["price"].'</td>
                    <td>'.$value["stock"].'</td>
                    <td>'.$value["sort"].'</td>
                    <td>'.$upDown.'&nbsp;&nbsp;'.$upDownBtn.'</td>
                    <td>
                        <a href="'.url(request()->controller().'/edit',array('id'=>$value['id'])).'"><button class="btn btn-outline btn-default">修改</button></a>
                    </td>
                </tr>';
        }elseif ($this->attr_id == 1) {
            //新品上架
            $html = $html.'
                <tr>
                    <td class="bs-checkbox"><input data-index="3" name="btSelectItem" type="checkbox" value="'.$value["id"].'"></td>
                    <td>'.$value["id"].'</td>
                    <td>'.$value["name"].'</td>
                    <td>'.$value["intro"].'</td>
                    <td>'.$value["price"].'</td>
                    <td>'.$value["stock"].'</td>
                    <td>'.$value["sort"].'</td>
                    <td>'.$upDown.'&nbsp;&nbsp;'.$upDownBtn.'</td>
                    <td>
                        <a href="'.url(request()->controller().'/edit',array('id'=>$value['id'])).'"><button class="btn btn-outline btn-default">修改</button></a>
                    </td>
                </tr>';
        }else{
            //TOP热销、精选商品
            $html = $html.'
                <tr>
                    <td class="bs-checkbox"><input data-index="3" name="btSelectItem" type="checkbox" value="'.$value["id"].'"></td>
                    <td>'.$value["id"].'</td>
                    <td>'.$value["name"].'</td>
                    <td>'.$value["price"].'</td>
                    <td>'.$value["stock"].'</td>
                    <td>'.$value["sort"].'</td>
                    <td>'.$upDown.'&nbsp;&nbsp;'.$upDownBtn.'</td>
                    <td>
                        <a href="'.url(request()->controller().'/edit',array('id'=>$value['id'])).'"><button class="btn btn-outline btn-default">修改</button></a>
                    </td>
                </tr>';
        }
        return $html;
    }
    
    function index(){
        $this->_filter($map,$querycond);
        $this->_index($this->model,$map,$fields="id",$order='status desc,sort');
        
    	return $this->fetch(request()->controller().'/index');
    }
    
    public function add(){

        $catlist = db('product_cat')->field('id,name,sort')->where('is_delete','0')->select();
        $this->assign('catlist',$catlist);

        return $this->fetch(request()->controller().'/add');
    }
    
    public function insert(){

        $plist = getparameter('post.');
        if (!empty($_FILES)) {
            $newFiles = false;
            foreach ($_FILES as $kf => $vf) {
                if ($vf['error'] == 0) {
                    $newFiles = true;break;
                }
            }
            if ($newFiles) {
                $pictureSaveInfo = $this->uploadpicturefile();
            }
        }
        $tableFieldInfo = $this->obtaintablestructure($this->model);
        foreach ($plist as $k2 => $v2) {
            if (strcmp($k2, 'id') !== 0) {
                if (in_array($k2, $tableFieldInfo)) {
                    $data[$k2] = $v2;
                }
            }
        }
        $data['attr_id'] = $this->attr_id;
        $data['user_id'] = session('uid');
        $data['createtime'] = time();
        $data['status'] = 1;
        // 启动事务
        \think\Db::startTrans();
        $tablePrefix = config("database.prefix");
        $msg = [];
        try{
            $msg['product'] = \think\Db::table($tablePrefix.'product')->insert($data);
            $product_id =  db($tablePrefix.'product')->getLastInsID();
            if (!empty($pictureSaveInfo)) {
                foreach ($pictureSaveInfo as $k1 => $v1) {
                    $picturedata[$k1] = [
                        'tablename' => 'product',
                        'objectprimarykey' => $product_id,
                        'picture' => $v1['savename'],
                        'pictureattr_id' => $v1['sqlkey'],
                        'user_id' => session('uid'),
                        'createtime' => time(),
                        'status' => 1
                    ];
                    $msg[$k1]['picture'] = \think\Db::table($tablePrefix.'pictures')->insert($picturedata[$k1]);
                }
            }
            $sprdata = $this->saveorgoperaterecord('新增商品',$product_id);
            $msg['dboperationhistory'] = \think\Db::table($tablePrefix.'dboperationhistory')->insert($sprdata);
            fdbg($picturedata);
            fdbg($msg);
            $result = [
                'code' => 1,
                'msg' => $msg,
                'info' => '事务提交成功'
            ];
            // 提交事务
            \think\Db::commit();
        } catch (\Exception $e) {
            $result = [
                'code' => 0,
                'msg' => $msg,
                'info' => '事务提交失败'
            ];
            // 回滚事务
            \think\Db::rollback();
        }
        if ($result[code]){
            $this->success('操作成功',url(request()->controller().'/index'));
        }else{
            $this->error('操作失败',url(request()->controller().'/index'));
        }
    }
    public function edit(){
        $id = getparameter('id');
        $uploadurl = $this->uploadurl;
        //商品分类
        $catlist = db('product_cat')->field('id,name,sort')->where('is_delete','0')->select();
        $this->assign('catlist',$catlist);
        //商品信息
        $list =  model('product')->where('id',$id)->find();
        $this->assign('list',$list);
        //图片信息
        $pmap = [
            'tablename' => 'product',
            'objectprimarykey' => $list['id'],
            'is_delete' => 0
        ];
        $picturelist = db('pictures')->where($pmap)->select();
        $number = 0;
        foreach ($picturelist as $k1 => $v1) {
            if (strcmp($v1['pictureattr_id'], 'thumbpicture') === 0) {
                $thumbpicture = $uploadurl.$v1['picture'];
            }else{
                // $picture[$k1]['pictureattr_id'] = $uploadurl.$v1['pictureattr_id'];
                $picture[$k1]['id'] = $v1['id'];
                $picture[$k1]['pictureattr_id'] = $v1['pictureattr_id'];
                $picture[$k1]['picture'] = $uploadurl.$v1['picture'];
            }
            $pictureattr_id = substr($v1['pictureattr_id'], -1,1);
            $number = $pictureattr_id > $picturenumber ? $pictureattr_id : $picturenumber;
        }
        $number = intval($number) + 1;
        $picturenumber = intval($number) + 1;
        $this->assign('thumbpicture',$thumbpicture);
        $this->assign('picturelist',$picture);
        $this->assign('number',$number);
        $this->assign('picturenumber',$picturenumber);

        return $this->fetch(request()->controller().'/edit');
    }
    public function update(){

        $plist = getparameter('post.');
        $product_id = $plist['id'];
        if (!empty($_FILES)) {
            $newFiles = false;
            foreach ($_FILES as $kf => $vf) {
                if ($vf['error'] == 0) {
                    $newFiles = true;break;
                }
            }
            if ($newFiles) {
                $pictureSaveInfo = $this->uploadpicturefile();
            }
        }
        $tableFieldInfo = $this->obtaintablestructure($this->model);
        foreach ($plist as $k2 => $v2) {
            if (strcmp($k2, 'id') !== 0) {
                if (in_array($k2, $tableFieldInfo)) {
                    $data[$k2] = $v2;
                }
            }
        }
        $data['updateuser_id'] = session('uid');
        $data['updatetime'] = time();
        // 启动事务
        \think\Db::startTrans();
        $tablePrefix = config("database.prefix");
        $msg = [];
        try{
            $msg['product'] = \think\Db::table($tablePrefix.'product')->where('id',$product_id)->update($data);
            if (!empty($pictureSaveInfo)) {
                foreach ($pictureSaveInfo as $k1 => $v1) {
                    $picturecondition[$k1] = [
                        'tablename' => 'product',
                        'objectprimarykey' => $product_id,
                        'pictureattr_id' => $v1['sqlkey'],
                    ];
                    $picturedata[$k1] = [
                        'picture' => $v1['savename'],
                        'updateuser_id' => session('uid'),
                        'updatetime' => time(),
                    ];
                    $msg[$k1]['picture'] = \think\Db::table($tablePrefix.'pictures')->where($picturecondition[$k1])->update($picturedata[$k1]);
                }
                if (substr($v1['sqlkey'], -1,1) >= $plist['picture_number']) {
                    $picturedata[$k1] = [
                        'tablename' => 'product',
                        'objectprimarykey' => $product_id,
                        'picture' => $v1['savename'],
                        'pictureattr_id' => $v1['sqlkey'],
                        'user_id' => session('uid'),
                        'createtime' => time(),
                        'status' => 1
                    ];
                    $msg[$k1]['picture'] = \think\Db::table($tablePrefix.'pictures')->insert($picturedata[$k1]);
                }
            }
            $sprdata = $this->saveorgoperaterecord('修改商品',$product_id);
            $msg['dboperationhistory'] = \think\Db::table($tablePrefix.'dboperationhistory')->insert($sprdata);
            fdbg($picturedata);
            fdbg($msg);
            $result = [
                'code' => 1,
                'msg' => $msg,
                'info' => '事务提交成功'
            ];
            // 提交事务
            \think\Db::commit();
        } catch (\Exception $e) {
            $result = [
                'code' => 0,
                'msg' => $msg,
                'info' => '事务提交失败'
            ];
            // 回滚事务
            \think\Db::rollback();
        }
        unset($picturecondition);unset($picturedata);
        if ($result[code]){
            $this->success('操作成功',url(request()->controller().'/index'));
        }else{
            $this->error('操作失败',url(request()->controller().'/index'));
        }
    }
    public function delPicture(){
        $id = getparameter('id');

        $res = db('pictures')->where('id',$id)->data(['is_delete'=>1])->update();
        if ($res) {
            $result = [
                'code' => 0,
                'msg' => '删除成功',
            ];
        }else{
            $result = [
                'code' => 1,
                'msg' => '系统繁忙',
            ];
        }
        return $result;
    }









    
}