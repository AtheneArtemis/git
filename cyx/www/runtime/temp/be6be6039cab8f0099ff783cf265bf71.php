<<<<<<< HEAD:cyx/www/runtime/temp/be6be6039cab8f0099ff783cf265bf71.php
<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:81:"D:\phpStudy\PHPTutorial\WWW\git\cyx\www/application/admin\view\Article\index.html";i:1556531645;s:78:"D:\phpStudy\PHPTutorial\WWW\git\cyx\www\application\admin\view\Public\top.html";i:1556531645;s:81:"D:\phpStudy\PHPTutorial\WWW\git\cyx\www\application\admin\view\Public\footer.html";i:1556531645;s:83:"D:\phpStudy\PHPTutorial\WWW\git\cyx\www\application\admin\view\Public\commonjs.html";i:1556531645;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $sysset['storename']; ?>管理后台</title>
    <meta name="keywords" content="<?php echo $sysset['storename']; ?>">
    <meta name="description" content="<?php echo $sysset['storename']; ?>">
    <link href="/public/static/css/bootstrap.min14ed.css" rel="stylesheet">
    <link href="/public/static/css/font-awesome.min93e3.css" rel="stylesheet">
    <link href="/public/static/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="/public/static/css/animate.min.css" rel="stylesheet">
    <link href="/public/static/css/style.min862f.css" rel="stylesheet">
    <link href="/public/static/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="/public/static/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <!-- <link rel="stylesheet" href="/public/static/css/app/select.css"> -->
    <link rel="stylesheet" href="/public/static/css/app/admin.css">
    <script src="/public/static/js/jquery.min.js?v=2.1.4"></script>
    <script src="/public/static/js/bootstrap.min.js?v=3.3.6"></script>
</head>
<body class="gray-bg">

    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox float-e-margins">
            <div class="ibox-title col-sm-12">
                <div class="col-sm-6"><h3>文章列表</h3></div>
                <div class="col-sm-6 text-right">
                    <a href="/index.php/admin/article/add"><button class="btn btn-primary">新增</button></a>
	                <a href="javascript:multidel()"><button class="btn btn-primary">批量删除</button></a>
				</div>
                <div style="clear:both;height:10px"></div>
                <!-- 搜索栏 start -->
                <div>
                    <form action="/index.php/admin/article/importExcel" method="get" id="queryForm">
                        <div class="col-sm-12">
                            <div class="col-sm-2" style="padding-right: 5px"><input type="text" id="start" name="start" class="form-control" placeholder="起始时间"/></div>
                            <div class="col-sm-2" style="padding-left: 5px"><input type="text" id="end" name="end" class="form-control" placeholder="结束时间"/></div>
                            <div class="col-sm-2"><input type="text" name="nickname" id="nickname" class="form-control" placeholder="文章名称"/></div>
                            <div class="col-sm-2 text-right">
                                <div class="col-sm-3"><input type="button" onclick="submitquery(1)" id="submitBtn" value="查询" class="btn  btn-outline btn-default"></div>
                                <div class="col-sm-3" id="loading" style="margin-top:5px;"></div>
                            </div>
                            <!-- <div class="col-sm-2">
                                <a href=""><button class="btn btn-primary" type="submit">导出</button></a>
                            </div> -->
                        </div>
                    </form>
                </div>
                <!-- 搜索栏 end -->
                <div style="clear:both;"></div>
			</div>
            <div class="ibox-content">
                <div class="row row-lg">
                    <div class="col-sm-12">
                        <h4 class="example-title"></h4>
                        <div class="example">
                            <table data-toggle="table" data-mobile-responsive="true">
                                <thead>
                                    <tr>
                                        <th class="bs-checkbox " style="width: 36px; " data-field="state" tabindex="0"><div class=" "><input name="btSelectAll" type="checkbox" value="0"></div><div class="fht-cell"></div></th>
                                        <th>ID</th>
										<th>文章类型</th>
										<th>标题</th>
                                        <th>副标题</th>
                                        <th class="col-sm-4">简介</th>
                                        <th>状态</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody id="datalist" >
                            		<?php echo $datalist["html"]; ?>
                            	</tbody>
                            </table>
                            <div id="page" class="col-sm-12 text-right"><?php echo $datalist["page"]; ?></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Panel Basic -->
    </div>
    
    <script type="text/javascript">
    	function querysubmit(id) {
			//set_querinstyle("btn_query");	//设置查询过程中按钮的显示样式
			if(!id) id = 1;  //设置为1表示为1个非负数，代表分页
    		$.get('/index.php/admin/article/index',{'p':id,'account':$('#account').val()},function(json){
                $("#datalist").empty();
                $("#datalist").html(json.data.html);
                $("#page").html(json.data.page);
            },'json');
		}
		function resetuserpassword(id){
        	if (id){
        		var inputValue = id;
        	}else{
        		var inputValue = $("input[type='checkbox']:checked").val();
        	}
        	if ($("#page .active span").html()){
        		var page = $("#page .active span").html().replace(/\D+/g,"")
        	}
        	if (inputValue == undefined){
        		alert("请选择用户帐户");
        		return;
        	} else {
        		if (window.confirm('确实要重置用户密码吗？')) {
        			$.post('/index.php/admin/article/resetuserpassword',{'uid':inputValue},function(json){
    					if(json.code == 0){
    						alert(json.msg);
    						location.reload();
    					} else {
    						alert(json.msg);
    					}
    				},'json')
    			}
        	}
        }
        function publish(id,status){
            $.post('/index.php/admin/article/publish',{id:id,status:status},function(json){
                alert(json.msg);
                if (json.code == 0) {
                    window.location.href = '/index.php/admin/article/index';
                }
            },'json')
        }
	</script> 
</body>
<script src="/public/static/js/content.min.js?v=1.0.0"></script>
<script src="/public/static/js/plugins/staps/jquery.steps.min.js"></script>
<script src="/public/static/js/plugins/validate/jquery.validate.min.js"></script>
<script src="/public/static/js/plugins/validate/messages_zh.min.js"></script>
<script src="/public/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="/public/static/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="/public/static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="/public/static/js/demo/bootstrap-table-demo.min.js"></script>
<script src="/public/static/js/plugins/peity/jquery.peity.min.js"></script>
<script src="/public/static/js/demo/peity-demo.min.js"></script>

<script src="/public/static/js/plugins/layer/laydate/laydate.js"></script>
<script src="/public/static/js/Validform_v5.3.2_min.js"></script>

<script type="text/javascript" src="/public/static/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="/public/static/js/ueditor/ueditor.all.min.js"></script>

<!-- 基础公众js函数 -->
<script type="text/javascript">
	//表单检查
	$(".form-horizontal").Validform();
	//实例化百度编辑器
	var ue = UE.getEditor('container');
	//日期选择器
	$(function(){  
        var start = {  
            elem: '#start', //选择ID为START的input  
            format: 'YYYY/MM/DD hh:mm:ss', //自动生成的时间格式  
            min: '1900-01-01 0:0:0', //设定最小日期为当前日期-laydate.now()
            max: '2099-06-16 23:59:59', //最大日期  
            istime: true, //必须填入时间  
            istoday: false,  //是否是当天  
            start: laydate.now(0,"YYYY/MM/DD hh:mm:ss"),  //设置开始时间为当前时间  
            choose: function(datas){  
                 end.min = datas; //开始日选好后，重置结束日的最小日期  
                 end.start = datas //将结束日的初始值设定为开始日  
            }  
        };  
        var end = {  
            elem: '#end',  
            format: 'YYYY/MM/DD hh:mm:ss',  
            min: '1900-01-01 0:0:0',  
            max: '2099-06-16 23:59:59',  
            istime: true,  
            istoday: false,  
            start: laydate.now(0,"YYYY/MM/DD hh:mm:ss"),  
            choose: function(datas){  
                start.max = datas; //结束日选好后，重置开始日的最大日期  
            }  
        };  
        laydate(start);  
        laydate(end);  
    })
    //排序
    function orderby(type){
        $('#orderby').val(type);
        var orderway = $("#orderway").val();
        if (orderway == 'desc') {
            $("#orderway").val('asc');
        }else{
            $("#orderway").val('desc');
        }
        submitquery(1);
    }
	//单软删除
	function del(id){
		if (confirm('确认删除该条记录？')) {
			$.post('/index.php/admin/article/delete',{id:id},function(json){
				alert(json.msg);
				if (json.code == 0) {
					window.location.href = '/index.php/admin/article/index';
				}
			},'json')
		}
	}
	//单硬删除
	function shiftdelete(id){
		if (confirm('确认删除该条记录,删除后不可恢复？')) {
			$.post('/index.php/admin/article/shiftdelete',{id:id},function(json){
				alert(json.msg);
				if (json.code == 0) {
					window.location.href = '/index.php/admin/article/index';
				}
			},'json')
		}
	}
	//批量软删除
	function multidel(){
		var a = $("input[type='checkbox']:checked");
		var ids = [];
		
		for(i=0;i<a.length;i++){
			ids[i] = $("input[type='checkbox']:checked").eq(i).val()
		}

		if (confirm('确认删除选中记录？')) {
			$.post('/index.php/admin/article/multidelete',{ids:ids},function(json){
				alert(json.msg);
				if (json.code == 0) {
					window.location.href = '/index.php/admin/article/index';
				}
			},'json')
		}
	}
	//上传图片
	function onUploadImgChange(sender,idforimgreview,width,hight){
	    if( !sender.value.match( /.jpg|.jpeg|.gif|.png|.bmp/i ) ){
	        alert('图片格式无效！');
	        return false;
	    }
	    if( sender.files && sender.files[0] ){
	        document.getElementById(idforimgreview).src = window.URL.createObjectURL(sender.files[0]);
	        document.getElementById(idforimgreview).style.width = width;
	        if(hight != "") {
	        	document.getElementById(idforimgreview).style.height = hight;
	        }
	    }
	}
	$(".form-horizontal").Validform();
</script>
=======
<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:56:"F:\git\cyx\www/application/admin\view\Article\index.html";i:1556587898;s:53:"F:\git\cyx\www\application\admin\view\Public\top.html";i:1555645288;s:56:"F:\git\cyx\www\application\admin\view\Public\footer.html";i:1556510548;s:58:"F:\git\cyx\www\application\admin\view\Public\commonjs.html";i:1556510494;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $sysset['storename']; ?>管理后台</title>
    <meta name="keywords" content="<?php echo $sysset['storename']; ?>">
    <meta name="description" content="<?php echo $sysset['storename']; ?>">
    <link href="/public/static/css/bootstrap.min14ed.css" rel="stylesheet">
    <link href="/public/static/css/font-awesome.min93e3.css" rel="stylesheet">
    <link href="/public/static/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="/public/static/css/animate.min.css" rel="stylesheet">
    <link href="/public/static/css/style.min862f.css" rel="stylesheet">
    <link href="/public/static/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="/public/static/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <!-- <link rel="stylesheet" href="/public/static/css/app/select.css"> -->
    <link rel="stylesheet" href="/public/static/css/app/admin.css">
    <script src="/public/static/js/jquery.min.js?v=2.1.4"></script>
    <script src="/public/static/js/bootstrap.min.js?v=3.3.6"></script>
</head>
<body class="gray-bg">

    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox float-e-margins">
            <div class="ibox-title col-sm-12">
                <div class="col-sm-6"><h3>文章列表</h3></div>
                <div class="col-sm-6 text-right">
                    <a href="/index.php/admin/article/add"><button class="btn btn-primary">新增</button></a>
	                <!-- <a href="javascript:multidel()"><button class="btn btn-primary">批量删除</button></a> -->
				</div>
                <div style="clear:both;height:10px"></div>
                <!-- 搜索栏 start -->
                <div>
                    <form action="/index.php/admin/article/importExcel" method="get" id="queryForm">
                        <div class="col-sm-12">
                            <!-- <div class="col-sm-2" style="padding-right: 5px"><input type="text" id="start" name="start" class="form-control" placeholder="起始时间"/></div>
                            <div class="col-sm-2" style="padding-left: 5px"><input type="text" id="end" name="end" class="form-control" placeholder="结束时间"/></div> -->
                            <div class="col-sm-2"><input type="text" name="name" id="name" class="form-control" placeholder="文章名称"/></div>
                            <div class="col-sm-2 text-right">
                                <div class="col-sm-3"><input type="button" onclick="submitquery(1)" id="submitBtn" value="查询" class="btn  btn-outline btn-default"></div>
                                <div class="col-sm-3" id="loading" style="margin-top:5px;"></div>
                            </div>
                            <!-- <div class="col-sm-2">
                                <a href=""><button class="btn btn-primary" type="submit">导出</button></a>
                            </div> -->
                        </div>
                    </form>
                </div>
                <!-- 搜索栏 end -->
                <div style="clear:both;"></div>
			</div>
            <div class="ibox-content">
                <div class="row row-lg">
                    <div class="col-sm-12">
                        <h4 class="example-title"></h4>
                        <div class="example">
                            <table data-toggle="table" data-mobile-responsive="true">
                                <thead>
                                    <tr>
                                        <th class="bs-checkbox " style="width: 36px; " data-field="state" tabindex="0"><div class=" "><input name="btSelectAll" type="checkbox" value="0"></div><div class="fht-cell"></div></th>
                                        <th>ID</th>
										<th>文章类型</th>
										<th>标题</th>
                                        <th>副标题</th>
                                        <th class="col-sm-4">简介</th>
                                        <th>状态</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody id="datalist" >
                            		<?php echo $datalist["html"]; ?>
                            	</tbody>
                            </table>
                            <div id="page" class="col-sm-12 text-right"><?php echo $datalist["page"]; ?></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Panel Basic -->
    </div>
    
    <script type="text/javascript">
    	function querysubmit(id) {
			//set_querinstyle("btn_query");	//设置查询过程中按钮的显示样式
			if(!id) id = 1;  //设置为1表示为1个非负数，代表分页
    		$.get('/index.php/admin/article/index',{'p':id,'name':$('#name').val()},function(json){
                $("#datalist").empty();
                $("#datalist").html(json.data.html);
                $("#page").html(json.data.page);
            },'json');
		}
		function resetuserpassword(id){
        	if (id){
        		var inputValue = id;
        	}else{
        		var inputValue = $("input[type='checkbox']:checked").val();
        	}
        	if ($("#page .active span").html()){
        		var page = $("#page .active span").html().replace(/\D+/g,"")
        	}
        	if (inputValue == undefined){
        		alert("请选择用户帐户");
        		return;
        	} else {
        		if (window.confirm('确实要重置用户密码吗？')) {
        			$.post('/index.php/admin/article/resetuserpassword',{'uid':inputValue},function(json){
    					if(json.code == 0){
    						alert(json.msg);
    						location.reload();
    					} else {
    						alert(json.msg);
    					}
    				},'json')
    			}
        	}
        }
        function publish(id,status){
            $.post('/index.php/admin/article/publish',{id:id,status:status},function(json){
                // alert(json.msg);
                if (json.code == 0) {
                    window.location.href = '/index.php/admin/article/index';
                }
            },'json')
        }
	</script> 
</body>
<script src="/public/static/js/content.min.js?v=1.0.0"></script>
<script src="/public/static/js/plugins/staps/jquery.steps.min.js"></script>
<script src="/public/static/js/plugins/validate/jquery.validate.min.js"></script>
<script src="/public/static/js/plugins/validate/messages_zh.min.js"></script>
<script src="/public/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="/public/static/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="/public/static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="/public/static/js/demo/bootstrap-table-demo.min.js"></script>
<script src="/public/static/js/plugins/peity/jquery.peity.min.js"></script>
<script src="/public/static/js/demo/peity-demo.min.js"></script>

<script src="/public/static/js/plugins/layer/laydate/laydate.js"></script>
<script src="/public/static/js/Validform_v5.3.2_min.js"></script>

<script type="text/javascript" src="/public/static/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="/public/static/js/ueditor/ueditor.all.min.js"></script>

<!-- 基础公众js函数 -->
<script type="text/javascript">
	//表单检查
	$(".form-horizontal").Validform();
	//实例化百度编辑器
	var ue = UE.getEditor('container');
	//日期选择器
	$(function(){  
        var start = {  
            elem: '#start', //选择ID为START的input  
            format: 'YYYY/MM/DD hh:mm:ss', //自动生成的时间格式  
            min: '1900-01-01 0:0:0', //设定最小日期为当前日期-laydate.now()
            max: '2099-06-16 23:59:59', //最大日期  
            istime: true, //必须填入时间  
            istoday: false,  //是否是当天  
            start: laydate.now(0,"YYYY/MM/DD hh:mm:ss"),  //设置开始时间为当前时间  
            choose: function(datas){  
                 end.min = datas; //开始日选好后，重置结束日的最小日期  
                 end.start = datas //将结束日的初始值设定为开始日  
            }  
        };  
        var end = {  
            elem: '#end',  
            format: 'YYYY/MM/DD hh:mm:ss',  
            min: '1900-01-01 0:0:0',  
            max: '2099-06-16 23:59:59',  
            istime: true,  
            istoday: false,  
            start: laydate.now(0,"YYYY/MM/DD hh:mm:ss"),  
            choose: function(datas){  
                start.max = datas; //结束日选好后，重置开始日的最大日期  
            }  
        };  
        laydate(start);  
        laydate(end);  
    })
    //排序
    function orderby(type){
        $('#orderby').val(type);
        var orderway = $("#orderway").val();
        if (orderway == 'desc') {
            $("#orderway").val('asc');
        }else{
            $("#orderway").val('desc');
        }
        submitquery(1);
    }
	//单软删除
	function del(id){
		if (confirm('确认删除该条记录？')) {
			$.post('/index.php/admin/article/delete',{id:id},function(json){
				alert(json.msg);
				if (json.code == 0) {
					window.location.href = '/index.php/admin/article/index';
				}
			},'json')
		}
	}
	//单硬删除
	function shiftdelete(id){
		if (confirm('确认删除该条记录,删除后不可恢复？')) {
			$.post('/index.php/admin/article/shiftdelete',{id:id},function(json){
				alert(json.msg);
				if (json.code == 0) {
					window.location.href = '/index.php/admin/article/index';
				}
			},'json')
		}
	}
	//批量软删除
	function multidel(){
		var a = $("input[type='checkbox']:checked");
		var ids = [];
		
		for(i=0;i<a.length;i++){
			ids[i] = $("input[type='checkbox']:checked").eq(i).val()
		}

		if (confirm('确认删除选中记录？')) {
			$.post('/index.php/admin/article/multidelete',{ids:ids},function(json){
				alert(json.msg);
				if (json.code == 0) {
					window.location.href = '/index.php/admin/article/index';
				}
			},'json')
		}
	}
	//上传图片
	function onUploadImgChange(sender,idforimgreview,width,hight){
	    if( !sender.value.match( /.jpg|.jpeg|.gif|.png|.bmp/i ) ){
	        alert('图片格式无效！');
	        return false;
	    }
	    if( sender.files && sender.files[0] ){
	        document.getElementById(idforimgreview).src = window.URL.createObjectURL(sender.files[0]);
	        document.getElementById(idforimgreview).style.width = width;
	        if(hight != "") {
	        	document.getElementById(idforimgreview).style.height = hight;
	        }
	    }
	}
	$(".form-horizontal").Validform();
</script>
>>>>>>> 02cab624af52addcfb24e6fa93b4ca3cca5a5b46:cyx/www/runtime/temp/678038c62d27173d6fcc286e7aa807d9.php
</html>