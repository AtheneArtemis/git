<?php
/**
* 文件用途描述
* @date: 2017年1月17日 下午3:17:13
* @description:数据处理器
* @author: Administrator：chenkeyu
*/
namespace app\admin\controller;
use app\admin\controller\Index;
class Publicaction extends Index{
    protected $relation = ''; //关联模型，多个以逗号分开;
    protected $map = ['status'=>['gt','0']]; //查询条件参数
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
    function _initialize(){
        parent::_initialize();
        $this->uploadurl = config("UPLOADIMG_URL");
        $this->uploadpath = config("UPLOADIMG_DIR");
    }
    /**
     * 函数用途描述
     * @date: 2017年2月7日 下午4:14:10
     * @author: Administrator：chenkeyu
     * @description: 软删除函数
     * @param: variable
     * @return:
     */
    function delete(){
    
        $action = request()->controller();
        $info = url($action . '/index');
        $id = getparameter('id');
        
        // $data['status'] = '-1';
        $data['is_delete'] = 1;
        $data['updateuser_id'] = session('uid');
        $data['updatetime'] = time();
        
        $sprdata = $this->saveorgoperaterecord('删除数据',$id);
        $tdata = [
            'dboperationhistory' => [
                'operate' => 'insert',
                'data' => $sprdata,
            ],
            $this->model => [
                'operate' => 'update',
                'data' => $data,
                'map' => [
                    'id' => $id
                ]
            ]
        ];
        if (strcmp($this->model,'user') ===0){
            $userinfo = db($this->model)->where('id',$id)->field('id,isshop,company_id,usertype_id')->find();
            if (strcmp($userinfo['usertype_id'], 'electrician') ===0){
                if ($userinfo['isshop']){
                    $tdata['company'] = [
                        'operate' => 'update',
                        'data' => $data,
                        'map' => [
                            'id' => $userinfo['company_id']
                        ]
                    ];
                }
            }else{
                $tdata['company'] = [
                    'operate' => 'update',
                    'data' => $data,
                    'map' => [
                        'id' => $userinfo['company_id']
                    ]
                ];
            }
        }
        $result = $this->transevent($tdata);
        if ($result['code']){
            $this->result($info,1,'删除成功','json');
        }else{
            $this->result($info,0,'删除失败','json');
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
    function shiftdelete(){
    
        $action = request()->controller();
        $info = url($action . '/index');
        $id = getparameter('id');
    
        $sprdata = $this->saveorgoperaterecord('彻底删除数据',$id);
        $data = [
            'dboperationhistory' => [
                'operate' => 'insert',
                'data' => $sprdata,
            ],
            $this->model => [
                'operate' => 'delete',
                'map' => [
                    'id' => $id
                ]
            ]
        ];
        $result = $this->transevent($data);
        if ($result['code']){
            $this->result($info,1,'删除成功','json');
        }else{
            $this->result($info,0,'删除失败','json');
        }
    }
    /**
     * 插入新数据函数
     * @author Administrator：chenkeyu 2017年9月14日 下午4:02:51
     * @param
     * @return
     */
    function insert(){
        $plist = getparameter('post.');
        $model = $this->model;
        
        $fieldinfo = $this->obtaintablestructure($model);
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
        }else{
            if (strcmp($this->model, 'Node') === 0) {
                $data['id'] = generateprimerykey();
            }
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

        $versiontablewhetherornot = $this->tablewhetherornotexist($model . 'his');
        if ($versiontablewhetherornot){
            $versiondata = $this->_recorderversion($model,$data,$data['id']);
            $hisdata = $versiondata[$model . 'his'];
            $data['version'] = $versiondata['version'];
        }
        $sprdata = $this->saveorgoperaterecord('添加新数据',$data['id']);
        $tdata = [
            'dboperationhistory' => [
                'operate' => 'insert',
                'data' => $sprdata,
            ],
            $model => [
                'operate' => 'insert',
                'data' => $data,
            ]
        ];
        if ($versiontablewhetherornot){
            $tdata[$model.'his'] = $hisdata[$model.'his'];
        }
        // fdbg($tdata);
        $result = $this->transevent($tdata);
        if ($result['code']){
            $this->success('操作成功',url(request()->controller().'/index'));
        }else{
            $this->error('操作失败',url(request()->controller().'/index'));
        }
    }
    /**
     * 修改数据函数
     * @author Administrator：chenkeyu 2017年9月14日 下午4:05:03
     * @param
     * @return
     */
    function update(){
    
        $plist = getparameter('post.');
        $model = $this->model;
        
        $fieldinfo = $this->obtaintablestructure($model);
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
        $versiontablewhetherornot = $this->tablewhetherornotexist($model . 'his');
        if ($versiontablewhetherornot){
            $versiondata = $this->_recorderversion($model,$data,$plist['id']);
            $hisdata = $versiondata[$model . 'his'];
            $data['version'] = $versiondata['version'];
        }
        $sprdata = $this->saveorgoperaterecord('修改数据',$plist['id']);
        $tdata = [
            'dboperationhistory' => [
                'operate' => 'insert',
                'data' => $sprdata,
            ],
            $model => [
                'operate' => 'update',
                'data' => $data,
                'map' => ['id' => $plist['id']],
            ]
        ];
        if ($versiontablewhetherornot){
            $tdata[$model.'his'] = $hisdata[$model.'his'];
        }
        $result = $this->transevent($tdata);
        if ($result['code']){
            $this->success('操作成功',url(request()->controller().'/index'));
        }else{
            $this->error('操作失败',url(request()->controller().'/index'));
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
    function multidel(){
    
        $info = url(request()->controller() . '/index');
        $multidelarray = getparameter('multidelarray/a');
        $data['status'] = '-1';
        $data['updateuser_id'] = session('uid');
        $data['updatetime'] = time();
        foreach ($multidelarray as $key => $value){
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
        $otdata = $this->saveorgoperaterecord('多个删除数据', time());
        // 启动事务
        \think\Db::startTrans();
        try{
            foreach ($tdata as $k => $v){
                foreach ($v as $key => $value){
                    $msg[$k][$key] = \think\Db::table('ll'.$key)->where($value['map'])->update($value['data']);
                }
            }
            $msg['dboperationhistory'] = \think\Db::table('ll_dboperationhistory')->insert($otdata);
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
    /**
     * 函数用途描述
     * @date: 2017年8月22日 下午2:02:48
     * @author: Administrator：chenkeyu
     * @description: 还原函数 --- 多个
     * @param: variable
     * @return:
     */
    function reduction(){
    
        $info = url(request()->controller() . '/index');
        $reductionarray = getparameter('reductionarray/a');
        $data['status'] = 1;
        $data['updateuser_id'] = session('uid');
        $data['updatetime'] = time();
        foreach ($reductionarray as $key => $value){
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
        $otdata = $this->saveorgoperaterecord('多个还原数据', time());
        // 启动事务
        \think\Db::startTrans();
        try{
            foreach ($tdata as $k => $v){
                foreach ($v as $key => $value){
                    $msg[$k][$key] = \think\Db::table('ll'.$key)->where($value['map'])->update($value['data']);
                }
            }
            $msg['dboperationhistory'] = \think\Db::table('ll_dboperationhistory')->insert($otdata);
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
    /**
     * 启用事务
     * @author Administrator：chenkeyu 2017年10月10日 上午10:52:55
     * @param array $data = [
     *           'model' => [ (model -- 执行的数据表名)
     *                'operate' => '', (执行的操作名)
     *               'data' => []  (执行的数据--insert,update)
     *               'map' => [] (执行条件--update,delete)
     *           ]
     *       ]
     * @return
     */
    function transevent($data){
        // 启动事务
        \think\Db::startTrans();
        $tablePrefix = config("database.prefix");
        $msg = [];
        try{

            foreach ($data as $key => $value){
                if (strcmp($value['operate'], 'insert') ===0){
                    $msg[$key] = \think\Db::table($tablePrefix.$key)->data($value['data'])->insert();
                    fdbg($key.'-'.$msg[$key]);
                }
                if (strcmp($value['operate'], 'update') ===0){
                    $msg[$key] = \think\Db::table($tablePrefix.$key)->where($value['map'])->update($value['data']);
                    fdbg($key.'-'.$msg[$key]);
                }
                if (strcmp($value['operate'], 'delete') ===0){
                    $msg[$key] = \think\Db::table($tablePrefix.$key)->where($value['map'])->delete();
                    fdbg($key.'-'.$msg[$key]);
                }
            }
            
            $result = [
                'code' => 1,
                'msg' => $msg,
                'info' => '事务提交成功'
            ];
            // 提交事务
            \think\Db::commit();
            return $result;
        } catch (\Exception $e) {
            $result = [
                'code' => 0,
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
    function saveorgoperaterecord($operate,$primarykey,$operation = ''){
        $model = db('dboperationhistory');
        $versionlist = $model->field('tableversion')->where('tablename',$this->model)->where('tableprimarykey',$primarykey)->max('tableversion');
        $version = $versionlist['tableversion'];
        if (empty($version)){
            $version = 0;
        }
        $data = [
            'id' => generateprimerykey(),
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
    function obtaintablestructure($tablename){
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
    function tablewhetherornotexist($tablename){
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
    /**
    * 与X3通信
    * @author Administrator：chenkeyu 2018年3月22日 下午3:19:10
    * @param  
    * @return 
    */
	function _listfromX3($servicecode,$params=null) {
	    if(empty($params)) $params = array();
	    $header = array("servicecode:".$servicecode);
	    $x3interfaceurl = config("LLX3_INTERFACE_URL");
	    $retjsonstring = _http($x3interfaceurl,$header,$params,"POST");
	    $infoarray = object2array(json_decode($retjsonstring));
	    return $infoarray;
	}
	/**
	* 与X3通信 -- 分页模式
	* @author Administrator：chenkeyu 2018年3月22日 下午3:18:44
	* @param  
	* @return 
	*/
	function _listwithpagefromX3($servicecode,$params,$dataname,$withpage=true,$funcfortablelistdata="_generatetabledatahtml",$classname=null,$ajaxfunc="submitquery") {
	    $html = "";
	    if(empty($classname)) $classname = "app\admin\controller\\".request()->controller();
	    $x3interfaceurl = config("LLX3_INTERFACE_URL");
	    //分页处理
	    if($withpage) {
	        //获取分页信息
	        $nowpage = getparameter(config('VAR_PAGE'));
	        if(empty($nowpage)) $nowpage = "1";
	        $pagesize = config('PAGE_LISTROWS');
	        if(empty($pagesize)) $pagesize = "20";
	        $params['page'] = $nowpage;
	        $params['pagesize'] = $pagesize;
	        $header = array("servicecode:".$servicecode);
	        $retjsonstring = _http($x3interfaceurl,$header,$params,"POST");
	        $infoarray = object2array(json_decode($retjsonstring));
	        $totledatacount = $infoarray["totleinfo"]["totlenumber"];
	        $volist = $infoarray[$dataname];
	        	
	        if(!empty($volist)) {
	            foreach($volist as $key=>$value) {
	                $html =  call_user_func_array(array($classname,$funcfortablelistdata),array($html,$value));
	            }
	        }
	        $data["html"] = $html;
	        $data["count"] = $totledatacount;
	        $p = new \app\common\Ajaxpage($totledatacount,$pagesize,$ajaxfunc); //第三个参数是你需要调用换页的ajax函数名,
	        $page = $p->show(); // 产生分页信息，AJAX的连接在此处生成
	        $data["page"] = $page;
	    } else {
	        //没有分页时，一次获取全部数据，此时可将页数设置成理论上的无限大
	        $params['page'] = '1';
	        $params['pagesize'] = '100';
	        $header = array("servicecode:".$servicecode);
	        $retjsonstring = _http($x3interfaceurl,$header,$params,"POST");
	        $infoarray = object2array(json_decode($retjsonstring));
	        $totledatacount = $infoarray["totleinfo"]["totlenumber"];
	        $volist = $infoarray[$dataname];
	        if(!empty($volist)) {
	            foreach($volist as $key=>$value) {
	                $html =  call_user_func_array(array($classname,$funcfortablelistdata),array($html,$value));
	            }
	        }
	        $data["html"] = $html;
	        $data["count"] = $totledatacount;
	    }
	    return $data;
	}
}