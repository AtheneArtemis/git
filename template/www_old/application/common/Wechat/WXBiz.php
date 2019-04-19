<?php
/**
 *  微信第三方开发
 */


class WXBiz{

	const API_URL_PREFIX 			= 'https://api.weixin.qq.com/cgi-bin';
	const MP_URL_PREFIX 			= 'https://mp.weixin.qq.com/cgi-bin';
	
    // 第三方开发
    const COMPONENT_API_TOKEN 		= '/component/api_component_token?';
    const COMPONENT_API_PRE_CODE	= '/component/api_create_preauthcode?';
    const COMPONENT_API_AUTH 		= '/component/api_query_auth?';
    const COMPONENT_API_AUTH_TOKEN 	= '/component/api_authorizer_token?';
    const COMPONENT_API_AUTH_INFO	= '/component/api_get_authorizer_info?';
    const COMPONENT_API_AUTH_OPTION	= '/component/api_get_authorizer_option?';
    const COMPONENT_GRANT_URL		= '/componentloginpage?';


    const MSGTYPE_TEXT = 'text';
	
    
    private $token;
    private $encodingAesKey;
    private $appid;
    private $appsecret;
    private $access_token;
    private $verify_ticket;
    private $pre_auth_code;
    private $logcallback;
    private $_receive;
    private $postxml;
    private $authorizer_appid;
    private $authorizer_access_token;
    private $jsapi_ticket;

    public $debug =  true;
    private $_funcflag = false;
    private $_text_filter = true;

    public function __construct($options){
		$this->token 			= isset($options['token'])?$options['token']:'';
		$this->encodingAesKey 	= isset($options['encodingAesKey'])?$options['encodingAesKey']:'';
		$this->appid 			= isset($options['appid'])?$options['appid']:'';
		$this->appsecret 		= isset($options['appsecret'])?$options['appsecret']:'';
		$this->debug 			= isset($options['debug'])?$options['debug']:false;
		$this->logcallback 		= isset($options['logcallback'])?$options['logcallback']:false;
	}

	/**
	 * 微信验证，POST内容解密
	 */
	public function valid(){
		if ($_SERVER['REQUEST_METHOD'] == "POST" || true) {
            $postStr = file_get_contents("php://input");
			// $postStr = '<xml><ToUserName><![CDATA[gh_3c884a361561]]></ToUserName><Encrypt><![CDATA[NZc2CSDFHJ7fVvGDGAXnhzjFTgRv8qGA8IC8CCtaKbfVDySwIKLERZfEcHCdTC9KQJ8YaD8t6pRFmaIQXv4mUzjVnRDwT/6YzeJiJlSwURU477hpbhVI3pTs6MVaHr6UbZIhzJUnwCFtKDHahPy+vVhgazugAV308SHngqIFKBK1HqSOqKTRdRMdRMnBHtG0yEZ48weYlMI9TfZpyBG6t8l69V482vaoa1xL9+C5kCzC93lXq84hBfcJ5wMz/vgD7qUiu7g5/Ppq+NajSD44s9Z/T58TLVP0o0JpeJtxxGEuy72krc7OQO6XV034egAdzgMOBLUFDQrkgBJkEVAQ9QNUNcR/WuUG8O3TlGSfmBp3mgcjIUPpdn7G63q73A1FrFi74DUjmBoEN8O99cu4fN+gmPenBYFhvDFpvOTXViFncghbTuQYSxJT2magvvhRwKHAVkXDdKFrRRNSkj1ehhH/t4EWACw4dl3DZREt46j7/ehVqDnoMTScYW4/hfMnMaxHkL4aIB9StLygx9wbYrxqka/0UuuRnLou/+o+A4bBjrtvYjg+qjNdSngxThOKkInH/XKntkkaNTZD1AI//g==]]></Encrypt></xml>';

			$array = (array)simplexml_load_string($postStr, 'SimpleXMLElement', LIBXML_NOCDATA);
            $this->encrypt_type = isset($_GET["encrypt_type"]) ? $_GET["encrypt_type"]: '';
            if ($this->encrypt_type == 'aes') { //aes加密
                $this->log($postStr);
            	$encryptStr = $array['Encrypt'];
            	$pc = new Prpcrypt($this->encodingAesKey);
            	$array = $pc->decrypt($encryptStr,$this->appid);
            	if (!isset($array[0]) || ($array[0] != 0)) {
            	    //die('decrypt error!');
            	    throw new Exception("Message Decrypt error!", 1);
            	}
            	$this->postxml = $array[1];
            } else {
                $this->postxml = $postStr;
            }
            if (!$this->checkSignature($encryptStr)) {
        		//die('signature error!');
        		throw new Exception("Signature error", 2);
        	}
        	return true;
        }
    }

	/**
	 * 签名验证
	 */
	private function checkSignature($encrypt){
		$msg_signature 	= isset($_GET["msg_signature"])?$_GET["msg_signature"]:'';
	    $timestamp 		= isset($_GET["timestamp"])?$_GET["timestamp"]:'';
	    $nonce 			= isset($_GET["nonce"])?$_GET["nonce"]:'';
	    //验证安全签名
		$sha1 = new SHA1;
		$array = $sha1->getSHA1($this->token, $timestamp, $nonce, $encrypt);
		$ret = $array[0];
		if ($ret != 0) {
			return $ret;
		}
		$signature = $array[1];
		if ($signature != $msg_signature) {
			return false;
		}
		return true;
	}    

    /**
     * 更新并缓存第三方调用verify ticket
     *
     * 此接口在授权事件接收时调用
     * @return bool
     */
    public function checkTicket(){
    	$CACHE_KEY = 'WXBIZ_VERIFY_TICKET_'.$this->appid;
    	if($this->valid()){
            $data = $this->getRev()->getRevData();
            if($data && $data['ComponentVerifyTicket']){
            	$this->verify_ticket = $data['ComponentVerifyTicket'];
            	$this->setCache($CACHE_KEY, $data['ComponentVerifyTicket'], 3600);
            }
            return $data;
        }
        return false;
    }

    /**
	 * 获取第三方平台component_access_token
	 */
	public function checkAuth(){
		$authname = 'WXBIZ_ACCESS_TOKEN_'.$this->appid;
		if ($rs = $this->getCache($authname))  {
			$this->access_token = $rs;
			return $rs;
		}
        
		// 根据
		$verify_ticket = $this->getCache('WXBIZ_VERIFY_TICKET_'.$this->appid);
		if(!$verify_ticket){
			//die('compontent access ticket not found!');
			throw new Exception("Compontent access ticket not found!", 3);
		}
		$url = self::API_URL_PREFIX.self::COMPONENT_API_TOKEN;
		$params = array('component_appid'=> $this->appid, 'component_appsecret'=>$this->appsecret, 'component_verify_ticket'=>$verify_ticket);
		$result = $this->http_post($url, self::json_encode($params));
		if ($result){
			$json = json_decode($result, true);
			if (!$json || isset($json['errcode'])) {
				$this->errCode = $json['errcode'];
				$this->errMsg = $json['errmsg'];
				return false;
			}
			$this->access_token = $json['component_access_token'];
			$expire = $json['expires_in'] ? intval($json['expires_in'])-600 : 3600;
			$this->setCache($authname, $this->access_token, $expire);
			return $this->access_token;
		}
		return false;
	}

	/**
	 * 获取预授权码
	 *
	 * 此接口在公众号运营者准备授权第三方时调用
	 * @return [type] [description]
	 */
	public function getPreAuthCode(){
	    
		if (!$this->access_token && !$this->checkAuth()) return false;

		// $authcode = 'WXBIZ_PRE_AUTHCODE_'.$this->appid;
		// if ($rs = $this->getCache($authcode))  {
		// 	$this->pre_auth_code = $rs;
		// 	return $rs;
		// }

		$url = self::API_URL_PREFIX.self::COMPONENT_API_PRE_CODE.'component_access_token='.$this->access_token;
		$params = array('component_appid'=>$this->appid);
		$result = $this->http_post($url, self::json_encode($params));
		if ($result){
			$json = json_decode($result, true);
			if (!$json || isset($json['errcode'])) {
				$this->errCode = $json['errcode'];
				$this->errMsg = $json['errmsg'];
				return false;
			}
			// $this->pre_auth_code = $json['pre_auth_code'];
			// $expire = $json['expires_in'] ? intval($json['expires_in'])-200 : 1000;
			// $this->setCache($authcode, $this->pre_auth_code, $expire);
			// return $this->pre_auth_code;
			
			return $json['pre_auth_code'];
		}
		return false;
	}

	/**
	 * 获取公众号授权页面地址
	 *
	 * 此接口在公众号运营者准备授权第三方时调用，引导用户前往此URL进行授权
	 * @param  string $redirect_uri 微信授权URL
	 * @return
	 */
	public function getGrantUrl($redirect_uri=''){
		if($pre_auth_code = $this->getPreAuthCode()){
			return self::MP_URL_PREFIX.self::COMPONENT_GRANT_URL."component_appid={$this->appid}&pre_auth_code={$pre_auth_code}&redirect_uri={$redirect_uri}";
		}
		return false;
	}

	/**
	 * 使用授权码换取公众号的接口调用凭据和授权信息
	 *
	 * 此接口在运营者在微信授权成功后，检查并获得授权码
	 * @return [type] [description]
	 */
	public function getAuthorization($auth_code=''){
		if (!$this->access_token && !$this->checkAuth()) return false;
		$url = self::API_URL_PREFIX.self::COMPONENT_API_AUTH.'component_access_token='.$this->access_token;
		$params = array('component_appid'=>$this->appid, 'authorization_code'=>$auth_code);

		$result = $this->http_post($url, self::json_encode($params));
		$this->log($result);

		if ($result){
			$json = json_decode($result, true);
			if (!$json || isset($json['errcode'])) {
				$this->errCode = $json['errcode'];
				$this->errMsg = $json['errmsg'];
				return false;
			}
			$this->authorizer_appid = $json['authorization_info']['authorizer_appid'];
			$this->authorizer_access_token = $json['authorization_info']['authorizer_access_token'];
			$expires_in = $json['authorization_info']['expires_in'];

			$this->setCache('WXBIZ_AUTH_ACCESS_TOKEN_'.$this->authorizer_appid, $this->authorizer_access_token, $expires_in);
			return $json['authorization_info'];
		}
		return false;
	}

	/**
	 * 根据已授权微信公众号APP ID，获取公众号基本信息
	 *
	 * 此接口在需要获取已授权公众号信息时调用
	 * @param  string $authorizer_appid 已授权公众号APP ID
	 * @return array                   	公众号授权信息
	 */
	public function getAuthorizerInfo($authorizer_appid=''){
		if (!$this->access_token && !$this->checkAuth()) return false;
		
		$url = self::API_URL_PREFIX.self::COMPONENT_API_AUTH_INFO.'component_access_token='.$this->access_token;
		$params = array('component_appid'=>$this->appid, 'authorizer_appid'=>$authorizer_appid);
		$result = $this->http_post($url, self::json_encode($params));
		if ($result){
			$json = json_decode($result, true);
			if (!$json || isset($json['errcode'])) {
				$this->errCode = $json['errcode'];
				$this->errMsg = $json['errmsg'];
				return false;
			}
			return $json;
		}
	}

	/**
	 * 获取授权方选项设置信息
	 * @param  string $option_name 选项,location_report:地理位置上报,voice_recognize:语音识别开关,customer_service:多客服开关
	 * @return             
	 */
	public function getAuthorizerOption($authorizer_appid='', $option_name=''){
		if (!$this->access_token && !$this->checkAuth()) return false;
		
		$url = self::API_URL_PREFIX.self::COMPONENT_API_AUTH_OPTION.'component_access_token='.$this->access_token;
		$params = array('component_appid'=>$this->appid, 'authorizer_appid'=>$authorizer_appid, 'option_name'=>$option_name);
		$result = $this->http_post($url, self::json_encode($params));

		if ($result){
			$json = json_decode($result, true);
			if (!$json || isset($json['errcode'])) {
				$this->errCode = $json['errcode'];
				$this->errMsg = $json['errmsg'];
				return false;
			}
			return $json;
		}
		return false;
	}

    /***20180508 CK start***/
	/**
	 * 刷新公众号JS SDK的jsapi_ticket
	 * @param  string $access_token          授权公众号access_token
	 * @return string                        授权公众号接口调用 jsapi_ticket
	 */
	public function getAuthorizerJsapiTicket($access_token,$authorizer_appid){
	    if (!$this->jsapi_ticket && !$this->checkAuth()) return false;
	     
	    $authname = 'WXBIZ_JSAPI_TICKET_'.$authorizer_appid;
	    if ($rs = $this->getCache($authname))  {
	        $this->jsapi_ticket = $rs;
	        return $rs;
	    }
	    //self::COMPONENT_API_AUTH_TOKEN.'component_access_token='.$this->access_token
	   ///ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi
	    $url = self::API_URL_PREFIX.'/ticket/getticket?access_token='.$access_token.'&type=jsapi';
	    //$params = array('component_appid'=>$this->appid, 'authorizer_appid'=>$authorizer_appid, 'authorizer_refresh_token'=>$authorizer_refresh_token);
	    $result = $this->http_get($url);
	    if ($result){
	        $json = json_decode($result, true);
	        if (!$json || strcmp($json['errcode'], '0') !==0) {
	            $this->errCode = $json['errcode'];
	            $this->errMsg = $json['errmsg'];
	            return false;
	        }
	        $this->jsapi_ticket = $json['ticket'];
	        $expire = $json['expires_in'] ? intval($json['expires_in'])-600 : 3600;
	        $this->setCache($authname,$this->jsapi_ticket,$expire);
	        return $json['ticket'];
	    }
	    return false;
	}
	/***20180508 CK end***/
	/**
	 * 刷新公众号授权接口调用access token
	 * @param  string $authorizer_appid          授权公众号appid
	 * @param  string $authorizer_refresh_token  授权公众号refesh token
	 * @return string                            授权公众号接口调用 access_token
	 */
	public function getAuthorizerAccessToken($authorizer_appid='', $authorizer_refresh_token=''){
	    if (!$this->access_token && !$this->checkAuth()) return false;
	    
		$authname = 'WXBIZ_AUTH_ACCESS_TOKEN_'.$authorizer_appid;
		if ($rs = $this->getCache($authname))  {
            $this->authorizer_access_token = $rs;
            return $rs;
        }
		
		$url = self::API_URL_PREFIX.self::COMPONENT_API_AUTH_TOKEN.'component_access_token='.$this->access_token;
		$params = array('component_appid'=>$this->appid, 'authorizer_appid'=>$authorizer_appid, 'authorizer_refresh_token'=>$authorizer_refresh_token);
		$result = $this->http_post($url, self::json_encode($params));
		if ($result){
			$json = json_decode($result, true);
			if (!$json || isset($json['errcode'])) {
				$this->errCode = $json['errcode'];
				$this->errMsg = $json['errmsg'];
				return false;
			}
			$this->authorizer_access_token = $json['authorizer_access_token'];
            $expire = $json['expires_in'] ? intval($json['expires_in'])-600 : 3600;
            $this->setCache($authname,$this->authorizer_access_token,$expire);
			return $json['authorizer_access_token'];
		}
		return false;
	}

	/**
	 * 设置回复消息
	 * Example: $obj->text('hello')->reply();
	 * @param string $text
	 */
	public function text($text='')
	{
		$FuncFlag = $this->_funcflag ? 1 : 0;
		$msg = array(
			'ToUserName' => $this->getRevFrom(),
			'FromUserName'=>$this->getRevTo(),
			'MsgType'=>self::MSGTYPE_TEXT,
			'Content'=>$this->_auto_text_filter($text),
			'CreateTime'=>time(),
			'FuncFlag'=>$FuncFlag
		);
		$this->Message($msg);
		return $this;
	}

	/**
	 *
	 * 回复微信服务器, 此函数支持链式操作
	 * Example: $this->text('msg tips')->reply();
	 * @param string $msg 要发送的信息, 默认取$this->_msg
	 * @param bool $return 是否返回信息而不抛出到浏览器 默认:否
	 */
	public function reply($msg=array(),$return = false)
	{
		if (empty($msg)) {
		    if (empty($this->_msg))   //防止不先设置回复内容，直接调用reply方法导致异常
		        return false;
			$msg = $this->_msg;
		}
		$xmldata=  $this->xml_encode($msg);
		/* fdbg('回复微信服务器');
		fdbg($xmldata); */
		$this->log($xmldata);
		if ($this->encrypt_type == 'aes') { //如果来源消息为加密方式
		    $pc = new Prpcrypt($this->encodingAesKey);
		    $array = $pc->encrypt($xmldata, $this->appid);
		    $ret = $array[0];
		    if ($ret != 0) {
		        $this->log('encrypt err!');
		        return false;
		    }
		    $timestamp = time();
		    $nonce = rand(77,999)*rand(605,888)*rand(11,99);
		    $encrypt = $array[1];
		    $tmpArr = array($this->token, $timestamp, $nonce,$encrypt);//比普通公众平台多了一个加密的密文
		    sort($tmpArr, SORT_STRING);
		    $signature = implode($tmpArr);
		    $signature = sha1($signature);
		    $xmldata = $this->generate($encrypt, $signature, $timestamp, $nonce);
		    $this->log($xmldata);
		}
		/* fdbg('aes');
		fdbg($return);
		fdbg($xmldata); */
		if ($return)
			return $xmldata;
		else
			echo $xmldata;
	}

	/**
	 * 设置发送消息
	 * @param array $msg 消息数组
	 * @param bool $append 是否在原消息数组追加
	 */
    public function Message($msg = '',$append = false){
    		if (is_null($msg)) {
    			$this->_msg =array();
    		}elseif (is_array($msg)) {
    			if ($append)
    				$this->_msg = array_merge($this->_msg,$msg);
    			else
    				$this->_msg = $msg;
    			return $this->_msg;
    		} else {
    			return $this->_msg;
    		}
    }

    /**
     * xml格式加密，仅请求为加密方式时再用
     */
	private function generate($encrypt, $signature, $timestamp, $nonce){
	    //格式化加密信息
	    $format = "<xml>
<Encrypt><![CDATA[%s]]></Encrypt>
<MsgSignature><![CDATA[%s]]></MsgSignature>
<TimeStamp>%s</TimeStamp>
<Nonce><![CDATA[%s]]></Nonce>
</xml>";
	    return sprintf($format, $encrypt, $signature, $timestamp, $nonce);
	}

    /**
     * 获取微信服务器发来的信息
     */
	public function getRev(){
		if ($this->_receive) return $this;
		$postStr = !empty($this->postxml)?$this->postxml:file_get_contents("php://input");
		//兼顾使用明文又不想调用valid()方法的情况
		$this->log($postStr);
		if (!empty($postStr)) {
			$this->_receive = (array)simplexml_load_string($postStr, 'SimpleXMLElement', LIBXML_NOCDATA);
		}
		return $this;
	}

	/**
	 * 获取微信服务器发来的信息
	 */
	public function getRevData(){
		return $this->_receive;
	}

	/**
	 * 获取微信服务器发来的原始加密信息
	 */
	public function getRevPostXml(){
	    return $this->postxml;
	}

	/**
	 * 获取消息发送者
	 */
	public function getRevFrom() {
		if (isset($this->_receive['FromUserName']))
			return $this->_receive['FromUserName'];
		else
			return false;
	}
	/**
	 * 获取消息接受者
	 */
	public function getRevTo() {
		if (isset($this->_receive['ToUserName']))
			return $this->_receive['ToUserName'];
		else
			return false;
	}

   	/**
	 * 设置缓存，按需重载
	 * @param string $cachename
	 * @param mixed $value
	 * @param int $expired
	 * @return boolean
	 */
	protected function setCache($cachename,$value,$expired){
		//TODO: set cache implementation
		return false;
	}

	/**
	 * 获取缓存，按需重载
	 * @param string $cachename
	 * @return mixed
	 */
	protected function getCache($cachename){
		//TODO: get cache implementation
		return false;
	}

	/**
	 * 清除缓存，按需重载
	 * @param string $cachename
	 * @return boolean
	 */
	protected function removeCache($cachename){
		//TODO: remove cache implementation
		return false;
	}

	/**
	 * 日志记录
	 */
	protected function log($log){
	    if ($this->debug && function_exists($this->logcallback)) {
	        if (is_array($log)) $log = print_r($log,true);
	        return call_user_func($this->logcallback,$log);
	    }
	}

	/**
	 * GET 请求
	 * @param string $url
	 */
	private function http_get($url){
	    $oCurl = curl_init();
	    if(stripos($url,"https://")!==FALSE){
	        curl_setopt($oCurl, CURLOPT_SSL_VERIFYPEER, FALSE);
	        curl_setopt($oCurl, CURLOPT_SSL_VERIFYHOST, FALSE);
	        curl_setopt($oCurl, CURLOPT_SSLVERSION, 1); //CURL_SSLVERSION_TLSv1
	    }
	    curl_setopt($oCurl, CURLOPT_URL, $url);
	    curl_setopt($oCurl, CURLOPT_RETURNTRANSFER, 1 );
	    $sContent = curl_exec($oCurl);
	    $aStatus = curl_getinfo($oCurl);
	    curl_close($oCurl);
	    if(intval($aStatus["http_code"])==200){
	        return $sContent;
	    }else{
	        return false;
	    }
	}

	/**
	 * POST 请求
	 * @param string $url
	 * @param array $param
	 * @param boolean $post_file 是否文件上传
	 * @return string content
	 */
	private function http_post($url,$param,$post_file=false){
		$oCurl = curl_init();
		if(stripos($url,"https://")!==FALSE){
			curl_setopt($oCurl, CURLOPT_SSL_VERIFYPEER, FALSE);
			curl_setopt($oCurl, CURLOPT_SSL_VERIFYHOST, false);
			curl_setopt($oCurl, CURLOPT_SSLVERSION, 1); //CURL_SSLVERSION_TLSv1
		}
		if (is_string($param) || $post_file) {
			$strPOST = $param;
		} else {
			$aPOST = array();
			foreach($param as $key=>$val){
				$aPOST[] = $key."=".urlencode($val);
			}
			$strPOST =  join("&", $aPOST);
		}
		curl_setopt($oCurl, CURLOPT_URL, $url);
		curl_setopt($oCurl, CURLOPT_RETURNTRANSFER, 1 );
		curl_setopt($oCurl, CURLOPT_POST,true);
		if(PHP_VERSION_ID >= 50500){
			curl_setopt($oCurl, CURLOPT_SAFE_UPLOAD, FALSE);
		}
		curl_setopt($oCurl, CURLOPT_POSTFIELDS,$strPOST);
		$sContent = curl_exec($oCurl);
		$aStatus = curl_getinfo($oCurl);
		curl_close($oCurl);
		if(intval($aStatus["http_code"])==200){
			return $sContent;
		}else{
			return false;
		}
	}

	/**
	 * 微信api不支持中文转义的json结构
	 * @param array $arr
	 */
	static function json_encode($arr) {
		if (count($arr) == 0) return "[]";
		$parts = array ();
		$is_list = false;
		//Find out if the given array is a numerical array
		$keys = array_keys ( $arr );
		$max_length = count ( $arr ) - 1;
		if (($keys [0] === 0) && ($keys [$max_length] === $max_length )) { //See if the first key is 0 and last key is length - 1
			$is_list = true;
			for($i = 0; $i < count ( $keys ); $i ++) { //See if each key correspondes to its position
				if ($i != $keys [$i]) { //A key fails at position check.
					$is_list = false; //It is an associative array.
					break;
				}
			}
		}
		foreach ( $arr as $key => $value ) {
			if (is_array ( $value )) { //Custom handling for arrays
				if ($is_list)
					$parts [] = self::json_encode ( $value ); /* :RECURSION: */
				else
					$parts [] = '"' . $key . '":' . self::json_encode ( $value ); /* :RECURSION: */
			} else {
				$str = '';
				if (! $is_list)
					$str = '"' . $key . '":';
				//Custom handling for multiple data types
				if (!is_string ( $value ) && is_numeric ( $value ) && $value<2000000000)
					$str .= $value; //Numbers
				elseif ($value === false)
				$str .= 'false'; //The booleans
				elseif ($value === true)
				$str .= 'true';
				else
					$str .= '"' . addslashes ( $value ) . '"'; //All other things
				// :TODO: Is there any more datatype we should be in the lookout for? (Object?)
				$parts [] = $str;
			}
		}
		$json = implode ( ',', $parts );
		if ($is_list)
			return '[' . $json . ']'; //Return numerical JSON
		return '{' . $json . '}'; //Return associative JSON
	}


	/**
	 * XML编码
	 * @param mixed $data 数据
	 * @param string $root 根节点名
	 * @param string $item 数字索引的子节点名
	 * @param string $attr 根节点属性
	 * @param string $id   数字索引子节点key转换的属性名
	 * @param string $encoding 数据编码
	 * @return string
	*/
	public function xml_encode($data, $root='xml', $item='item', $attr='', $id='id', $encoding='utf-8') {
	    if(is_array($attr)){
	        $_attr = array();
	        foreach ($attr as $key => $value) {
	            $_attr[] = "{$key}=\"{$value}\"";
	        }
	        $attr = implode(' ', $_attr);
	    }
	    $attr   = trim($attr);
	    $attr   = empty($attr) ? '' : " {$attr}";
	    $xml   = "<{$root}{$attr}>";
	    $xml   .= self::data_to_xml($data, $item, $id);
	    $xml   .= "</{$root}>";
	    return $xml;
	}

	/**
	 * 数据XML编码
	 * @param mixed $data 数据
	 * @return string
	 */
	public static function data_to_xml($data) {
	    $xml = '';
	    foreach ($data as $key => $val) {
	        is_numeric($key) && $key = "item id=\"$key\"";
	        $xml    .=  "<$key>";
	        $xml    .=  ( is_array($val) || is_object($val)) ? self::data_to_xml($val)  : self::xmlSafeStr($val);
	        list($key, ) = explode(' ', $key);
	        $xml    .=  "</$key>";
	    }
	    return $xml;
	}

	public static function xmlSafeStr($str){
		return '<![CDATA['.preg_replace("/[\\x00-\\x08\\x0b-\\x0c\\x0e-\\x1f]/",'',$str).']]>';
	}

	/**
	 * 过滤文字回复\r\n换行符
	 * @param string $text
	 * @return string|mixed
	 */
	private function _auto_text_filter($text) {
		if (!$this->_text_filter) return $text;
		return str_replace("\r\n", "\n", $text);
	}
	
}

if(!class_exists("SHA1")){
	/**
	 * SHA1 class
	 *
	 * 计算公众平台的消息签名接口.
	 */
	class SHA1{
		/**
		 * 用SHA1算法生成安全签名
		 * @param string $token 票据
		 * @param string $timestamp 时间戳
		 * @param string $nonce 随机字符串
		 * @param string $encrypt 密文消息
		 */
		public function getSHA1($token, $timestamp, $nonce, $encrypt_msg)
		{
			//排序
			try {
				$array = array($encrypt_msg, $token, $timestamp, $nonce);
				sort($array, SORT_STRING);
				$str = implode($array);
				return array(ErrorCode::$OK, sha1($str));
			} catch (Exception $e) {
				//print $e . "\n";
				return array(ErrorCode::$ComputeSignatureError, null);
			}
		}
	}
}


if(!class_exists("PKCS7Encoder")){
	/**
	 * PKCS7Encoder class
	 *
	 * 提供基于PKCS7算法的加解密接口.
	 */
	class PKCS7Encoder{
	    public static $block_size = 32;
	    /**
	     * 对需要加密的明文进行填充补位
	     * @param $text 需要进行填充补位操作的明文
	     * @return 补齐明文字符串
	     */
	    function encode($text){
	        $block_size = PKCS7Encoder::$block_size;
	        $text_length = strlen($text);
	        //计算需要填充的位数
	        $amount_to_pad = PKCS7Encoder::$block_size - ($text_length % PKCS7Encoder::$block_size);
	        if ($amount_to_pad == 0) {
	            $amount_to_pad = PKCS7Encoder::block_size;
	        }
	        //获得补位所用的字符
	        $pad_chr = chr($amount_to_pad);
	        $tmp = "";
	        for ($index = 0; $index < $amount_to_pad; $index++) {
	            $tmp .= $pad_chr;
	        }
	        return $text . $tmp;
	    }
	    /**
	     * 对解密后的明文进行补位删除
	     * @param decrypted 解密后的明文
	     * @return 删除填充补位后的明文
	     */
	    function decode($text)
	    {
	        $pad = ord(substr($text, -1));
	        if ($pad < 1 || $pad > PKCS7Encoder::$block_size) {
	            $pad = 0;
	        }
	        return substr($text, 0, (strlen($text) - $pad));
	    }
	}
}

if(!class_exists("Prpcrypt")){
	/**
	 * Prpcrypt class
	 *
	 * 提供接收和推送给公众平台消息的加解密接口.
	 */
	class Prpcrypt{
	    public $key;
	    function __construct($k) {
	        $this->key = base64_decode($k . "=");
	    }
	    /**
	     * 兼容老版本php构造函数，不能在 __construct() 方法前边，否则报错
	     */
	    function Prpcrypt($k){
	        $this->key = base64_decode($k . "=");
	    }
	    /**
	     * 对明文进行加密
	     * @param string $text 需要加密的明文
	     * @return string 加密后的密文
	     */
	    public function encrypt($text, $appid){
	        try {
	            //获得16位随机字符串，填充到明文之前
	            $random = $this->getRandomStr();//"aaaabbbbccccdddd";
	            $text = $random . pack("N", strlen($text)) . $text . $appid;
	            // 网络字节序
	            $size = mcrypt_get_block_size(MCRYPT_RIJNDAEL_128, MCRYPT_MODE_CBC);
	            $module = mcrypt_module_open(MCRYPT_RIJNDAEL_128, '', MCRYPT_MODE_CBC, '');
	            $iv = substr($this->key, 0, 16);
	            //使用自定义的填充方式对明文进行补位填充
	            $pkc_encoder = new PKCS7Encoder;
	            $text = $pkc_encoder->encode($text);
	            mcrypt_generic_init($module, $this->key, $iv);
	            //加密
	            $encrypted = mcrypt_generic($module, $text);
	            mcrypt_generic_deinit($module);
	            mcrypt_module_close($module);
	            //			print(base64_encode($encrypted));
	            //使用BASE64对加密后的字符串进行编码
	            return array(ErrorCode::$OK, base64_encode($encrypted));
	        } catch (Exception $e) {
	            //print $e;
	            return array(ErrorCode::$EncryptAESError, null);
	        }
	    }
	    /**
	     * 对密文进行解密
	     * @param string $encrypted 需要解密的密文
	     * @return string 解密得到的明文
	     */
	    public function decrypt($encrypted, $appid){
	        try {
	            //使用BASE64对需要解密的字符串进行解码
	            $ciphertext_dec = base64_decode($encrypted);
	            $module = mcrypt_module_open(MCRYPT_RIJNDAEL_128, '', MCRYPT_MODE_CBC, '');
	            $iv = substr($this->key, 0, 16);
	            mcrypt_generic_init($module, $this->key, $iv);
	            //解密
	            $decrypted = mdecrypt_generic($module, $ciphertext_dec);
	            mcrypt_generic_deinit($module);
	            mcrypt_module_close($module);
	        } catch (Exception $e) {
	            return array(ErrorCode::$DecryptAESError, null);
	        }
	        try {
	            //去除补位字符
	            $pkc_encoder = new PKCS7Encoder;
	            $result = $pkc_encoder->decode($decrypted);
	            //去除16位随机字符串,网络字节序和AppId
	            if (strlen($result) < 16)
	                return "";
	            $content = substr($result, 16, strlen($result));
	            $len_list = unpack("N", substr($content, 0, 4));
	            $xml_len = $len_list[1];
	            $xml_content = substr($content, 4, $xml_len);
	            $from_appid = substr($content, $xml_len + 4);
	        } catch (Exception $e) {
	            //print $e;
	            return array(ErrorCode::$IllegalBuffer, null);
	        }
	        if ($from_appid != $appid){
	            return array(ErrorCode::$ValidateAppidError, null);
	        }
	        return array(0, $xml_content);
	    }
	    /**
	     * 随机生成16位字符串
	     * @return string 生成的字符串
	     */
	    function getRandomStr(){
	        $str = "";
	        $str_pol = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
	        $max = strlen($str_pol) - 1;
	        for ($i = 0; $i < 16; $i++) {
	            $str .= $str_pol[mt_rand(0, $max)];
	        }
	        return $str;
	    }
	}
}

if(!class_exists("ErrorCode")){
	/**
	 * error code 说明.
	 * <ul>
	 *    <li>-40001: 签名验证错误</li>
	 *    <li>-40002: xml解析失败</li>
	 *    <li>-40003: sha加密生成签名失败</li>
	 *    <li>-40004: encodingAesKey 非法</li>
	 *    <li>-40005: appid 校验错误</li>
	 *    <li>-40006: aes 加密失败</li>
	 *    <li>-40007: aes 解密失败</li>
	 *    <li>-40008: 解密后得到的buffer非法</li>
	 *    <li>-40009: base64加密失败</li>
	 *    <li>-40010: base64解密失败</li>
	 *    <li>-40011: 生成xml失败</li>
	 * </ul>
	 */
	class ErrorCode{
		public static $OK = 0;
		public static $ValidateSignatureError = -40001;
		public static $ParseXmlError = -40002;
		public static $ComputeSignatureError = -40003;
		public static $IllegalAesKey = -40004;
		public static $ValidateAppidError = -40005;
		public static $EncryptAESError = -40006;
		public static $DecryptAESError = -40007;
		public static $IllegalBuffer = -40008;
		public static $EncodeBase64Error = -40009;
		public static $DecodeBase64Error = -40010;
		public static $GenReturnXmlError = -40011;

		public static $errCode=array(
	        '0' 	=> '处理成功',
	        '40001' => '校验签名失败',
	        '40002' => '解析xml失败',
	        '40003' => '计算签名失败',
	        '40004' => '不合法的AESKey',
	        '40005' => '校验AppID失败',
	        '40006' => 'AES加密失败',
	        '40007' => 'AES解密失败',
	        '40008' => '公众平台发送的xml不合法',
	        '40009' => 'Base64编码失败',
	        '40010' => 'Base64解码失败',
	        '40011' => '公众帐号生成回包xml失败',
	        '61005'	=> '第三方ticket失效'
	    );
		public static function getErrText($err) {
	        if (isset(self::$errCode[$err])) {
	            return self::$errCode[$err];
	        }else {
	            return false;
	        };
	    }
	}
}
?>