<?php
namespace app\admin\controller;
use app\admin\controller\Base;
class Aboutus extends Base{

	protected function _initialize(){
		parent::_initialize();
        $this->model = 'station';
        $this->controllername = '站点信息';
	}
    
    public function index(){

    	$list = db('station')->where(['is_delete'=>0,'id'=>2,'status'=>1])->find();
        $loginbg = unserialize($list['loginbg']);
        $i=0;
        if (!empty($loginbg)) {
            foreach ($loginbg as $k1 => $v1) {
                $list['newloginbg'][$i] = $v1;
                $i++;
            }
        }

        $number = count($list['newloginbg']) + 1;
        $this->assign('number',$number);

    	$this->assign('list',$list);
    	return $this->fetch(request()->controller().'/index');
    }
    public function update(){
        $plist = getparameter('post.');
        $model = $this->model;

        $data['description'] = $plist['description'];
        $data['updateuser_id'] = session('uid');
        $data['updatetime'] = time();
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
        $data['loginbg'] = serialize($picture);

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