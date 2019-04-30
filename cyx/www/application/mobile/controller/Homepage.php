<?php
namespace app\mobile\Controller;
use app\mobile\Controller\Base;
class Homepage extends Base {

	public function __construct()
 	{
 		parent::__construct();
    }

 	public function index(){
 		$solution = $this->getarticle('solution', 3);
 		$hotnews  = $this->getarticle('hotnews', 4);
 		$customer = $this->getcustomer();

 		$this->assign('solution', $solution);
 		$this->assign('hotnews', $hotnews);
 		$this->assign('customer', $customer);
       	return $this->fetch();
    }

    /**
     * [getarticle 查询文章]
     * @return [type] [description]
     */
    public function getarticle($name, $limit=3)
    {

    	$lists = db('article')->field('a.id,a.title,a.intro,a.thumbpicture,a.createtime')->alias('a')
    		                  ->join("__ARTICLETYPE__ at1", "at1.type = 'group' AND at1.name = '{$name}'")
    		                  ->join("__ARTICLETYPE__ at2", "at2.gid = at1.id AND at2.id = a.articletype_id")
    		                  ->order('a.id DESC')
    		                  ->limit($limit)
    	                      ->select();

    	return $lists;
    }

    /**
     * [getcustomer 经典客户]
     * @return [type] [description]
     */
    public function getcustomer()
    {
    	$where = array(
    		'is_delete' => 0,
    		'status' => 1,
    	);

    	$lists = db('customer')->where($where)->order('sort asc')->limit(4)->select();

    	return $lists;
    }

}