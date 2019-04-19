<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2009 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
// $Id: Page.class.php 2712 2012-02-06 10:12:49Z liu21st $
namespace app\common;
use think\paginator\driver\Bootstrap;
class Ajaxpage extends Bootstrap{
    // 分页栏每页显示的页数
    public $rollPage = 5;
    // 页数跳转时要带的参数
    public $parameter  ;
    // 默认列表每页显示行数
    public $listRows = 20;
    // 起始行数
    public $firstRow ;
    // 分页总页面数
    protected $totalPages  ;
    // 总行数
    protected $totalRows  ;
    // 当前页数
    protected $nowPage    ;
    // 分页的栏的总页数
    protected $coolPages   ;
    // 分页显示定制
    protected $config  = array(
        'header'=>'条记录',
        'prev'=>'上一页',
        'next'=>'下一页',
        'first'=>'第一页',
        'last'=>'最后一页',
        'theme'=>' <ul class="pagination">
            <li class="disabled"><span>%totalRow% %header% %nowPage%/%totalPage% 页</span></li>
        %first% %prePage% %upPage% %linkPage% %downPage% %nextPage% %end%</ul>');
    // 默认分页变量名
    protected $varPage;


    public function __construct($totalRows,$listRows='',$ajax_func,$parameter='') {
        $this->totalRows = $totalRows;
        $this->ajax_func = $ajax_func;
        $this->parameter = $parameter;
        $this->varPage = config('VAR_PAGE') ? config('VAR_PAGE') : 'p' ;
        if(!empty($listRows)) {
            $this->listRows = intval($listRows);
        }
        $this->totalPages = ceil($this->totalRows/$this->listRows);     //总页数
        $this->coolPages  = ceil($this->totalPages/$this->rollPage);
        $varPagevalue = getparameter($this->varPage);
        $this->nowPage  = !empty($varPagevalue)?intval($varPagevalue):1;
        if(!empty($this->totalPages) && $this->nowPage>$this->totalPages) {
            $this->nowPage = $this->totalPages;
        }
        $this->firstRow = $this->listRows*($this->nowPage-1);
    }

	public function setConfig($name,$value) {
        if(isset($this->config[$name])) {
            $this->config[$name]    =   $value;
        }
    }

    public function show() {
        if(0 == $this->totalRows) return '';
        $p = $this->varPage;
        $nowCoolPage      = ceil($this->nowPage/$this->rollPage);
        $url  =  $_SERVER['REQUEST_URI'].(strpos($_SERVER['REQUEST_URI'],'?')?'':"?").$this->parameter;
        $parse = parse_url($url);
        if(isset($parse['query'])) {
            parse_str($parse['query'],$params);
            unset($params[$p]);
            $url   =  $parse['path'].'?'.http_build_query($params);
        }
        //上下翻页字符串
        $upRow   = $this->nowPage-1;
        $downRow = $this->nowPage+1;
        if ($upRow>0){
            $text = '上一页';
            $url = "javascript:".$this->ajax_func."(".$upRow.")";
            $upPage = $this->getPageLinkWrapper($url, $text);
        }else{
            $text = '上一页';
            $upPage = $this->getDisabledTextWrapper($text);//'<li class="disabled"><span>上一页</span></li>';
        }
		if ($downRow <= $this->totalPages){
		    $text = '下一页';
		    $url = "javascript:".$this->ajax_func."(".$downRow.")";
		    $downPage = $this->getPageLinkWrapper($url, $text);
        }else{
            $downPage = $this->getDisabledTextWrapper('下一页');
        }
        // 第一页、上五页
        if($this->nowPage > 1){//$this->nowPage > 1
            $text = '第一页';
            $url = "javascript:".$this->ajax_func."(1)";
            $theFirst = $this->getPageLinkWrapper($url, $text);
        }
        if($this->nowPage > 5){
            $preRow =  $this->nowPage-$this->rollPage;
            $text = '上五页';
            $url = "javascript:".$this->ajax_func."(".$preRow.")";
            $prePage = $this->getPageLinkWrapper($url,$text);
        }
        //最后一页、下五页
        if ($this->nowPage <> $this->totalPages){//$this->nowPage <> $this->totalPages
            $theEndRow = $this->totalPages;
            $text = '最后一页';
            $url = "javascript:".$this->ajax_func."(".$theEndRow.")";
            $theEnd = $this->getPageLinkWrapper($url,$text);
        }
        if (ceil($this->nowPage/5) < $this->coolPages){
            $nextRow = $this->nowPage+$this->rollPage;
            $text = '下五页';
            $url = "javascript:".$this->ajax_func."(".$nextRow.")";
            $nextPage = $this->getPageLinkWrapper($url,$text);
        }
        // 1 2 3 4 5
        //$linkPage = $this->getLinks();
        $linkPage = "";
        for($i=1;$i<=$this->rollPage;$i++){
            $page=($nowCoolPage-1)*$this->rollPage+$i;
            $url = "javascript:".$this->ajax_func."(".$page.")";
            if($page!=$this->nowPage){
                if($page<=$this->totalPages){
                    $linkPage .= $this->getPageLinkWrapper($url,$page);
                }else{
                    break;
                }
            }else{
                if($this->totalPages != 1){
                    $linkPage .= $this->getActivePageWrapper($page);
                }else{
                    $linkPage = $this->getActivePageWrapper($page);
                }
            }
        } 
        $pageStr  =  str_replace(
            array('%header%','%nowPage%','%totalRow%','%totalPage%','%upPage%','%downPage%','%first%','%prePage%','%linkPage%','%nextPage%','%end%'),
            array($this->config['header'],$this->nowPage,$this->totalRows,$this->totalPages,$upPage,$downPage,$theFirst,$prePage,$linkPage,$nextPage,$theEnd),$this->config['theme']);
        return $pageStr;
    }
    /**
     * 页码按钮
     * @return string
     */
    protected function getLinks()
    {
        if ($this->simple)
            return '';
    
            $block = [
                'first'  => null,
                'slider' => null,
                'last'   => null
            ];
    
            $side   = 3;
            $window = $side * 2;
    
            if ($this->totalPages < $window + 6) {
                $block['first'] = $this->getUrlRange(1, $this->totalPages);
            } elseif ($this->nowPage <= $window) {
                $block['first'] = $this->getUrlRange(1, $window + 2);
                $block['last']  = $this->getUrlRange($this->totalPages - 1, $this->totalPages);
            } elseif ($this->nowPage > ($this->totalPages - $window)) {
                $block['first'] = $this->getUrlRange(1, 2);
                $block['last']  = $this->getUrlRange($this->totalPages - ($window + 2), $this->totalPages);
            } else {
                $block['first']  = $this->getUrlRange(1, 2);
                $block['slider'] = $this->getUrlRange($this->nowPage - $side, $this->nowPage + $side);
                $block['last']   = $this->getUrlRange($this->totalPages - 1, $this->totalPages);
            }
    
            $html = '';
    
            if (is_array($block['first'])) {
                $html .= $this->getUrlLinks($block['first']);
            }
    
            if (is_array($block['slider'])) {
                $html .= $this->getDots();
                $html .= $this->getUrlLinks($block['slider']);
            }
    
            if (is_array($block['last'])) {
                $html .= $this->getDots();
                $html .= $this->getUrlLinks($block['last']);
            }
            return $html;
    }
    /**
     * 创建一组分页链接
     *
     * @param  int $start
     * @param  int $end
     * @return array
     */
    public function getUrlRange($start, $end)
    {
        $urls = [];
    
        for ($page = $start; $page <= $end; $page++) {
            $urls[$page] = $this->url($page);
        }
    
        return $urls;
    }
    /**
     * 获取页码对应的链接
     *
     * @param $page
     * @return string
     */
    protected function url($page)
    {
        if ($page <= 0) {
            $page = 1;
        }
        $url = "javascript:".$this->ajax_func."(".$page.")";
    }
}

?>