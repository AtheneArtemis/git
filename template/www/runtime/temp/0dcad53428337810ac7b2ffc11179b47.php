<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:58:"D:\wamp\wwwroot\www/application/admin\view\Node\index.html";i:1522718555;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>经销商服务系统管理后台</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
	<link href="/public/static/css/bootstrap.min14ed.css" rel="stylesheet">
    <link href="/public/static/css/font-awesome.min93e3.css" rel="stylesheet">
    <link href="/public/static/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="/public/static/css/animate.min.css" rel="stylesheet">
    <link href="/public/static/css/style.min862f.css" rel="stylesheet">
    <link rel="stylesheet" href="/public/static/css/app/select.css">
    <link rel="stylesheet" href="/public/static/css/app/admin.css">
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox float-e-margins">
            <div class="ibox-title col-sm-12">
                <div class="col-sm-6"><h3>节点管理</h3></div>
                <div class="col-sm-6 text-right">
                	<a href="<?php echo url('Node/add'); ?>"><button class="btn btn-primary">新增模块</button></a>
					<a href="javascript:add('<?php echo url('Node/add','',''); ?>')"><button class="btn btn-primary">添加下级</button></a>
					<a href="javascript:edit('<?php echo url('Node/edit','',''); ?>')"><button class="btn btn-primary">修改</button></a>
					<a href="javascript:dele('<?php echo url('Node/delete'); ?>')"><button class="btn btn-primary">删除</button></a>
				</div>
                <div style="clear:both;height:10px"></div>
			</div>
			<!-- 搜索栏 end -->
            <div class="ibox-content">
                <div class="row row-lg">
                    <div class="col-sm-12">
                        <h4 class="example-title"></h4>
                        <div class="example">
                        	<?php echo $nodelist; ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Panel Basic -->
    </div>
    <script src="/public/static/js/jquery.min.js"></script>
    <script src="/public/static/js/bootstrap.min.js"></script>
    <script src="/public/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="/public/static/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
    <script src="/public/static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script src="/public/static/js/demo/bootstrap-table-demo.min.js"></script>
    <script src="/public/static/js/app/admin.js"></script>
    <script type="text/javascript">  
		function add(url,id){
			if (id){
				var inputValue = id;
			}else{
				var inputValue = $("input[type='checkbox']:checked").val();
			}
			if (inputValue == undefined){
				alert("请选择编辑项");
				return;
			}else{
				window.location.href = url+'/id/'+inputValue;
			}
		}
		$('.ibox-content li:eq(0) a').tab('show');
    	$('.ibox-content .tab-content li:eq(0) a').tab('show');
	</script> 
</body>
</html>
