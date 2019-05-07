<?php
namespace app\mobile\Controller;
use app\mobile\Controller\Base;
use think\Paginator;

/**
 * Api接口
 */
class Api extends Base
{
 	public function __construct()
 	{
       parent::__construct();
    }

    public function index()
    {
        echo 'Hello World';
    }

    /**
     * [getstation 获取站点信息]
     * @return [type] [description]
     */
    public function getStation()
    {
        $name = getparameter('name');

        $station = $this->_station;

        if(!empty($name))
        {
            $this->_toJson( $station[$name] );
        }
        else
        {
            $this->_toJson( $station );
        }
    }

    /**
     * [getBanner 获取banner]
     * @return [type] [description]
     */
    public function getBanner()
    {
        $station = $this->_station;
        $banner = $station['banner'];
        $banner = unserialize($banner);

        $bannerImg = array();
        foreach ($banner as $key => $value)
        {
            $bannerImg[] = $this->uploadurl . $value['picture'];
        }

        $this->_toJson( $bannerImg );
    }

    /**
     * [getarticle 获取指定文章数]
     * name=solution 解决方案
     * name=hotnews 资讯热点
     * @return [type] [description]
     */
    public function getArticle()
    {

    	$name = getparameter('name');
    	$limit = getparameter('limit', 3);

    	$lists = db('article')->field('a.id,a.title,a.intro,a.thumbpicture,a.createtime')->alias('a')
    		                  ->join("__ARTICLETYPE__ at1", "at1.type = 'group' AND at1.name = '{$name}'")
    		                  ->join("__ARTICLETYPE__ at2", "at2.gid = at1.id AND at2.id = a.articletype_id")
                              ->where('a.is_delete', 0)
                              ->where('at1.is_delete', 0)
    		                  ->order('a.id DESC')
    		                  ->limit($limit)
    	                      ->select();

    	$this->_toJson($lists);
    }

    /**
     * [getArtileList 获取文章列表]
     * @return [type] [description]
     */
    public function getArtileList()
    {
        $name = getparameter('name');  //articletype中name字段

        if(empty($name))
        {
            $this->_toError('name data is not empty');
        }

        $ids = db('articletype')->alias('at1')
                                ->field('at1.id as at1,at2.id as at2')
                                ->distinct(true)
                                ->join('__ARTICLETYPE__ at2', 'at2.gid = at1.id')
                                ->where('at1.type', 'group')
                                ->where('at1.name', $name)
                                ->where('at1.is_delete', 0)
                                ->where('at2.is_delete', 0)
                                ->select();

        $ids = array_keys(array_flip($ids[0])+array_flip($ids[1]));


        //获取列表
        $where = array(
            'articletype_id' => array('in', $ids),
        );

        $list = db('article')->where($where)->paginate(1, true);

        $page = $list->render();

        $data = array(
            'list' => $list,
            'page' => $page,
        );

        $this->_toJson($data);
    }

    /**
     * [getarticle_detail 获取文章详情]
     * @return [type] [description]
     */
    public function getArticleDetail()
    {
    	$article_id = getparameter('article_id');

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
    	$limit = getparameter('limit', 4);

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
     * [getPage 制作分页]
     * @param  integer $thispage [当前页]
     * @param  integer $allnum   [总条数]
     * @param  string  $url      [跳转路径]
     * @param  string  $args     [跳转参数]
     * @return [type]            [每页条数]
     */
    public function getPage($thispage=1, $allnum=100, $url, $args=array(), $limit=10)
    {

        $allpage = ceil( $allnum / $limit );//总页数

        $url .= "?";

        if(!empty($args))
        {
            unset($args['page']);

            $args = implode("&", $args);

            $url .= $args;

            $url .= "&";
        }

        if($allpage<2 && $allpage>0)
        {

        }
        else
        {
            $p='';
            $p.= '<nav aria-label="Page navigation"><ul class="pagination">';

            if($thispage>1)
            {
                $p.='<li><a href="'.$url.'page='.($thispage-1).'" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>';
            }

            if($thispage<=($allpage)&&$thispage<6)
            {

                if($allpage>=5)
                {
                    $allpages=5;
                }
                else
                {
                    $allpages=$allpage;
                }
                for($i=1;$i<=$allpages;$i++)
                {
                    $nurls = $url . 'page=' . $i;

                    if($i==$thispage)
                    {
                        $p.= "<li class='active'><a href=\"{$nurls}\">{$i}</a></li>";
                    }
                    else
                    {
                        $p.= "<li><a href=\"{$nurls}\">{$i}</a></li>";
                    }
                }

            }
            else if($allpage>2&&$thispage<=($allpage)&&$thispage<=$allpage-2)
            {
                $offset_u = ($thispage-2);
                $offset_d = ($thispage+2);
                //偏移上2个
                for($i=$offset_u;$i<$thispage;$i++)
                {
                    $nurls = $url . 'page=' . $i;

                    if($i==$thispage)
                    {
                        $p.= "<li class='active'><a href=\"{$nurls}\">{$i}</a></li>";
                    }
                    else
                    {
                        $p.= "<li><a href=\"{$nurls}\">{$i}</a></li>";
                    }
                }
                //偏移下2个
                for($i=$thispage;$i<=$offset_d;$i++)
                {
                    $nurls = $url . 'page=' . $i;

                    if($i==$thispage)
                    {
                        $p.= "<li class='active'><a href=\"{$nurls}\">{$i}</a></li>";
                    }
                    else
                    {
                        $p.= "<li><a href=\"{$nurls}\">{$i}</a></li>";
                    }
                }
            }
            else
            {
                $offset_u = ($thispage-2);
                $offset_d = ($allpage);
                //偏移上2个

                if($allpage>2)
                {
                    for($i=$offset_u;$i<$thispage;$i++)
                    {
                        $nurls = $url . 'page=' . $i;

                        if($i==$thispage)
                        {
                            $p.= "<li class='active'><a href=\"{$nurls}\">{$i}</a></li>";
                        }
                        else
                        {
                            $p.= "<li><a href=\"{$nurls}\">{$i}</a></li>";
                        }
                    }
                }

                //偏移下2个
                for($i=$thispage;$i<=$offset_d;$i++)
                {
                    $nurls = $url . 'page=' . $i;

                    if($i==$thispage)
                    {
                        $p.= "<li class='active'><a href=\"{$nurls}\" >{$i}</a></li>";
                    }
                    else
                    {
                        $p.= "<li><a href=\"{$nurls}\">{$i}</a></li>";
                    }
                }
            }


            if($thispage<($allpage))
            {
                $p.='<li><a href="'.$url.'page='.($thispage+1).'" aria-label=\"Next\"><span aria-hidden="true">&raquo;</span></a></li>';
            }

            if($allpage>1)
            {
                $p.='<li><a href="javascript:;">共'.$allpage.'页</a></li>';
            }


            $p.= '</ul></nav>';
            return $p;
        }
    }

    /**
     * [getCustomization 获取定制开发服务类型]
     * @return [type] [description]
     */
    public function getCustomization()
    {
        $lists = db('customization')->field('id,name,icon')->where('is_delete', 0)->order('sort asc')->select();
        $this->_toJson($lists);
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

        // switch (getparameter('type')) {
        //     case '1':
        //         $type = "微信开发";
        //         break;
        //     case '2':
        //         $type = "小程序开发";
        //         break;
        //     case '3':
        //         $type = "网站开发";
        //         break;
        //     case '4':
        //         $type = "商城开发";
        //         break;
        //     case '5':
        //         $type = "APP开发";
        //         break;
        // }

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