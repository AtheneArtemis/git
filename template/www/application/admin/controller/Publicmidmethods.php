<?php
/**
* 文件用途描述
* @date: 2017年2月6日 上午11:53:40
* @description:中间业务逻辑处理器
* @author: Administrator：chenkeyu
*/
namespace app\admin\controller;
use app\admin\controller\Publicaction;
class Publicmidmethods extends Publicaction{
    
    //写入历史
    function _recorderversion($oriactionname,$data,$oriprimarykey) {
        if(empty($oriactionname)) $oriactionname = $this->model;
        //由于版本历史表是后来添加的，因此为保持一致性，在修改时，如果之前有数据但历史表中没有数据，则补充上
        $retdata = $this->_checkmodifyfields_aftersave($oriactionname,$oriprimarykey,$data); //有字段发生了修改
        if(!empty($retdata)) {
            $oritablecolumn = strtolower($oriactionname)."_id";
            $map[$oritablecolumn] = $oriprimarykey;
            //根据查询条件获得最新的版本号
            $hismodel = db($oriactionname."his");
            $oldversion = $hismodel->where($map)->max("version");
            if(empty($oldversion)) {
                $oldversion = 0;
            }
            $newversion = intval($oldversion) + 1;
            // 将数据插入到历史表中
            //为了保证每个版本数据的完整性，将$data中没有的字段也补充上，这些数据来源于当前版本的数据
            $hisdata = $this->_replenish($oriactionname,$data,$oriprimarykey);
            if (strcmp('user', $oriactionname) ===0){
                $hisdata["createuser_id"] = session('uid');
            }
            $hisdata[strtolower($oriactionname)."_id"] = $oriprimarykey;
            
            $hisprimarykey = generateprimerykey();
            $hisdata["id"] = $hisprimarykey;
            $hisdata["lastmodifyfields"] = $retdata["lastmodifyfields"];
            $hisdata["updateuser_id"] = session('uid'); //数据的创建日期不变,版本日期记录为修改日期
            $hisdata["updatetime"] = time();
            $hisdata["version"] = $newversion;
            $result = [
                $oriactionname.'his' => [
                    'operate' => 'insert',
                    'data' => $hisdata
                ],
                'version'=>$newversion,
            ];
            return $result;
        } else {
            return false;
        }
    }
    //保存之后判断哪些字段进行了修改，返回发生修改了的字段，没有修改的不用返回保存
    //由于是先保存原表，再修改历史表，因此，可以用历史表中的最后的记录来做比较
    function _checkmodifyfields_aftersave($oriactionname,$oriprimarykey,$inputdata) {
        $modifyfields = "";
        $hismodel = db(ucfirst($oriactionname)."his");
        $condition = "status > 0 and ".strtolower($oriactionname)."_id = '".$oriprimarykey."'";
        $list = $hismodel->where($condition)->order("version desc")->select();
        $vo = $list["0"];
        
        unset($inputdata["id"]);  //历史表和原始表的id值不一样，因此比较无意义
        unset($inputdata["password"]); //密码另做修改
        unset($inputdata["createtime"]);  //历史表和原始表的id值不一样，因此比较无意义
        unset($inputdata["updatetime"]);  //历史表和原始表的id值不一样，因此比较无意义
        unset($inputdata["lastmodifyfields"]);  //历史表和原始表的id值不一样，因此比较无意义
        foreach($inputdata as $columnname=>$value) {
            if(strcmp($value,$vo[$columnname]) !== 0) { //该字段修改了
                $newdata[$columnname] = $value;
                if(empty($modifyfields)) $modifyfields = $columnname;
                else $modifyfields = $modifyfields.",".$columnname;
            }
        }
        if(!empty($newdata)) {
            $newdata["lastmodifyfields"] = $modifyfields;
        }
        return $newdata;
    }
    //为了保证每个版本数据的完整性，将$data中没有的字段也补充上，这些数据来源于当前版本的数据
    function _replenish($oriactionname,$data,$oriprimarykey) {
        $model = db(ucfirst($oriactionname));
        $vo = $model->find($oriprimarykey);
        foreach($data as $columnname=>$value) {
            $vo[$columnname] = $value;
        }
        $vo["lastmodifyfields"] = "";
        return $vo;
    }
    //查询字段数据是否存在-单个
    function enquiriesdataifexist(){
        
        $data = getparameter('post.');
        foreach ($data as $key => $value){
            $ret = db($this->model)->where($key,$value)->find();
            if ($ret){
                //存在
                $this->result('',0,'不可用');
            }
            else{
                //不存在
                $this->result('',1,'可用');
            }
        }
    }
    /**
    * 函数用途描述
    * @date: 2017年8月21日 下午2:38:29
    * @author: Administrator：chenkeyu
    * @description: 省市联动 --添加。修改
    * @param: variable
    * @return:
    */
    //******** 城市级联 START *******************
    function getinitprovincecityzonedata($id) {
        //如果有商品，则获取商品数据
        $model = model ($this->model);
        if(!empty($id)) {
            $vo =$model->find($id);
            $thiszoneid = $vo["zone_id"];
            $thiscityid = $vo["city_id"];
            $thisprovinceid = $vo["province_id"];
        }
        //获得初始国家、省份和城市
        $model = db("Province");
        $condition = "status > 0 ";
        $data = $model->where($condition)->field("id,name")->select();
        foreach($data as $key=>$value) {
            if(strcmp($value["id"],$thisprovinceid) === 0) $selected = "selected";
            else $selected = "";
            $provincehtml .= "<option value='".$value['id']."' ".$selected." >".$value['name']."</option>";
        }
        $initdata["province"] = $provincehtml;
        $model = db("City");
        if(empty($thisprovinceid)) $thisprovinceid = $data["0"]["id"];
        $condition = "status > 0 and province_id = '".$thisprovinceid."'";
        $data = $model->where($condition)->field("id,name")->select();
        foreach($data as $key=>$value) {
            if(strcmp($value["id"],$thiscityid) === 0) $selected = "selected";
            else $selected = "";
            $cityhtml .= "<option value='".$value['id']."' ".$selected." >".$value['name']."</option>";
        }
        $initdata["city"] = $cityhtml;
    
        $model = db("Zone");
        if(empty($thiscityid)) $thiscityid = $data["0"]["id"];
        $condition = "status > 0 and city_id = '".$thiscityid."'";
        $data = $model->where($condition)->field("id,name")->select();
        foreach($data as $key=>$value) {
            if(strcmp($value["id"],$thiszoneid) === 0) $selected = "selected";
            else $selected = "";
            $zonehtml .= "<option value='".$value['id']."' ".$selected." >".$value['name']."</option>";
        }
        $initdata["zone"] = $zonehtml;
        $this->assign("initdata",$initdata);
    }
    
    function obtaincitylist(){
        
        $provinceid = getparameter('provinceid');
        $model = db("City");
        $condition = "status > 0 and province_id = '".$provinceid."'";
        $data = $model->where($condition)->field("id,name")->select();
        foreach($data as $key=>$value) {
            $html .= '<option value="'.$value['id'].'">'.$value['name'].'</option>';
        }
        $userdata["selectitems"] = $html;
        $html = "";
        $cityid = $data["0"]["id"];
        $model = db("Zone");
        $condition = "status > 0 and city_id = '".$cityid."'";
        $data = $model->where($condition)->field("id,name")->select();
        foreach($data as $key=>$value) {
            $html .= '<option value="'.$value['id'].'">'.$value['name'].'</option>';
        }
        $userdata["zoneitems"] = $html;
        $this->result($userdata,1,'','json');
    }
    function obtainzonelist(){
        
        $cityid = getparameter('cityid');
        $list = db('zone')->where('city_id',$cityid)->where('status','gt','0')->field('id,name')->select();
        $html = '';
        foreach ($list as $key => $value){
            $html .= '<option value="'.$value['id'].'" >'.$value['name'].'</option>';
        }
        $this->result($html,1,'','json');
    }
    /**
     * 函数用途描述
     * @date: 2017年8月21日 下午2:38:29
     * @author: Administrator：chenkeyu
     * @description: 省市联动---查询
     * @param: variable
     * @return:
     */
    function obtainquerycitylist(){
        $provinceid = getparameter('provinceid');
        $municipalities = ['上海市','重庆市','北京市','天津市'];
        $html = '<option value="-10000">全部城市</option>';
        $list = db('city')->where('province_id',$provinceid)->where('status','gt','0')->field('id,name')->select();
        foreach ($list as $key => $value){
            $html .= '<option value="'.$value['id'].'">'.$value['name'].'</option>';
        }
        $this->result($html,1,'','json');
    }
    function obtainqueryzonelist(){
        $cityid = getparameter('cityid');
        $list = db('zone')->where('city_id',$cityid)->where('status','gt','0')->field('id,name')->select();
        $html = '<option value="-10000">全部区域</option>';
        foreach ($list as $key => $value){
            $html .= '<option value="'.$value['id'].'" >'.$value['name'].'</option>';
        }
        $this->result($html,1,'','json');
    }
    /**
     * 添加页面的省市区列表
     * @author: 2018年2月10日 下午11:51:05-Administrator：chenkeyu
     * @param:
     * @return:
     */
    function obtainprovincecityzonelist(){
        //省市区列表
        $provincelist = db('province')->where('status','gt','0')->select();
        $this->assign('provincelist',$provincelist);
    
        $citylist = db('city')->where('province_id','aowcap1449552726biegdw')->where('status','gt','0')->select();
        $this->assign('citylist',$citylist);
    
        $zonelist = db('zone')->where('city_id','ldnxcn1449552801justgo')->where('status','gt','0')->select();
        $this->assign('zonelist',$zonelist);
    }
    /**
     * 验证手机号是否存在 --- user表
     * @author: 2018年2月10日 下午11:34:45-Administrator：chenkeyu
     * @param: variable
     * @return:
     */
    function validmobile(){
    
        $name = getparameter('name');
        $param = getparameter('param');
        
        $id = getparameter('id');
        if (!empty($id)){
            $oldparam = db('user')->where('id',$id)->field($name)->find();
            if (strcmp($oldparam[$name],$param) !==0){
                $result = db('user')->where($name,$param)->where('status','gt','0')->select();
            }
        }else{
            $result = db('user')->where($name,$param)->where('status','gt','0')->select();
        }
        if (!empty($result)){
            //已存在
            $ret = [
                'info' => '手机号码已存在',
                'status' => 'n',
            ];
            echo json_encode($ret);
        }else{
            //不存在
            $ret = [
                'info' => '',
                'status' => 'y',
            ];
            echo json_encode($ret);
        }
    }
    /**
     * 验证公司名称是否存在 --- company表
     * @author: 2018年2月10日 下午11:34:45-Administrator：chenkeyu
     * @param: variable
     * @return:
     */
    function validcompanyname(){
    
        $name = getparameter('name');
        $param = getparameter('param');

        $companyid = getparameter('companyid');
        if (!empty($companyid)){
            $oldparam = db('company')->where('id',$companyid)->field('name')->find();
            if (strcmp($oldparam[$name],$param) !==0){
                $result = db('company')->where($name,$param)->where('status','gt','0')->select();
            }
        }else{
            $result = db('company')->where($name,$param)->where('status','gt','0')->select();
        }
        if (!empty($result)){
            //已存在
            $ret = [
                'info' => '公司名称已存在',
                'status' => 'n',
            ];
            echo json_encode($ret);
        }else{
            //不存在
            $ret = [
                'info' => '',
                'status' => 'y',
            ];
            echo json_encode($ret);
        }
    }
    /**
     * 验证检查项是否存在
     * @author: 2018年2月10日 下午11:34:45-Administrator：chenkeyu
     * @param: variable
     * @return:
     */
    function validexist(){
    
        $name = getparameter('name');
        $param = getparameter('param');
        $result = db($this->model)->where($name,$param)->select();
        if (!empty($result)){
            //已存在
            $ret = [
                'info' => '检查值已存在，不可重复',
                'status' => 'n',
            ];
            echo json_encode($ret);
        }else{
            //不存在
            $ret = [
                'info' => '',
                'status' => 'y',
            ];
            echo json_encode($ret);
        }
    }
    /**
    * 图片处理函数 --- 如果没有，则插入，如果有，则修改，从而保持始终只有一条 ----写入专用图片表-pictures
    * @author Administrator：chenkeyu 2017年9月18日 下午4:47:38
    * @param string $tablename 图片来源数据表
    * @param string $objectprimarykey 图片来源数据表主键
    * @param string $whethermainpicture primary--封面图，general--普通图
    * @param string $title 图片标题
    * @param string $secondtitle 图片副标题
    * @return 
    */
    function insertorupdatepicture($tablename,$objectprimarykey,$whethermainpicture,$title,$secondtitle) {
//         dump($_FILES['error'] !== 0);die;
        if($_FILES['error'] === 0) {
            $uploadfilelist = $this->uploadpicturefile();
            if(isset($uploadfilelist)){
                //写入数据库
                $ret = $this->writeorsavedataintopicturetable($tablename,$objectprimarykey,$uploadfilelist,$whethermainpicture,$title,$secondtitle);
                return $ret;
            } else {
                $this->error("上传附件失败");
            }
        }else{
            fdbg(date('Y-m-d H:i:s',time()).'_未选择上传附件');
            return true;
        }
    }
    /**
    * 图片上传函数
    * @author Administrator：chenkeyu 2017年9月19日 上午11:21:16
    * @param 
    * @return 
    */
    function uploadpicturefile() {
    	$uploadpath = $this->uploadpath;
        if(!empty($_FILES)) {
            $uploadpic = new \app\common\UploadFile();
            //设置上传文件大小
            $uploadpic->maxSize = 50000000;
            //设置上传文件类型
            $uploadpic->allowExts = explode(',','jpg,png,jpeg,gif');
            //设置附件上传目录
            $uploadpic->savePath = $uploadpath;
            //设置上传文件规则
            $uploadpic->saveRule = uniqid;
            /*//设置需要生成缩略图，仅对图像文件有效
            $uploadpic->thumb = false;
            //设置需要生成缩略图的文件前缀
            $uploadpic->thumbPrefix = 'l_,m_,s_';
            //设置缩略图最大宽度
            $uploadpic->thumbMaxWidth = '1000,700,300';
            //设置缩略图最大高度
            $uploadpic->thumbMaxHeight = '1000,700,300';*/
            //删除原图
            if(!$uploadpic->upload()) {
                //捕获上传异常
                //dump("upload attachment error!");
            } else {
                //取得成功上传的文件信息
                $uploadList = $uploadpic->getUploadFileInfo();
                return $uploadList;
            }
        } else {
            if(empty($mustupload) || !isset($mustupload)) {
                $this->error("请上传图片文件");
            }
        }
    }
    function obtainpicturelist($tablename,$objectprimarykey) {
        if(empty($tablename)) {
            $tablename = strtolower($this->model);
        }
        $map['status'] = '1';
        $map['tablename'] = $tablename;
        if(!empty($objectprimarykey)) {
            $map['objectprimarykey'] = $objectprimarykey;
        }
        $picdata = db("pictures")->where($map)->field("id,picture,title,pictureattr_id")->order("createtime desc")->select();
        foreach($picdata as $key=>$value) {
            $picdata[$key]["pictureid"] = $value["id"];
            $picdata[$key]["objectprimarykey"] = $value["objectprimarykey"];
            $picdata[$key]["picture"] = $this->uploadpath."m_".$value["picture"];
            $picdata[$key]["largepicture"] = $this->uploadpath."l_".$value["picture"];
        }
        return $picdata;
    }
    /**
     * 文件上传函数
     * @author Administrator：chenkeyu 2017年9月19日 上午11:21:16
     * @param
     * @return
     */
    function uploadfile() {
        $uploadpath = config('UPLOADFILE_DIR');
        if(!empty($_FILES)) {
            $uploadpic = new \app\common\UploadFile();
            //设置上传文件大小
            $uploadpic->maxSize = 50000000;
            //设置上传文件类型
            $uploadpic->allowExts = explode(',','doc,pdf,xls,xlsx,docx,jpg,jpeg,png,gif');
            //设置附件上传目录
            $uploadpic->savePath = $uploadpath;
            //设置上传文件规则
            $uploadpic->saveRule = uniqid;
            if(!$uploadpic->upload()) {
                //捕获上传异常
                //dump("upload attachment error!");
                fdbg($uploadpic->getErrorMsg());
            } else {
                //取得成功上传的文件信息
                $uploadList = $uploadpic->getUploadFileInfo();
                return $uploadList;
            }
        } else {
            if(empty($mustupload) || !isset($mustupload)) {
                $this->error("上传文件类型不正确或文件不存在");
            }
        }
    }
    /**
     * 图片数据写入函数
     * @author Administrator：chenkeyu 2017年9月18日 下午4:47:38
     * @param string $tablename 图片来源数据表
     * @param string $objectprimarykey 图片来源数据表主键
     * @param string $uploadpicturelist 图片保存信息列表
     * @param string $whethermainpicture primary--封面图，general--普通图
     * @param string $title 图片标题
     * @param string $secondtitle 图片副标题
     * @return
     */
    function writeorsavedataintopicturetable($tablename,$objectprimarykey,$uploadpicturelist,$whethermainpicture,$title,$secondtitle){
        $totalret = true;
        $model = db("pictures");
        for($i=0;$i<count($uploadpicturelist);$i++){
            $picturename = $uploadpicturelist[$i]['savename'];   //等同与$img=array('img'=>$data[0]['savename']);
            $data["picture"] = $picturename;
            $data["tablename"] = $tablename;
            $data["objectprimarykey"] = $objectprimarykey;
            $data["title"] = $title;
            $data["secondtitle"] = $secondtitle;
            $data["pictureattr_id"] = $whethermainpicture;
    
            $sql = "select id from pictures where status = 1
            	and tablename = '".$tablename."'
            	and objectprimarykey = '".$objectprimarykey."'";
            $querydata = $model->query($sql);
            $id = $querydata["0"]["id"];
            if(empty($id)) { //没有，插入
                $basedata = $this->getbasedataforinsert();
                $data = array_merge($basedata,$data);
                $picdata = [
                    'pictures' => [
                        'operate' => 'insert',
                        'data' => $data
                    ]
                ];
            } else {
                $data["id"] = $id;
                $picdata = [
                    'pictures' => [
                        'operate' => 'update',
                        'data' => $data,
                        'map' => ['id'=>$id]
                    ]
                ];
            }
        }
        return $picdata;
    }
    /**
     * 异步请求分页
     * @author: 2017年12月1日 下午12:00:55-Administrator：chenkeyu
     * @param: $model 执行的模型名
     * @param: $map 查询条件
     * @param: $fields 查询字段
     * @param: $limitRows 查询行数
     * @param: $order 排序条件
     * @param: $ajaxfunction ajax函数名
     * @return:
     */
    function _listByAjaxPage($model,$map,$fields,$limitRows,$order,$ajaxfunction) {
        if(empty($order)) $order = 'createtime desc';
        if(empty($fields)) $fields = "id";
        if(empty($limitRows)) $limitRows = 5;

        $count = db($model)->where($map)->count(); //计算记录数
        $p = new \app\common\Ajaxpage($count, $limitRows,$ajaxfunction); //第三个参数是你需要调用换页的ajax函数名,
        //导入分页类  注意导入的是自己写的AjaxPage类

        $limit_value = $p->firstRow . "," . $p->listRows;
        //设置排序条件
        $idlist = db($model)->where($map)->field($fields)->order($order)->limit($limit_value)->select(); // 查询数据
        foreach ($idlist as $key=>$value){
            $html[$key] = $this->obtaincolumninfobyid($model,$value['id']);
        }
        $page = $p->show(); // 产生分页信息，AJAX的连接在此处生成
        $data["html"] = $html;
        $data["page"] = $page;
        $data["count"] = $count;

        return $data;
    }
    function obtaincolumninfobyid($model,$id){
        $list = model($model)->where('id',$id)->find();
        return $list;
    }
    /**
     * 根据id获得行内容
     * @author: 2017年12月1日 下午12:02:47-Administrator：chenkeyu
     * @param: variable
     * @return:
     */
    function obtaincolumnbyid($model,$field='id,name',$id){
        $list = model($model)->where('id',$id)->field($field)->find();
        return $list;
    }
    /**
    * 根据id获得某列内容
    * @author Administrator：chenkeyu 2017年12月25日 上午9:53:46
    * @param 
    * @return 
    */
    function obtainonecolumnbyid($model,$column,$id){
        $list = model($model)->where('id',$id)->field($column)->find();
        $value = $list[$column];
        return $value;
    }
    /**
    * 根据条件获得指定行列内容
    * @author: 2018年1月17日 下午7:10:28-Administrator：chenkeyu
    * @param  string $model 表名
    * @param  string $column 需要获取的列
    * @param  string $columnid 条件所属列
    * @param  string $columnmap 条件
    * @return 
    */
    function obtaincolumn($model,$column,$columnid,$columnmap){
        $fields = $this->obtaintablestructure($model);
        if (!in_array('createtime', $fields)){
            $order = '';
        }else{
            $order = 'createtime desc';
        }
//         dump($columnmap);
        $list = db($model)->where($columnid,$columnmap)->where('status','gt','0')->field($column)->order($order)->select();
        $value = $list[0][$column];
        return $value;
    }
    
    
    
    
    
    
    
    
    
    
}