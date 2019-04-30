<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:56:"F:\git\cyx\www/application/admin\view\Aboutus\index.html";i:1556530319;s:53:"F:\git\cyx\www\application\admin\view\Public\top.html";i:1555645288;s:56:"F:\git\cyx\www\application\admin\view\Public\footer.html";i:1556510548;s:58:"F:\git\cyx\www\application\admin\view\Public\commonjs.html";i:1556510494;}*/ ?>
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
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title col-sm-12">
                        <div class="col-sm-9"><h3>关于我们</h3></div>
					    <div class="col-sm-3 text-right">
						    <a href="/index.php/admin/aboutus/index">
						    	<button type="submit" class="btn btn-sm btn-primary">返回上一级</button>
						    </a>
					    </div>
                    </div>
                    <div class="ibox-content"> 
                        <form method="post" class="form-horizontal" action="/index.php/admin/aboutus/update" enctype="multipart/form-data">
                            <div class="form-group">
                                <label class="col-sm-1 control-label">公司简介</label>
                                <div class="col-sm-11">
                                    <script id="container" name="description" type="text/plain" style="width: 100%;height: 260px;"><?php echo $list['description']; ?></script>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label">资质荣誉</label>
                                <div class="col-sm-11" id="commodityimg">
                                    <div><button type="button" class="btn btn-primary" onclick="addpicturebox()">增加一张</button></div>
                                    <?php if(is_array($list['newloginbg']) || $list['newloginbg'] instanceof \think\Collection || $list['newloginbg'] instanceof \think\Paginator): $i = 0; $__LIST__ = $list['newloginbg'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                                        <div class="col-sm-4">
                                            <div style="height:198px;width:198px;padding:10px;padding-top:5px;">
                                                <div class="upload05" style="width:800px;margin-left:0px;">
                                                    <div class="uploadbox05" style="margin-top:26px;margin-bottom:1px;">
                                                        <img id="picture<?php echo $v['id']; ?>" src="<?php echo $uploadurl; ?><?php echo $v['picture']; ?>" style="width:240px;height:200px;">
                                                        <input type="hidden" name="picture<?php echo $v['id']; ?>" value="<?php echo $v['picture']; ?>">
                                                        <div class="uploadbuttombox05">
                                                            <div><input type="file" class="uploadinput05" style="width:240px;height:200px;margin-top:-80px;" 
                                                            name="picture<?php echo $v['id']; ?>" onchange="return onUploadImgChange(this,'picture<?php echo $v['id']; ?>','240px','200px')"/></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id='p_<?php echo $v['id']; ?>' class="clear" style="height:35px;text-align:center;line-height:55px;width:240px;">点击图片上传图片 <a href="javascript:delPicture('<?php echo $v['id']; ?>')">删除</a></div>
                                        </div>
                                    <?php endforeach; endif; else: echo "" ;endif; ?>
                                </div>
                            </div>

                            <input type="hidden" name="id" value="<?php echo $list['id']; ?>">
                            <div class="form-group">
                                <div class="col-sm-12 col-sm-offset-10">
                                    <button class="btn btn-primary" type="submit">保存</button>
                                    <button class="btn btn-white" type="reset">重置</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var number = parseInt("<?php echo $number; ?>");
        function addpicturebox(){
            var str = '<div class="col-sm-4"><div style="height:198px;width:198px;padding:10px;padding-top:5px;"><div class="upload05" style="width:800px;margin-left:0px;"><div class="uploadbox05" style="margin-top:26px;margin-bottom:1px;border:1px solid #e3e3e3;"><img id="picture'+number+'" src="" style="width:240px;height:200px;"><div class="uploadbuttombox05"><div><input type="file" class="uploadinput05" style="width:240px;height:200px;margin-top:-80px;" name="picture'+number+'" onchange="return onUploadImgChange(this,\'picture'+number+'\',\'240px\',\'200px\')"/></div></div></div></div></div><div id="np_'+number+'" class="clear" style="height:35px;text-align:center;line-height:55px;width:240px;">点击图片上传图片 <a href="javascript:delnewPicture(\''+number+'\')">删除</a></div></div>';
            $("#commodityimg").append(str);
            number++;
        }
        function delPicture(id){
            $("#p_"+id).parent().remove();
        }
        function delnewPicture(id){
            $("#np_"+id).parent().remove();
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
			$.post('/index.php/admin/aboutus/delete',{id:id},function(json){
				alert(json.msg);
				if (json.code == 0) {
					window.location.href = '/index.php/admin/aboutus/index';
				}
			},'json')
		}
	}
	//单硬删除
	function shiftdelete(id){
		if (confirm('确认删除该条记录,删除后不可恢复？')) {
			$.post('/index.php/admin/aboutus/shiftdelete',{id:id},function(json){
				alert(json.msg);
				if (json.code == 0) {
					window.location.href = '/index.php/admin/aboutus/index';
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
			$.post('/index.php/admin/aboutus/multidelete',{ids:ids},function(json){
				alert(json.msg);
				if (json.code == 0) {
					window.location.href = '/index.php/admin/aboutus/index';
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