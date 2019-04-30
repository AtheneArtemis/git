<?php
namespace app\mobile\Controller;
use app\mobile\Controller\Base;

/**
 * Api接口
 */
class Api extends Base
{
 	public function __construct()
 	{
       parent::__construct();
    }

    /**
     * [getstation 获取站点信息]
     * @return [type] [description]
     */
    public function getstation()
    {
    	$this->_toJson( $this->_station );
    }

    /**
     * [getarticle 获取指定文章数]
     * name=solution 解决方案
     * name=hotnews 资讯热点
     * @return [type] [description]
     */
    public function getarticle()
    {

    	$name = input('name');
    	$limit = input('limit', 3);

    	$lists = db('article')->field('a.id,a.title,a.intro,a.thumbpicture,a.createtime')->alias('a')
    		                  ->join("__ARTICLETYPE__ at1", "at1.type = 'group' AND at1.name = '{$name}'")
    		                  ->join("__ARTICLETYPE__ at2", "at2.gid = at1.id AND at2.id = a.articletype_id")
    		                  ->order('a.id DESC')
    		                  ->limit($limit)
    	                      ->select();

    	$this->_toJson($lists);
    }

    /**
     * [getarticle_detail 获取文章详情]
     * @return [type] [description]
     */
    public function getarticle_detail()
    {
    	$article_id = input('article_id');

    	$where = array(
    		'id' => $article_id,
    	);
    	$data = db('article')->where($where)->find();

    	$where = array(
    		'id' => array('<', $article_id),
    	);
    	$last = db('article')->field('id,title')->where($where)->order('id desc')->find();

    	if(empty($last))
    	{
    		$last = array('id'=>0,'title'=>'无');
    	}

    	$where = array(
    		'id' => array('<', $article_id),
    	);
    	$next = db('article')->field('id,title')->where($where)->order('id asc')->find();

    	if(empty($next))
    	{
    		$next = array('id'=>0,'title'=>'无');
    	}


    	$articletype = db('articletype')->field('a.*,b.*')
    	                                ->alias('a')
    	                                ->join("__ARTICLETYPE__ b", "b.id = a.gid")
    	                                ->where("a.id", $data['articletype_id'])
    	                                ->select();

    	$data = array(
    		'last'=>$last,	//上一篇
    		'this'=> $data,	//当前文章内容
    		'next'=>$next,	//下一篇
    		'articletype'=>$articletype,//分类信息
    	);

    	$this->_toJson($data);
    }

    /**
     * [getcustomer 获取经典客户]
     * @return [type] [description]
     */
    public function getcustomer()
    {
    	$limit = input('limit', 4);

    	$where = array(
    		'is_delete' => 0,
    		'status' => 1,
    	);

    	$lists = db('customer')->where($where)->order('sort asc')->limit($limit)->select();

    	$this->_toJson($lists);
    }

    /**
     * [getsolutionList 获取解决方案列表]
     * @return [type] [description]
     */
    public function getsolutionList()
    {

    }

    /**
     * [getPage 制作分页]
     * @return [type] [description]
     */
    public function getPage()
    {

    }


}