<?php
namespace app\admin\controller;
use app\admin\controller\Base;
class Station extends Base{

	protected function _initialize(){
		parent::_initialize();
        $this->model = 'station';
        $this->controllername = '站点信息';
	}
    
    public function index(){

    	$list = db('station')->where(['is_delete'=>0,'id'=>1,'status'=>1])->find();
    	
        $banner = unserialize($list['banner']);
        $i=0;
        if (!empty($banner)) {
            foreach ($banner as $k1 => $v1) {
                $list['newbanner'][$i] = $v1;
                $i++;
            }
        }

        $number = count($list['banner']) + 1;
        $this->assign('number',$number);

        $this->assign('list',$list);
    	return $this->fetch(request()->controller().'/index');
    }
    public function update(){
        $plist = getparameter('post.');
        $model = $this->model;

        $fieldinfo = $this->obtainTableStructure($model);
        foreach ($plist as $key =>$value){
            if(strcmp(stristr($key,'date'),'date') === 0 || strcmp(stristr($key,'time'),'time') === 0){
                $data[$key] = strtotime($value);
            }elseif (strcmp($key,'id') !== 0 && strcmp($key,'__token__') !== 0 && in_array($key, $fieldinfo)){
                $data[$key] = $value;
            }else {
                $parameter[$key] = $value;
            }
        }
        //修改数据
        if (in_array('updateuser_id', $fieldinfo)){
            $data['updateuser_id'] = session('uid');
        }
        if (in_array('updatetime', $fieldinfo)){
            $data['updatetime'] = time();
        }
        if (!empty($_FILES)) {
            $newFiles = false;
            foreach ($_FILES as $kf => $vf) {
                if ($vf['error'] == 0) {
                    $newFiles = true;break;
                }
            }
            if ($newFiles) {
                $pictureSaveInfo = $this->uploadpicturefile();
                if (!empty($pictureSaveInfo)) {
                    foreach ($pictureSaveInfo as $k1 => $v1) {
                        $plist[$v1['sqlkey']] = $v1['savename'];
                    }
                }
            }
        }
        $i = 1;
        foreach ($plist as $k1 => $v1) {
            if (strpos($k1, 'picture') !== false) {
                $picture[$k1] = [
                    'id' => $i,
                    'picture' => $v1
                ];
                $i++;
            }
        }
        $data['banner'] = serialize($picture);

        $sprdata = $this->saveOperateRecord('修改数据',$plist['id'],serialize($data));
        $tdata = [
            $model => [
                'operate' => 'update',
                'data' => $data,
                'map' => ['id' => $plist['id']],
            ],
            'dboperationhistory' => [
                'operate' => 'insert',
                'data' => $sprdata,
            ],
        ];
        $result = $this->transevent($tdata);
        if ($result['code'] == 0){
            $this->success('操作成功',url(request()->controller().'/index'));
        }else{
            $this->error('操作失败');
        }
    }
}