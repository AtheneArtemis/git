<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
/**
* 文件用途描述
* @date: 2017年11月27日 上午9:35:33
* @description:系统公共函数文件
* @author: Administrator：chenkeyu
*/
/**
* 生成主键序列函数
* @author: 2017年11月27日 上午9:36:14-Administrator：chenkeyu
* @param: $GLOBALS
* @return:
*/
function generateprimerykey(){
    $primerykey="";
    $randstring = randomkeys(6);
    $primerykey = $primerykey.$randstring;
    $currtime = time();
    $primerykey = $primerykey.strval($currtime);
    $randstring = randomkeys(6);
    $primerykey = $primerykey.$randstring;
    return $primerykey;
}
/**
 * 函数用途描述
 * @date: 2017年2月28日 上午7:06:24
 * @author: Administrator：chenkeyu
 * @description: //随机数生成函数
 * @param: $GLOBALS
 * @return:
 */
function randomkeys($length){
    $output='';
    for ($a = 0; $a < $length; $a++) {
        $output .= chr(mt_rand(97,122));    //生成php随机数
    }
    return $output;
}
/**
 * 函数用途描述
 * @date: 2017年2月28日 上午7:06:35
 * @author: Administrator：chenkeyu
 * @description: 节点递归
 * @param: $GLOBALS
 * @return:
 */
function node_merge($node,$access = null,$pid = 0){

    $arr = array();
    foreach ($node as $key => $value){
        if(is_array($access)){
            $value['access'] = in_array($value['id'],$access) ? 1:0;
        }
        if(strcmp($value['pid'],$pid) === 0){
            $value['child'] = node_merge($node, $access,$value['id']);
            $arr[] = $value;
        }
    }

    return $arr;
}
/**
 * 获取参数
 * @date: 2017年2月28日 上午7:07:04 chenkeyu
 */
function getparameter($value){

    $data = input($value);
    return $data;
}
/**
 * 回复api请求
 * @date: 2017年2月28日 上午7:07:04 chenkeyu
 */
function apiResponse($apiResData){

	echo json_encode($apiResData);
    exit();
}
//报告运行时错误，警告，语法错误
error_reporting(E_ERROR | E_WARNING | E_PARSE);
//------------ 日志调试输出 ------//
function _writelogfile($msg){

    $filename = "./log/debug_".date("Ymd").".log";
    $handle = fopen($filename, "a+");
    if (!$handle) {
        dump("can't open file ".$filename."\n");
        return false;
    }
    $logmsg = "[".date("Y-m-d H:i:s")."] ".$msg."\n";
    $ret = fwrite($handle,$logmsg);
    if(empty($ret)) {
        dump("Write file failed\n");
        return false;
    }
    fclose($handle);
}
// 用户友好的变量输出
function fdbg($var, $echo=true,$label=null, $strict=true){
    $label = ($label===null) ? '' : rtrim($label) . ' ';
    if(!$strict) {
        if (ini_get('html_errors')) {
            $output = print_r($var, true);
            $output = $label.htmlspecialchars($output,ENT_QUOTES);
        } else {
            $output = $label . print_r($var, true);
        }
    }else {
        ob_start();
        print_r($var);
        $output = ob_get_clean();
        if(!extension_loaded('xdebug')) {
            $output = preg_replace('/\]\=\>\n(\s+)/m', '] => ', $output);
        }
    }
    if ($echo) {
        _writelogfile($output);
        return null;
    } else {
        return $output;
    }
}
/**
 * 自动转换字符集 支持数组转换
 * @author Administrator：chenkeyu 2017年9月19日 上午9:25:08
 * @param string/array $fContents 需要转换的字符或数组
 * @param string $from 来源编码
 * @param string $to 转换编码
 * @return
 */
function auto_charset($fContents,$from='gbk',$to='utf-8'){
    $from   =  strtoupper($from)=='UTF8'? 'utf-8':$from;
    $to       =  strtoupper($to)=='UTF8'? 'utf-8':$to;
    if( strtoupper($from) === strtoupper($to) || empty($fContents) || (is_scalar($fContents) && !is_string($fContents)) ){
        //如果编码相同或者非字符串标量则不转换
        return $fContents;
    }
    if(is_string($fContents) ) {
        if(function_exists('mb_convert_encoding')){
            return mb_convert_encoding ($fContents, $to, $from);
        }elseif(function_exists('iconv')){
            return iconv($from,$to,$fContents);
        }else{
            return $fContents;
        }
    }
    elseif(is_array($fContents)){
        foreach ( $fContents as $key => $val ) {
            $_key =     auto_charset($key,$from,$to);
            $fContents[$_key] = auto_charset($val,$from,$to);
            if($key != $_key )
                unset($fContents[$key]);
        }
        return $fContents;
    }
    else{
        return $fContents;
    }
}

// json_decode后返回的stdarray转成普通array
// 仅包含utf8字符
function object2array(&$object) {
    $object = json_decode(json_encode($object),true);
    return $object;
}

function json2array($jsonstring) {
    $infoarray = object2array(json_decode($retjsonstring));
    return $infoarray;
}

/**
 * 发送HTTP请求方法
 * @param  string $url    请求URL
 * @param  array  $params 请求参数
 * @param  string $method 请求方法GET/POST
 * @return array  $data   响应数据
 */
function _http($url,$params=[],$method = 'GET', $multi = false){
	$opts = array(
		CURLOPT_TIMEOUT        => 30,
		CURLOPT_RETURNTRANSFER => 1,
		CURLOPT_SSL_VERIFYPEER => false,
		CURLOPT_SSL_VERIFYHOST => false
	);
	$url = str_replace(' ','+',$url);
	/* 根据请求类型设置特定参数 */
	switch(strtoupper($method)){
		case 'GET':
			// $opts[CURLOPT_URL] = $url . '?' . http_build_query($params);
			$opts[CURLOPT_URL] = $url;
			break;
		case 'POST':
			//判断是否传输文件
			$params = $multi ? $params : http_build_query($params);
			$opts[CURLOPT_URL] = $url;
			$opts[CURLOPT_POST] = 1;
			$opts[CURLOPT_POSTFIELDS] = $params;
			break;
		default:
			throw new Exception('不支持的请求方式！');
	}
	/* 初始化并执行curl请求 */
	$ch = curl_init();
	curl_setopt_array($ch, $opts);
 	//$header = array("Content-type: text/html; charset=utf-8");
 	//if(empty($header)) $header = 0;
 	// curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
 	$data  = curl_exec($ch);
 	$error = curl_error($ch);
 	curl_close($ch);
 	if($error) {
 		return false;
 		//throw new Exception('请求发生错误：' . $error);
 	}
 	return  $data;
}
/**
 * 发送HTTP请求方法 -- 针对微信
 * @param  string $url    请求URL
 * @param  array  $params 请求参数
 * @param  string $method 请求方法GET/POST
 * @return array  $data   响应数据
 */
function _http_wechat_pay($url,$params=[],$method = 'GET', $multi = false){
    $opts = array(
        CURLOPT_TIMEOUT        => 30,
        CURLOPT_RETURNTRANSFER => 1,
        CURLOPT_SSL_VERIFYPEER => false,
        CURLOPT_SSL_VERIFYHOST => false
    );
    $url = str_replace(' ','+',$url);
    /* 根据请求类型设置特定参数 */
    switch(strtoupper($method)){
        case 'GET':
            // $opts[CURLOPT_URL] = $url . '?' . http_build_query($params);
            $opts[CURLOPT_URL] = $url;
            break;
        case 'POST':
            //判断是否传输文件
            // $params = $multi ? $params : http_build_query($params);
            $opts[CURLOPT_URL] = $url;
            $opts[CURLOPT_POST] = 1;
            $opts[CURLOPT_POSTFIELDS] = $params;
            break;
        default:
            throw new Exception('不支持的请求方式！');
    }
    /* 初始化并执行curl请求 */
    $ch = curl_init();
    curl_setopt_array($ch, $opts);
    $data  = curl_exec($ch);
    $error = curl_error($ch);
    curl_close($ch);
    if($error) {
        return false;
    }
    return  $data;
}
function array2xml($arr, $level = 1) {
    $s = $level == 1 ? "<xml>" : '';
    foreach ($arr as $tagname => $value) {
        if (is_numeric($tagname)) {
            $tagname = $value['TagName'];
            unset($value['TagName']);
        }
        if (!is_array($value)) {
            $s .= "<{$tagname}>" . (!is_numeric($value) ? '<![CDATA[' : '') . $value . (!is_numeric($value) ? ']]>' : '') . "</{$tagname}>";
        } else {
            $s .= "<{$tagname}>" . array2xml($value, $level + 1) . "</{$tagname}>";
        }
    }
    $s = preg_replace("/([\x01-\x08\x0b-\x0c\x0e-\x1f])+/", ' ', $s);
    return $level == 1 ? $s . "</xml>" : $s;
}
function xml2array($xml) {
    if (empty($xml)) {
        return array();
    }
    $result = array();
    $xmlobj = isimplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA);
    if($xmlobj instanceof SimpleXMLElement) {
        $result = json_decode(json_encode($xmlobj), true);
        if (is_array($result)) {
            return $result;
        } else {
            return '';
        }
    } else {
        return $result;
    }
}
function isimplexml_load_string($string, $class_name = 'SimpleXMLElement', $options = 0, $ns = '', $is_prefix = false) {
    libxml_disable_entity_loader(true);
    if (preg_match('/(\<\!DOCTYPE|\<\!ENTITY)/i', $string)) {
        return false;
    }
    return simplexml_load_string($string, $class_name, $options, $ns, $is_prefix);
}
function gettablecolumnvaluebyid($tablename,$column,$id,$version=null){
	if(empty($version)) { //从当前表中获取数据
    	$list = db($tablename)->where('id',$id)->field($column)->find();
    	$value = $list[$column];
    } else { //从历史表中获取数据
    	$historytable = $tablename."his";
    	if(!checkTableExist($historytable)) { //历史表不存在，则从当前表中获取
    		$list = db($tablename)->where('id',$id)->field($column)->find();
    		$value = $list[$column];
    	} else { //历史表存在，则从历史表中获取
    		$list = db($historytable)->where($tablename.'_id',$id)->where("version",$version)->field($column)->find();
    		$value = $list[$column];
    	}
    }
    if(empty($value)) $value = "";
    return $value;
}

function gettablevaluesbycolumn($tablename,$columnname,$columnvalue,$targetcolumnname="id",$withlike=true,$version=null) {
	$targetvalues = array();
	$map["status"] = array("gt","0");
	if($withlike) $map[$columnname] = array("like","%".$columnvalue."%");
	else $map[$columnname] = array("eq",$columnvalue);
	$data = db($tablename)->where($map)->field($targetcolumnname)->select();
	foreach ($data as $key => $value){
		$targetvalues[$key] = $value[$targetcolumnname];
	}
	return $targetvalues;
}
//根据”_id“获取字段的中文值
function convertvalueforspeccolumn($column,$columnvalue) {
	//1.如果该字段为外键，进行处理
	$substr_tmp = substr($column,strlen($column)-strlen("_id"),strlen("_id"));
	if(strcmp($substr_tmp,"_id") === 0) {  //该字段为外键
		$basestr = substr($column,0,strlen($column)-strlen("_id"));
		//先从枚举表中查找
		$value = getenumname($basestr,$columnvalue);
		if(empty($value)) {  //枚举表中没有，则看是不是实体表
			if(checkTableColumnExist($basestr,"name")) {
				$value = gettablecolumnvaluebyid($basestr,"name",$columnvalue);
			} else if(checkTableColumnExist($basestr,"title")) {
				$value = gettablecolumnvaluebyid($basestr,"title",$columnvalue);
			}
		}
	}
	//2.如果该字段为时间货日期，进行处理
	if(strstr($column,"time")) $value = date('Y-m-d H:i:s',$columnvalue);
	if(strstr($column,"date")) $value = date('Y-m-d',$columnvalue);
	//其他的还有的为处理的特殊字段由：distributor_id,payway_id
	
	
	//如果以上都不是，则返回原值
	if(empty($value)) $value = $columnvalue;
	return $value;
}
function defaultloginpassword() {
	$passwd = config("USER_DEFAULT_PASSWORD");
	$passwd = md5($passwd);
	return $passwd;
}
function get_client_ip() {
    if (getenv ( "HTTP_CLIENT_IP" ) && strcasecmp ( getenv ( "HTTP_CLIENT_IP" ), "unknown" ))
        $ip = getenv ( "HTTP_CLIENT_IP" );
    else if (getenv ( "HTTP_X_FORWARDED_FOR" ) && strcasecmp ( getenv ( "HTTP_X_FORWARDED_FOR" ), "unknown" ))
        $ip = getenv ( "HTTP_X_FORWARDED_FOR" );
    else if (getenv ( "REMOTE_ADDR" ) && strcasecmp ( getenv ( "REMOTE_ADDR" ), "unknown" ))
        $ip = getenv ( "REMOTE_ADDR" );
    else if (isset ( $_SERVER ['REMOTE_ADDR'] ) && $_SERVER ['REMOTE_ADDR'] && strcasecmp ( $_SERVER ['REMOTE_ADDR'], "unknown" ))
        $ip = $_SERVER ['REMOTE_ADDR'];
    else
        $ip = "unknown";
    return ($ip);   
}
//返回当前的毫秒时间戳
function getmsectime() {
    list($msec, $sec) = explode(' ', microtime());
    $msectime = (float)sprintf('%.0f', (floatval($msec) + floatval($sec)) * 1000);
    return $msectime;
}
