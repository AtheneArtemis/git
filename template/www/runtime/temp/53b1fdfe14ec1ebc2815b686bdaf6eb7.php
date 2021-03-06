<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:58:"D:\wamp\wwwroot\www/application/admin\view\User\index.html";i:1555636103;s:58:"D:\wamp\wwwroot\www\application\admin\view\Public\top.html";i:1555555508;s:61:"D:\wamp\wwwroot\www\application\admin\view\Public\footer.html";i:1555558969;s:63:"D:\wamp\wwwroot\www\application\admin\view\Public\commonjs.html";i:1555636176;}*/ ?>
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
                <div class="col-sm-6"><h3>用户信息</h3></div>
                <div class="col-sm-6 text-right">
                    <a href="/index.php/admin/user/add"><button class="btn btn-primary">新增</button></a>
	                <a href="javascript:multidel()"><button class="btn btn-primary">批量删除</button></a>
	                <button type="button" class="btn btn-primary" onclick="resetuserpassword()">重置密码</button>
				</div>
                <div style="clear:both;height:10px"></div>
                <!-- 搜索栏 start -->
                <div>
                    <form action="/index.php/admin/user/importExcel" method="get" id="queryForm">
                        <div class="col-sm-12">
                            <div class="col-sm-2" style="padding-right: 5px"><input type="text" id="start" name="start" class="form-control" placeholder="起始时间"/></div>
                            <div class="col-sm-2" style="padding-left: 5px"><input type="text" id="end" name="end" class="form-control" placeholder="结束时间"/></div>
                            <div class="col-sm-2"><input type="text" name="nickname" id="nickname" class="form-control" placeholder="用户昵称"/></div>
                            <div class="col-sm-2 text-right"><!--  -->
                                <div class="col-sm-3"><input type="button" onclick="submitquery(1)" id="submitBtn" value="查询" class="btn  btn-outline btn-default"></div>
                                <div class="col-sm-3" id="loading" style="margin-top:5px;"></div>
                            </div>
                            <input type="hidden" name="orderby" id="orderby" value="id">
                            <input type="hidden" name="orderway" id="orderway" value="asc">
                            <div class="col-sm-2">
                                <a href=""><button class="btn btn-primary" type="submit">导出</button></a>
                            </div>
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
										<th>用户帐号</th>
										<th>用户昵称</th>
                                        <th>用户组别</th>
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
    		$.get('/index.php/admin/user/index',{'p':id,'account':$('#account').val()},function(json){
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
        			$.post('/index.php/admin/user/resetuserpassword',{'uid':inputValue},function(json){
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
<!-- 基础公众js函数 -->
<script type="text/javascript">
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
			$.post('/index.php/admin/user/delete',{id:id},function(json){
				alert(json.msg);
				if (json.code == 0) {
					window.location.href = '/index.php/admin/user/index';
				}
			},'json')
		}
	}
	//单硬删除
	function shiftdelete(id){
		if (confirm('确认删除该条记录,删除后不可恢复？')) {
			$.post('/index.php/admin/user/shiftdelete',{id:id},function(json){
				alert(json.msg);
				if (json.code == 0) {
					window.location.href = '/index.php/admin/user/index';
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
			$.post('/index.php/admin/user/multidelete',{ids:ids},function(json){
				alert(json.msg);
				if (json.code == 0) {
					window.location.href = '/index.php/admin/user/index';
				}
			},'json')
		}
	}


</script>
</html>