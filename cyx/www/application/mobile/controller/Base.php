<?php
namespace app\mobile\Controller;

use app\mobile\Controller\Index;
use think\Session;

class Base extends Index{
	protected $_station;

 	public function __construct()
 	{
 		parent::__construct();

 		$this->_getStation();

 		$this->assign('station', $this->_station);
    }

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
}