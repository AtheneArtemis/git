<?php
/**
* 文件用途描述
* @date: 2017年1月17日 下午3:17:46
* @description:页面生成器
* @author: Administrator:chenkeyu
*/
namespace app\admin\controller;
use app\admin\controller\Publicmidmethods;
class Publictable extends Publicmidmethods{
	/**
	* 首页数据
	* @author Administrator：chenkeyu 2018年3月22日 下午3:16:53
	* @param  
	* @return 
	*/
    function _listByAjaxPage($modelname,$map=null,$fields="id",$order=null,$join=null,$limitRows=null,
		$ajaxfunc = "querysubmit",$classname=null,$havetabletitle=false,$funcfortableheadertitle="_maketableheaderhtml",$funcfortablelistdata="_generatetabledatahtml") {
		
		if(empty($classname)) $classname = "app\\".request()->module()."\controller\\".request()->controller();
		if(empty($limitRows)) $limitRows = config('PAGE_LISTROWS');
		if(empty($order)) {
            if (empty($this->order)) {
                $ret = checkTableColumnExist($modelname,"createtime");
                if($ret) {
                    $order = 'createtime desc';
                } else {
                     $order = 'id desc';
                }
            }else{
                $order = $this->order;
            }
		}
        if (empty($fields)) {
            if (empty($this->field)) {
                $fields = $this->field;
            }
        }
		$model = db($modelname);
		if(empty($join)) {
			if(empty($map)) {
				$count = $model->count(); //计算记录数
			} else {
				$count = $model->where($map)->count(); //计算记录数
			}
		} else {
			if(empty($map)) {
				$count = $model->join($join)->count(); //计算记录数
			} else {
				$count = $model->where($map)->join($join)->count(); //计算记录数
			}
		}
		$p = new \app\common\Ajaxpage($count,$limitRows,$ajaxfunc); //第三个参数是你需要调用换页的ajax函数名,
		if($havetabletitle !== false) {
       		$html = call_user_func_array(array($classname,$funcfortableheadertitle),array());
       	} else {
       		$html = "";
       	}
       	$limit_value = $p->firstRow."," .$p->listRows;
        if(empty($join)) {
        	if(empty($map)) {
        		$volist = $model->field($fields)->order($order)->limit($limit_value)->select(); // 查询数据
        	} else {
        		$volist = $model->where($map)->field($fields)->order($order)->limit($limit_value)->select(); // 查询数据
        	}
        } else {
        	if(empty($map)) {
        		$volist = $model->join($join)->field($fields)->order($order)->limit($limit_value)->select(); // 查询数据
        	} else {
        		$volist = $model->where($map)->join($join)->field($fields)->order($order)->limit($limit_value)->select(); // 查询数据
        	}
        }
		foreach($volist as $key=>$value) {
			if(!empty($value["id"])) {
                // var_dump($classname);die;
        		$html =  call_user_func_array(array($classname,$funcfortablelistdata),array($html,$value["id"]));
        	} else {
        		$html =  call_user_func_array(array($classname,$funcfortablelistdata),array($html));
        	}
		}
		if($havetabletitle === false) {
			$html = $html.'';
		}
		$page = $p->show(); // 产生分页信息，AJAX的连接在此处生成
		$data["html"] = $html;
        $data["page"] = $page;
        $data["count"] = $count;
        
        return $data;
	}
	
	function _maketableheaderhtml() {
    	$html = "";
        return $html;
    }
    /**
    * 首页生成
    * @author Administrator：chenkeyu 2018年3月22日 下午3:16:37
    * @param  
    * @return 
    */
	function _index($modelname=null,$map=null,$fields="id",$order=null,$join=null,$listname="datalist",$limitRows=null,
		$ajaxfunc = "querysubmit",$classname=null,$havetabletitle=false,$funcfortableheadertitle="_maketableheaderhtml",$funcfortablelistdata="_generatetabledatahtml") {
	    
		if(empty($modelname)) $modelname=$this->modelname;
		if(empty($map)) $this->_filter($map,$querycond);
		
		$data = $this->_listByAjaxPage($modelname,$map,$fields,$order,$join,$limitRows,
			$ajaxfunc,$classname,$havetabletitle,$funcfortableheadertitle,$funcfortablelistdata);
		$varname_page = parameternameforpage();
		$firstopen = getparameter($varname_page);
		if(empty($firstopen)) {
			$this->assign($listname,$data);
        } else {
        	if(!empty($data["html"])) {
        		$this->result($data,1,'','json');
        	} else {
        		$data["html"] = '<tr><td colspan="9" style="text-align:center">没有找到匹配的数据</td></tr>';
        		$data["page"] = "";
        		$data["count"] = "0";
        		$this->result($data,1,'','json');
        	}
        }
	}
	function index(){
	    
	    if (method_exists($this,'_filter')){
	        $this->_filter($map,$querycond);
	    }
	    $this->_index();
	    return $this->fetch(request()->controller().'/index');
	}
    /**
    * 函数用途描述
    * @date: 2017年1月19日 上午10:51:11
    * @author: Administrator：chenkeyu
    * @description: 新增、修改函数
    * @param: variable
    * @return:
    */
    function add(){
        
        if (!empty($this->querybar)){
            foreach ($this->querybar as $key => $value){
                $querybarmap = [];
                $querybarfield = '';
                $querybarorder = '';
                if (!empty($value['map'])){
                    $querybarmap = $value['map'];
                    if (empty($value['map']['status'])){
                        $value['map']['status'] = ['gt','0'];
                    }
                }else{
                    $querybarmap =['status' => ['gt','0']];
                }
                if (empty($value['map']['status'])){
                    $value['map']['status'] = ['gt','0'];
                }
                if (!empty($value['field'])){
                    $querybarfield = $value['field'];
                }else{
                    $querybarfield = 'id,name';
                }
                if (!empty($value['order'])){
                    $querybarorder = $value['order'];
                }else{
                    $querybarorder = 'createtime desc';
                }
                if (strpos($key,'_')){
                    $mlist = explode('_',$key);
                    $model = $mlist[0];
                    $displaylist = $mlist[1];
                }else{
                    $model = $key;
                    $displaylist = $key;
                }
                $querybarlist = $displaylist. 'list';
                $querybarlist = model($model)->field($querybarfield)->where($querybarmap)->order($querybarorder)->select();
                $this->assign($displaylist.'list',$querybarlist);
            }
        }
        return $this->fetch(request()->controller().'/add');
    }
    /**
    * 编辑函数
    * @author Administrator：chenkeyu 2017年9月14日 下午4:02:20
    * @param 
    * @return 
    */
    function edit(){
        
        $id = getparameter('id');
        if (!empty($id)){
            $model = model($this->model);
            $list = $model->relation($this->relation)->where('id',$id)->find();
            $this->assign('list',$list);
        }
        $pagenumber = getparameter('pagenumber');
        if (!empty($pagenumber)){
            $this->assign('pagenumber',$pagenumber);
        }
        if (!empty($this->querybar)){
            foreach ($this->querybar as $key => $value){
                $querybarmap = [];
                $querybarfield = '';
                $querybarorder = '';
                if (!empty($value['map'])){
                    $querybarmap = $value['map'];
                    if (empty($value['map']['status'])){
                        $value['map']['status'] = ['gt','0'];
                    }
                }else{
                    $querybarmap =['status' => ['gt','0']];
                }
                if (empty($value['map']['status'])){
                    $value['map']['status'] = ['gt','0'];
                }
                if (!empty($value['field'])){
                    $querybarfield = $value['field'];
                }else{
                    $querybarfield = 'id,name';
                }
                if (!empty($value['order'])){
                    $querybarorder = $value['order'];
                }else{
                    $querybarorder = 'createtime desc';
                }
                if (strpos($key,'_')){
                    $mlist = explode('_',$key);
                    $model = $mlist[0];
                    $displaylist = $mlist[1];
                }else{
                    $model = $key;
                    $displaylist = $key;
                }
                $querybarlist = $displaylist. 'list';
                $querybarlist = model($model)->field($querybarfield)->where($querybarmap)->order($querybarorder)->select();
                $this->assign($displaylist.'list',$querybarlist);
            }
        }
        return $this->fetch(request()->controller().'/edit');
    }
    /**
    * 详情页面
    * @author Administrator：chenkeyu 2017年9月19日 下午3:22:41
    * @param 
    * @return 
    */
    function detail(){
    
        $id = getparameter('id');
        if (!empty($id)){
            $model = model($this->model);
            $list = $model->relation($this->relation)->where('id',$id)->find();
            $this->assign('list',$list);
        }
        $pagenumber = getparameter('pagenumber');
        if (!empty($pagenumber)){
            $this->assign('pagenumber',$pagenumber);
        }
        if (!empty($this->querybar)){
            foreach ($this->querybar as $key => $value){
                $querybarmap = [];
                $querybarfield = '';
                $querybarorder = '';
                if (!empty($value['map'])){
                    $querybarmap = $value['map'];
                    if (empty($value['map']['status'])){
                        $value['map']['status'] = ['gt','0'];
                    }
                }else{
                    $querybarmap =['status' => ['gt','0']];
                }
                if (empty($value['map']['status'])){
                    $value['map']['status'] = ['gt','0'];
                }
                if (!empty($value['field'])){
                    $querybarfield = $value['field'];
                }else{
                    $querybarfield = 'id,name';
                }
                if (!empty($value['order'])){
                    $querybarorder = $value['order'];
                }else{
                    $querybarorder = 'createtime desc';
                }
                if (strpos($key,'_')){
                    $mlist = explode('_',$key);
                    $model = $mlist[0];
                    $displaylist = $mlist[1];
                }else{
                    $model = $key;
                    $displaylist = $key;
                }
                $querybarlist = $displaylist. 'list';
                $querybarlist = model($model)->field($querybarfield)->where($querybarmap)->order($querybarorder)->select();
                $this->assign($displaylist.'list',$querybarlist);
            }
        }
        return $this->fetch(request()->controller().'/detail');
    }
    /**
     * 编辑详情页面
     * @author Administrator：chenkeyu 2017年9月19日 下午3:22:41
     * @param
     * @return
     */
    function detailedit(){
    
        $id = getparameter('id');
        if (!empty($id)){
            $model = model($this->model);
            $list = $model->relation($this->relation)->where('id',$id)->find();
            $this->assign('list',$list);
        }
        $pagenumber = getparameter('page');
        if (!empty($pagenumber)){
            $this->assign('pagenumber',$pagenumber);
        }
        if (!empty($this->querybar)){
            foreach ($this->querybar as $key => $value){
                $querybarmap = [];
                $querybarfield = '';
                $querybarorder = '';
                if (!empty($value['map'])){
                    $querybarmap = $value['map'];
                    if (empty($value['map']['status'])){
                        $value['map']['status'] = ['gt','0'];
                    }
                }else{
                    $querybarmap =['status' => ['gt','0']];
                }
                if (empty($value['map']['status'])){
                    $value['map']['status'] = ['gt','0'];
                }
                if (!empty($value['field'])){
                    $querybarfield = $value['field'];
                }else{
                    $querybarfield = 'id,name';
                }
                if (!empty($value['order'])){
                    $querybarorder = $value['order'];
                }else{
                    $querybarorder = 'createtime desc';
                }
                if (strpos($key,'_')){
                    $mlist = explode('_',$key);
                    $model = $mlist[0];
                    $displaylist = $mlist[1];
                }else{
                    $model = $key;
                    $displaylist = $key;
                }
                $querybarlist = $displaylist. 'list';
                $querybarlist = model($model)->field($querybarfield)->where($querybarmap)->order($querybarorder)->select();
                $this->assign($displaylist.'list',$querybarlist);
            }
        }
        return $this->fetch(request()->controller().'/detailedit');
    }
    /**
     * 导出Excel
     * @access public
     * @param       array       $list           导出数据
     * @param       string      $filename       文件名称
     * @param       array       $activeSheet    显示列 （A1:H1）
     * @return      file
     */
    public function exportexcel($list,$filename,$activeSheet){
        /*格式实例
            $list = model('user')->where($map)->order('id')->select();
            foreach ($list as $k1 => $v1) {
                $excelSpec[$k1] = [
                    'A' => [
                        'width' => 10,
                        'title' => 'ID',
                        'content' => $v1['id']
                    ],
                    'B' => [
                        'width' => 10,
                        'title' => '用户昵称',
                        'content' => $v1['nickname']
                    ],
                ];
            }
        */
        // 实例化excel类
        include './application/common/Classes/PHPExcel.php';
        $objPHPExcel = new \PHPExcel();
        // 操作第一个工作表
        $objPHPExcel->setActiveSheetIndex(0);
        // 设置sheet名
        $objPHPExcel->getActiveSheet()->setTitle($filename);
        // 列名表头文字加粗
        $objPHPExcel->getActiveSheet()->getStyle($activeSheet)->getFont()->setBold(true);
        // 列表头文字居中
        $objPHPExcel->getActiveSheet()->getStyle($activeSheet)->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        // 数据起始行
        $row_num = 2;
        foreach ($list as $k1 => $v1) {
            foreach ($v1 as $k2 => $v2) {
                // 设置表格宽度
                $objPHPExcel->getActiveSheet()->getColumnDimension($k2)->setWidth($v2['width']);
                // 列名赋值
                $objPHPExcel->getActiveSheet()->setCellValue($k2.'1',$v2['title']);
                // 设置单元格数值
                $objPHPExcel->getActiveSheet()->setCellValue($k2.$row_num,$v2['content']);
            }
            $row_num++;
        }
        $outputFileName = $filename.'.xls';
        $xlsWriter = new \PHPExcel_Writer_Excel5($objPHPExcel);

        header("Content-Type: application/vnd.ms-excel");
        header("Content-Type: application/force-download");
        header("Content-Type: application/octet-stream");
        header("Content-Type: application/download");
        header('Content-Disposition:inline;filename="' . $outputFileName . '"');
        header("Content-Transfer-Encoding: binary");
        header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
        header("Last-Modified: " . gmdate('Y-m-d H:i:s') . " GMT");
        header("Cache-Control: no-cache, must-revalidate");
        header("Pragma: no-cache");
        $xlsWriter->save("php://output");
        exit();
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}