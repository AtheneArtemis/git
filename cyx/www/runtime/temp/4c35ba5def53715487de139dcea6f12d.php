<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:82:"D:\phpStudy\PHPTutorial\WWW\git\cyx\www/application/admin\view\Customer\index.html";i:1556531645;s:78:"D:\phpStudy\PHPTutorial\WWW\git\cyx\www\application\admin\view\Public\top.html";i:1556531645;s:81:"D:\phpStudy\PHPTutorial\WWW\git\cyx\www\application\admin\view\Public\footer.html";i:1556531645;s:83:"D:\phpStudy\PHPTutorial\WWW\git\cyx\www\application\admin\view\Public\commonjs.html";i:1556531645;}*/ ?>
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
                <div class="col-sm-6"><h3>经典客户</h3></div>
                <div class="col-sm-6 text-right">
                    <a href="/index.php/admin/customer/add"><button class="btn btn-primary">新增</button></a>
				</div>
                <div style="clear:both;height:10px"></div>
                
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
                                        <th>分类</th>
										<th>名称</th>
                                        <th>图标</th>
										<th class="col-sm-4">描述</th>
                                        <th>排序</th>
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
    		$.get('/index.php/admin/customer/index',{'p':id,'account':$('#account').val()},function(json){
                $("#datalist").empty();
                $("#datalist").html(json.data.html);
                $("#page").html(json.data.page);
            },'json');
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
			$.post('/index.php/admin/customer/delete',{id:id},function(json){
				alert(json.msg);
				if (json.code == 0) {
					window.location.href = '/index.php/admin/customer/index';
				}
			},'json')
		}
	}
	//单硬删除
	function shiftdelete(id){
		if (confirm('确认删除该条记录,删除后不可恢复？')) {
			$.post('/index.php/admin/customer/shiftdelete',{id:id},function(json){
				alert(json.msg);
				if (json.code == 0) {
					window.location.href = '/index.php/admin/customer/index';
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
			$.post('/index.php/admin/customer/multidelete',{ids:ids},function(json){
				alert(json.msg);
				if (json.code == 0) {
					window.location.href = '/index.php/admin/customer/index';
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
</html>