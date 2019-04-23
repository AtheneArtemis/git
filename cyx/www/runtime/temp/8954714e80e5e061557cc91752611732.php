<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:73:"F:\Sublime Project\0002cyx\cyx/application/admin\view\homepage\index.html";i:1555395969;s:74:"F:\Sublime Project\0002cyx\cyx\application\admin\view\public\left_nav.html";i:1555395609;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>后台管理</title>
<link rel="stylesheet" href="/public/static/resource/layui/css/layui.css">
<script src="/public/static/js/jquery-3.3.1.min.js"></script>
<style>
.mar_ri {
	margin-right: 11px;
}
.bg-gradual {
	background: linear-gradient(to right, #825FED, #4f76eb) !important;
}
.layui-form-select dl dd.layui-this {
	background-color: #1781ed;
}
.layui-nav {
	background-color: #455161
}
.active {
	background-color: #323c48
}
.layui-laypage .layui-laypage-curr .layui-laypage-em {
	background-color: #1781ed;
}
.blue-bg {
	background-color: #4f76eb;
}
.long-input {
	width: 300px
}
.layui-layer-title {
	background:#1781ed !important;
	color: white !important;
}
th {
	background-color: #eef2ff;
	color: black
}
.layui-nav-li {
	position: relative;
	display: inline-block;
	vertical-align: middle;
	line-height: 60px;
	padding: 0 20px;
}
.head-img {
	width: 26px;
	border: 2px solid #eaf0fe
}
.layui-nav-tree .layui-nav-bar {
	width: 5px;
	height: 0;
	background-color: #4e5465;
}
.layui-nav-tree .layui-nav-child dd.layui-this, .layui-nav-tree .layui-nav-child dd.layui-this a, .layui-nav-tree .layui-this, .layui-nav-tree .layui-this>a, .layui-nav-tree .layui-this>a:hover {
	background-color: #4e5465;
	color: #fff;
}
.layui-textarea {
	width: 400px;}
	.check-img{
		    width: 16px;}
</style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
<div class="layui-header" style="box-shadow: 0 3px 2px 0 rgba(0,0,0,.05);background-color:#fff">
    <div style="background-color:#fff !important">
    <img src="/public/static/images/logo.png" style="width: 50px;"/>
    <span style="font-size: 20px;color: #333;">抽奖后台管理系统</span>
    </div>
    <ul class="layui-nav layui-layout-left" style="margin-left: 24px;">
        <li class="layui-nav-li"><a href="<?php echo url('Homepage/index'); ?>" style="font-size: 20px;color:#707070">返回首页</a></li>
    </ul>
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-li">
            <a><i class="layui-icon mar_ri layui-icon-friends"></i>admin</a></li>
             <li class="layui-nav-li"><a href="/index.php/admin/homepage/index" style="color: #666;"><img style="width:20px;height:20px" src="/public/static/images/home.png"/></a>
             </li>

        <li class="layui-nav-li"><a href="" style="color: #666;"><img style="width:20px;height:20px" src="/public/static/images/close.png"></a></li>
    </ul>
</div>
<div class="layui-side" style="background-color:#455161">
    <div class="layui-side-scroll">
        <ul class="layui-nav layui-nav-tree"  lay-filter="test" id="ul">
            <li class="layui-nav-item <?php if(CONTROLLER_NAME=='Homepage'){ echo 'active';}?>"><a href="/index.php/admin/homepage/index"><i class="layui-icon mar_ri layui-icon-home"></i>账号管理</a></li>
            <li class="layui-nav-item <?php if(CONTROLLER_NAME=='Question'){ echo 'active';}?>"><a href="/index.php/admin/question/index"><i class="layui-icon mar_ri layui-icon-survey"></i>问卷调查</a></li>
            <li class="layui-nav-item <?php if(CONTROLLER_NAME=='Statistics'){ echo 'active';}?>"><a href="/index.php/admin/statistics/index"><i class="layui-icon mar_ri layui-icon-chart"></i>调查系统</a></li>
            <li class="layui-nav-item <?php if(CONTROLLER_NAME=='User'){ echo 'active';}?>"><a href="/index.php/admin/user/index"><i class="layui-icon mar_ri layui-icon-user"></i>用户管理</a> </li>
            <li class="layui-nav-item <?php if(CONTROLLER_NAME=='Activity'){ echo 'active';}?>"> <a class="" href="/index.php/admin/activity/index"><i class="layui-icon mar_ri layui-icon-app"></i>活动管理</a> </li>
            <li class="layui-nav-item <?php if(CONTROLLER_NAME=='Prize'){ echo 'active';}?>"> <a href="/index.php/admin/prize/index"><i class="layui-icon layui-icon-form mar_ri"></i>奖品管理</a> </li>
            <li class="layui-nav-item <?php if(CONTROLLER_NAME=='Share'){ echo 'active';}?>"><a href="/index.php/admin/share/index"><i  class="layui-icon layui-icon-share mar_ri"></i>分享设置</a></li>
            <li class="layui-nav-item <?php if(CONTROLLER_NAME=='Win'){ echo 'active';}?>"><a href="/index.php/admin/Win/index"><i  class="layui-icon layui-icon-list mar_ri"></i>中奖列表</a></li>
            <li class="layui-nav-item <?php if(CONTROLLER_NAME=='Setting'){ echo 'active';}?>"><a href="/index.php/admin/setting/index"><i  class="layui-icon layui-icon-set mar_ri"></i>系统设置</a></li>
        </ul>
    </div>
</div>
<script src="/public/static/resource/layer/layer.js"></script>
<script src="/public/static/resource/layui/layui.js"></script>
<script type="text/javascript">
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;

});
</script>

<div class="layui-body" style="background-color:#f2f2f2">
    <div style="padding: 10px; background-color: #F2F2F2;">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md12">
                <div class="layui-card">
                    <div class="layui-card-body">
                        <div class="layui-form-item">
                           
                            <form class="layui-form" action="">
                              <button style="float: left;margin-right: 10px;" class="layui-btn  btn-chouj-choose layui-btn-sm layui-btn-normal"><a href="/index.php/admin/homepage/add" style="color:#fff">账户列表</a></button>
                             <button style="float: left;margin-right: 10px;background-color:#fff" class="layui-btn btn-chouj layui-btn-sm layui-btn-normal"><a href="/index.php/admin/homepage/add" style="color:#1781ed">添加账户</a></button>
                              
                            </form>
                        </div>
                        <div class="layui-form">
                            <table class="layui-hide" id="test" lay-filter="test">
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body></html><style>
.layui-layer-content {
	padding: 30px 0;
	text-align: center;
}
.layui-layer-btn1 {
	color: #009f95;
	background-color: #fff;
}
/*.layui-layer-btn .layui-layer-btn0 {
    border-color: #4f76eb;
    background-color: #4f76eb;
	}*/
.btn-chouj-choose{
	border-radius:3px;
	background-color:#1781ed;
	color:#fff;
	}
.btn-chouj
{
	border-radius:5px;
	background-color:#fff;
	color:#1781ed;
	border:1px solid #1781ed;
	}
</style>
<script src="/public/static/js/jquery-3.3.1.min.js"></script>
<script type="text/html" id="barDemo">
  <a href="/index.php/admin/homepage/detail/?demo-id={{d.id}}" lay-event="detail"> <button class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon"></i></button></a>
   <a lay-event="del"><button class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon"></i></button></a>
</script>
<script type="text/javascript">
layui.use('table', function(){
  var table = layui.table;
  table.render({
    elem: '#test'
  /*  ,url:'/demo/table/user/'*/
    ,cols: [[
      {field:'id', title: 'ID', style:'color:#4f76eb',sort: true}
	    ,{field:'title', title: '用户名'}
      ,{field:'time',  title: '密码'}
      ,{fixed:'right', title:'操作', toolbar: '#barDemo'}
   
    ]] ,data: [{
		 "id":"NO.1",
		 "title":"no color。 半透明",
	 "time":"fhdjksjfkdls"
    }, {
	 "id":"NO.2",
		 "title":"no半透明",
	 "time":"fhdjksjfkdls"
	 
    }, {
   	  "id":"NO.3",
		 "title":"no col",
	 "time":"fhdjksjfkdls"
	 
    }] 
    ,page: true
  });
   table.on('tool(test)', function(obj){
    var data = obj.data;
    if(obj.event === 'del'){
      layer.confirm('是否确定要删除此账号？', function(index){
        obj.del();
        layer.close(index);
      });
    }
  }); 
});
</script>


