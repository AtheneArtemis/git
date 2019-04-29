<?php
/**
* 文件用途描述
* @date: 2017年1月17日 下午3:17:13
* @description:数据处理器
* @author: Administrator：chenkeyu
*/
namespace app\admin\controller;
use think\Controller;
class Publicaction extends Controller{
    protected $relation = ''; //关联模型，多个以逗号分开;
    protected $map = ['is_delete'=>0]; //查询条件参数
    protected $model = '';//需要实例化的模型
    protected $controllername = '';//执行操作的控制器名
    protected $order = '';//排序条件
    protected $field = '';//查询字段
    protected $querybar = [];//查询栏
    protected $uploadurl;
    protected $uploadpath;
    /** 查询栏说明
     *  $querybar = [
     *      'user' => [ ----需要查询的数据表
     *          'map' => [] ----查询条件
     *          'field' => '' ----查询字段
     *          'order' => '' ----排序条件
     *      ]
     *  ];
     * */
    protected function _initialize(){
        parent::_initialize();
        $this->uploadurl = config("UPLOADIMG_URL");
        $this->assign('uploadurl',$this->uploadurl);
        $this->uploadpath = config("UPLOADIMG_DIR");
        if (empty($this->model)) {
            $this->model = request()->controller();
        }
        if (empty($this->controllername)) {
            $this->controllername = request()->controller();
        }
    }
    /**
     * 函数用途描述
     * @date: 2017年2月7日 下午4:14:10
     * @author: Administrator：chenkeyu
     * @description: 软删除函数
     * @param: variable
     * @return:
     */
    public function delete(){
        $id = getparameter('id');
        $data['is_delete'] = 1;
        $data['updateuser_id'] = session('uid');
        $data['updatetime'] = time();
        
        $sprdata = $this->saveOperateRecord('删除数据',$id,serialize($data));
        $tdata = [
            $this->model => [
                'operate' => 'update',
                'data' => $data,
                'map' => [
                    'id' => $id
                ]
            ],
            'dboperationhistory' => [
                'operate' => 'insert',
                'data' => $sprdata,
            ],
        ];
        $result = $this->transevent($tdata);
        if ($result['code'] == 0){
            $this->result('success',0,'删除成功','json');
        }else{
            $this->result('error',1,'删除失败','json');
        }
    }
    /**
     * 函数用途描述
     * @date: 2017年2月7日 下午4:14:10
     * @author: Administrator：chenkeyu
     * @description: 彻底删除函数
     * @param: variable
     * @return:
     */
    public function shiftdelete(){
        $id = getparameter('id');
        
        $sprdata = $this->saveOperateRecord('彻底删除数据',$id,serialize($id));
        $tdata = [
            $this->model => [
                'operate' => 'delete',
                'map' => [
                    'id' => $id
                ]
            ],
            'dboperationhistory' => [
                'operate' => 'insert',
                'data' => $sprdata,
            ],
        ];
        $result = $this->transevent($tdata);
        if ($result['code'] == 0){
            $this->result('success',0,'删除成功','json');
        }else{
            $this->result('error',1,'删除失败','json');
        }
    }
    /**
     * 插入新数据函数
     * @author Administrator：chenkeyu 2017年9月14日 下午4:02:51
     * @param
     * @return
     */
    public function insert(){
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
        //添加数据
        if (!empty($plist['id'])){
            $data['id'] = $plist['id'];
        }
        if (in_array('company_id', $fieldinfo)){
            $data['company_id'] = session('companyid');
        }
        if (in_array('user_id', $fieldinfo)){
            $data['user_id'] = session('uid');
        }
        if (in_array('createtime', $fieldinfo)){
            $data['createtime'] = time();
        }
        if (empty($plist['status'])) {
            $data['status'] = 1;
        }else{
            $data['status'] = $plist['status'];
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
                        $data[$v1['sqlkey']] = $v1['savename'];
                    }
                }
            }
        }
        $sprdata = $this->saveOperateRecord('添加新数据',$data['id'],serialize($data));
        $tdata = [
            $model => [
                'operate' => 'insert',
                'data' => $data,
            ],
            'dboperationhistory' => [
                'operate' => 'insert',
                'data' => $sprdata,
            ],
        ];
        // fdbg($tdata);
        $result = $this->transevent($tdata);
        if ($result['code'] == 0){
            $this->success('操作成功',url(request()->controller().'/index'));
        }else{
            $this->error('操作失败');
        }
    }
    /**
     * 修改数据函数
     * @author Administrator：chenkeyu 2017年9月14日 下午4:05:03
     * @param
     * @return
     */
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
                        $data[$v1['sqlkey']] = $v1['savename'];
                    }
                }
            }
        }
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
    /**
     * 函数用途描述
     * @date: 2017年8月22日 下午2:02:48
     * @author: Administrator：chenkeyu
     * @description: 删除函数 --- 多个
     * @param: variable
     * @return:
     */
    function multidelete(){
    
        $ids = getparameter('ids/a');
        $data['is_delete'] = 1;
        $data['updateuser_id'] = session('uid');
        $data['updatetime'] = time();
        foreach ($ids as $key => $value){
            if (strcmp($value, '') !==0 || !$value){
                $tdata[$key] = [
                    $this->model => [
                        'operate' => 'update',
                        'data' => $data,
                        'map' => ['id'=>$value]
                    ]
                ];
            }
        }
        $sprdata = $this->saveOperateRecord('多个删除数据',serialize($ids),serialize($tdata));
        // 启动事务
        \think\Db::startTrans();
        try{
            foreach ($tdata as $k => $v){
                foreach ($v as $key => $value){
                    $msg[$k][$key] = db($key)->where($value['map'])->update($value['data']);
                }
            }
            $msg['dboperationhistory'] = db('dboperationhistory')->insert($sprdata);
            $result = [
                'code' => 0,
                'msg' => $msg,
                'info' => '事务提交成功'
            ];
            // 提交事务
            \think\Db::commit();
        } catch (\Exception $e) {
            $result = [
                'code' => 1,
                'msg' => $msg,
                'info' => '事务提交失败'
            ];
            // 回滚事务
            \think\Db::rollback();
        }
        if ($result['code'] == 0){
            $this->result('success',0,'删除成功','json');
        }else{
            $this->result('error',1,'删除失败','json');
        }
    }
    /**
     * 函数用途描述
     * @date: 2017年8月22日 下午2:02:48
     * @author: Administrator：chenkeyu
     * @description: 还原函数 --- 多个
     * @param: variable
     * @return:
     */
    function reduction(){
    
        $ids = getparameter('ids/a');
        $data['status'] = 1;
        $data['updateuser_id'] = session('uid');
        $data['updatetime'] = time();
        foreach ($ids as $key => $value){
            if (strcmp($value, '') !==0){
                $tdata[$key] = [
                    $this->model => [
                        'operate' => 'update',
                        'data' => $data,
                        'map' => ['id'=>$value]
                    ]
                ];
            }
        }
        $sprdata = $this->saveOperateRecord('多个还原数据',serialize($ids),serialize($tdata));
        // 启动事务
        \think\Db::startTrans();
        try{
            foreach ($tdata as $k => $v){
                foreach ($v as $key => $value){
                    $msg[$k][$key] = db($key)->where($value['map'])->update($value['data']);
                }
            }
            $msg['dboperationhistory'] = db('dboperationhistory')->insert($sprdata);
            $result = [
                'code' => 0,
                'msg' => $msg,
                'info' => '事务提交成功'
            ];
            // 提交事务
            \think\Db::commit();
        } catch (\Exception $e) {
            $result = [
                'code' => 1,
                'msg' => $msg,
                'info' => '事务提交失败'
            ];
            // 回滚事务
            \think\Db::rollback();
        }
        if ($result['code'] == 0){
            $this->success('还原成功',url(request()->controller().'/index'));
        }else{
            $this->error('还原失败');
        }
    }
    /**
     * 启用事务
     * @author Administrator：chenkeyu 2017年10月10日 上午10:52:55
     * @param array $data = [第一个为主表
     *           'model' => [ (model -- 执行的数据表名)
     *               'operate' => '', (执行的操作名)
     *               'data' => []  (执行的数据--insert,update)
     *               'map' => [] (执行条件--update,delete)
     *           ]
     *       ]
     * @return
     */
    function transevent($data){
        // 启动事务
        \think\Db::startTrans();
        // $tablePrefix = config("database.prefix");
        $msg = [];
        try{
            $i = 0;
            foreach ($data as $key => $value){
                if (strcmp($key,'dboperationhistory') === 0) {
                    if (!empty($id[0]['id']) && empty($value['data']['tableprimarykey'])) {
                        $value['data']['tableprimarykey'] = $id[0]['id'];
                    }
                }
                if (strcmp($value['operate'], 'insert') === 0){
                    $msg[$key] = db($key)->data($value['data'])->insert();
                    $id[$i]['id'] = db($key)->getLastInsID();
                }
                if (strcmp($value['operate'], 'update') === 0){
                    $msg[$key] = db($key)->where($value['map'])->update($value['data']);
                }
                if (strcmp($value['operate'], 'delete') === 0){
                    $msg[$key] = db($key)->where($value['map'])->delete();
                }
            }
            $result = [
                'code' => 0,
                'msg' => $msg,
                'info' => '事务提交成功'
            ];
            // 提交事务
            \think\Db::commit();
            return $result;
        } catch (\Exception $e) {
            $result = [
                'code' => 1,
                'msg' => $msg,
                'info' => '事务提交失败'
            ];
            // 回滚事务
            \think\Db::rollback();
            return $result;
        }
    }
    /**
     * 操作记录数据
     * @author: Administrator：chenkeyu 2017年9月14日 下午2:32:44
     * @param string $operate 具体操作
     * @param string $primarykey 关联表主键
     * @return true or false
     */
    protected function saveOperateRecord($operate,$primarykey,$operation = ''){
        $model = db('dboperationhistory');
        $version = $model->field('tableversion')->where('tablename',$this->model)->where('tableprimarykey',$primarykey)->max('tableversion');
        if (empty($version)){
            $version = 0;
        }
        $data = [
            'tablename' => $this->model,
            'controllername' => $this->controllername,
            'tableversion' => intval($version) + 1,
            'tableprimarykey' => $primarykey,
            'operationtype' => $operate,
            'operation' => $operation,
            'operatetime' => time(),
            'user_id' => session('uid'),
            'company_id' => session('companyid')
        ];
        return $data;
    }
    
    /**
    * 函数用途描述
    * @date: 2017年8月17日 上午10:06:50
    * @author: Administrator：chenkeyu
    * @description: 获取表结构
    * @param: variable
    * @return:
    */
    protected function obtainTableStructure($tablename){
        $newtablename = strtolower($tablename);
        $tablePrefix = config("database.prefix");
        $sql = "describe ".$tablePrefix.$newtablename;
        $model = db();
        $info = $model->query($sql);
        foreach ($info as $key => $value){
            $finfo[$key] = $value['Field'];
        }
        return $finfo;
    }
    /**
    * 查询数据表是否存在
    * @author Administrator：chenkeyu 2017年10月12日 上午9:39:20
    * @param string $tablename 数据表名
    * @return 
    */
    protected function tableWhetherornotExist($tablename){
        $newtablename = strtolower($tablename);
        $tablePrefix = config("database.prefix");
        $sql = "show tables like '".$tablePrefix.$newtablename."'";
        $model = db();
        $result = $model->query($sql);
        if (empty($result)){
            return false;
        }else{
            return true;
        }
    }
}