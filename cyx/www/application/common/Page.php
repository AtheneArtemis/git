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
class Page extends Bootstrap{
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


    public function __construct($totalRows,$listRows='',$parameter='') {
        $this->totalRows = $totalRows;
        $this->parameter = $parameter;
        $this->varPage = config('VAR_PAGE') ? config('VAR_PAGE') : 'p' ;
        if(!empty($listRows)) {
            $this->listRows = intval($listRows);
        }
        $this->totalPages = ceil($this->totalRows/$this->listRows);     //总页数
        $this->coolPages  = ceil($this->totalPages/$this->rollPage);
        $this->nowPage  = !empty(getparameter($this->varPage))?intval(getparameter($this->varPage)):1;
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
            $url = "javascript:(".$upRow.")";
            $upPage = $this->getPageLinkWrapper($url, $text);
        }else{
            $text = '上一页';
            $upPage = $this->getDisabledTextWrapper($text);
        }
		if ($downRow <= $this->totalPages){
		    $text = '下一页';
		    $url = "javascript:(".$downRow.")";
		    $downPage = $this->getPageLinkWrapper($url, $text);
        }else{
            $downPage = $this->getDisabledTextWrapper('下一页');
            //$downPage="";
        }
        // << < > >>
        if($nowCoolPage == 1){
            $prePage = $this->getDisabledTextWrapper('上五页');
            $theFirst = $this->getDisabledTextWrapper('第一页');
        }else{
            $preRow =  $this->nowPage-$this->rollPage;
            $prePage = $this->getPageLinkWrapper("javascript:(".$preRow.")",'上五页');
            $theFirst = $this->getPageLinkWrapper("javascript:(1)",'第一页');
        }
        if($nowCoolPage == $this->coolPages){
            $nextPage = $this->getDisabledTextWrapper('下五页');
            $theEnd=$this->getDisabledTextWrapper('最后一页');
        }else{
            $nextRow = $this->nowPage+$this->rollPage;
            $theEndRow = $this->totalPages;
            $nextPage = $this->getPageLinkWrapper("javascript:(".$nextRow.")",'下五页');
            $theEnd = $this->getPageLinkWrapper("javascript:(".$theEndRow.")",'最后一页');
        }
        // 1 2 3 4 5
        $linkPage = "";
        for($i=1;$i<=$this->rollPage;$i++){
            $page=($nowCoolPage-1)*$this->rollPage+$i;
            $url = "javascript:(".$page.")";
            if($page!=$this->nowPage){
                if($page<=$this->totalPages){
                    $linkPage .= $this->getPageLinkWrapper($url,$page);
                }else{
                    break;
                }
            }else{
                if($this->totalPages != 1){
                    $linkPage .= $this->getActivePageWrapper($page);
                }
            }
        }
        $pageStr  =  str_replace(
            array('%header%','%nowPage%','%totalRow%','%totalPage%','%upPage%','%downPage%','%first%','%prePage%','%linkPage%','%nextPage%','%end%'),
            array($this->config['header'],$this->nowPage,$this->totalRows,$this->totalPages,$upPage,$downPage,$theFirst,$prePage,$linkPage,$nextPage,$theEnd),$this->config['theme']);
        return $pageStr;
    }
}

?>