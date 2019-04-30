<?php
namespace app\mobile\Controller;

use app\mobile\Controller\Index;
use think\Session;

class Base extends Index{
	protected $_station;
    protected $uploadurl;


 	public function __construct()
 	{
 		parent::__construct();

        $this->_init();
 		$this->_getStation();

 		$this->assign('station', $this->_station);
    }

    /**
     * [_init 初始化]
     * @return [type] [description]
     */
    private function _init()
    {
        $this->uploadurl = config("UPLOADIMG_URL");
        $this->assign('uploadurl',$this->uploadurl);
    }

    /**
     * [_getStation 获取站点信息]
     * @return [type] [description]
     */
    private function _getStation()
    {
    	if(Session::get('station.id'))
    	{
    		$this->_station = Session::get('station');
    	}
    	else
    	{
    		$station = db('station')->where('tel', array('<>', ''))->find();
    		Session::set('station', $station);
    	}
    }

    /**
     * [_toSuccess 成功输出]
     * @param  string $msg  [description]
     * @param  [type] $data [description]
     * @return [type]       [description]
     */
    public function _toSuccess($msg='操作成功', $data = [])
    {
        $data = array(
            'code' => 0,
            'data' => $data,
            'msg'  => $msg,
        );

        $this->_toJson($data);
    }

    /**
     * [_toError 失败输出]
     * @param  string  $msg  [description]
     * @param  [type]  $data [description]
     * @param  integer $code [description]
     * @return [type]        [description]
     */
    public function _toError($msg='操作失败', $data = [], $code=100000)
    {
        $data = array(
            'code' => $code,
            'data' => $data,
            'msg'  => $msg,
        );

        $this->_toJson($data);
    }

    /**
     * [_toJson JSON输出]
     * @param  [type] $data [description]
     * @return [type]       [description]
     */
    public function _toJson($data)
    {
        echo json_encode($data);
        exit();
    }
}