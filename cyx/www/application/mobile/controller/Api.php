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
    public function getStation()
    {
    	$this->_toJson( $this->_station );
    }

    /**
     * [getarticle 获取指定文章数]
     * name=solution 解决方案
     * name=hotnews 资讯热点
     * @return [type] [description]
     */
    public function getArticle()
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
    public function getArticleDetail()
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
    public function getCustomer()
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
     * [getAboutUs 获取关于我们]
     * @return [type] [description]
     */
    public function getAboutUs()
    {
    	$data = db('station')->where('type', 'about_us')->find();

    	$this->_toJson($data);
    }

    /**
     * [getsolutionList 获取解决方案列表]
     * @return [type] [description]
     */
    public function getSolutionList()
    {

    }

    /**
     * [getPage 制作分页]
     * @return [type] [description]
     */
    public function getPage()
    {

    }

    /**
     * [connectUs 联系我们]
     * @return [type] [description]
     */
    public function connectUs()
    {
    	$data = array(
    		'username' => strval(getparameter('username')),
    		'email' => strval(getparameter('email')),
    		'mobile' => strval(getparameter('mobile')),
    		'type' => strval(getparameter('type')),
    		'remark' => strval(getparameter('remark')),
    	);

    	if(empty($data['username']))
    	{
    		$this->_toError('请填写您的称呼');
    	}
    	if(empty($data['mobile']))
    	{
    		$this->_toError('请填写您的手机号');
    	}
    	if(!preg_match("/^1[3456789]\d{9}$/", $data['mobile']))
    	{
    		$this->_toError('请填写正确的手机号');
    	}

    	$res = db('connect_us')->insert($data);
    	if(!$res)
    	{
    		$this->_toError('抱歉，系统错误！请稍后重试。');
    	}

    	$this->_toSuccess('恭喜，您的信息已提交，我们会尽快联系您！');
    }


}