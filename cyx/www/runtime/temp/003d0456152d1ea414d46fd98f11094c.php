<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:59:"F:\git\cyx\www/application/admin\view\Articletype\edit.html";i:1556587375;s:53:"F:\git\cyx\www\application\admin\view\Public\top.html";i:1555645288;s:56:"F:\git\cyx\www\application\admin\view\Public\footer.html";i:1556510548;s:58:"F:\git\cyx\www\application\admin\view\Public\commonjs.html";i:1556510494;}*/ ?>
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

<style type="text/css">
    .cat-type{display: none;}
</style>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title col-sm-12">
                        <?php if($list['id'] > 0): ?>
                            <div class="col-sm-9"><h3>编辑文章类型</h3></div>
                        <?php else: ?>
                            <div class="col-sm-9"><h3>新增文章类型</h3></div>
                        <?php endif; ?>
                        <div class="col-sm-3 text-right">
                            <a href="/index.php/admin/articletype/index">
                                <button type="submit" class="btn btn-sm btn-primary">返回上一级</button>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content"> 
                        <?php if($list['id'] > 0): ?>
                            <form method="post" class="form-horizontal" action="/index.php/admin/articletype/update">
                        <?php else: ?>
                            <form method="post" class="form-horizontal" action="/index.php/admin/articletype/insert">
                        <?php endif; ?>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">属性</label>
                                <div class="col-sm-10">
                                    <select name="type" class="form-control" id="cat-type" onchange="changeType()">
                                        <!-- <option value="group" <?php if($list['type'] == group): ?>selected<?php endif; ?> >分组</option> -->
                                        <option value="cat" <?php if($list['type'] == cat): ?>selected<?php endif; ?> >分类</option>

                                        <option value="group" <?php if($list['type'] == group): ?>selected<?php endif; ?> >分组</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="name" value="<?php echo $list['name']; ?>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">标题</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="title" value="<?php echo $list['title']; ?>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">描述</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="intro" value="<?php echo $list['intro']; ?>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">排序</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="sort" value="<?php echo $list['sort']; ?>">
                                </div>
                            </div>
                            <div class="form-group cat-type">
                                <label class="col-sm-2 control-label">分组</label>
                                <div class="col-sm-10">
                                    <select name="gid" class="form-control" id="cat-group" onchange="changeGroup()">
                                        <option value="0">无分组</option>
                                        <?php if(is_array($grouplist) || $grouplist instanceof \think\Collection || $grouplist instanceof \think\Paginator): $i = 0; $__LIST__ = $grouplist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                                            <option value="<?php echo $v['id']; ?>" <?php if($list['gid'] == $v['id']): ?>selected<?php endif; ?> ><?php echo $v['title']; ?></option>
                                        <?php endforeach; endif; else: echo "" ;endif; ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group cat-type">
                                <label class="col-sm-2 control-label">上级</label>
                                <div class="col-sm-10">
                                    <select name="pid" class="form-control" id="cat-parent" onchange="changeParent()">
                                        <option value="-10000">无上级</option>
                                        <?php if(is_array($parentlist) || $parentlist instanceof \think\Collection || $parentlist instanceof \think\Paginator): $i = 0; $__LIST__ = $parentlist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                                            <option value="<?php echo $v['id']; ?>" <?php if($list['pid'] == $v['id']): ?>selected<?php endif; ?> ><?php echo $v['title']; ?></option>
                                        <?php endforeach; endif; else: echo "" ;endif; ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group cat-type">
                                <label class="col-sm-2 control-label">等级</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="level" id="level" value="<?php echo $list['level']; ?>" readonly="readonly">
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
        /*页面初始化*/
        changeType(); //属性栏
        /*页面初始化 结束*/
        //属性切换
        function changeType(){
            var catType = $("#cat-type option:selected").val();
            if (catType == 'cat') {
                $(".cat-type").show();
            }else{
                $(".cat-type").hide();
            }
        }
        //分组切换
        function changeGroup(){
            var gid = $("#cat-group option:selected").val();
            $.post('/index.php/admin/articletype/getArticleType',{gid:gid},function(json){
                $("#cat-parent").empty();
                $("#cat-parent").append(json);
                $("#level").val(1);
            },'json')
        }
        //上级切换
        function changeParent(){
            var pid = $("#cat-parent option:selected").val();
            if (pid != -10000) {
                $("#level").val(2);
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
			$.post('/index.php/admin/articletype/delete',{id:id},function(json){
				alert(json.msg);
				if (json.code == 0) {
					window.location.href = '/index.php/admin/articletype/index';
				}
			},'json')
		}
	}
	//单硬删除
	function shiftdelete(id){
		if (confirm('确认删除该条记录,删除后不可恢复？')) {
			$.post('/index.php/admin/articletype/shiftdelete',{id:id},function(json){
				alert(json.msg);
				if (json.code == 0) {
					window.location.href = '/index.php/admin/articletype/index';
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
			$.post('/index.php/admin/articletype/multidelete',{ids:ids},function(json){
				alert(json.msg);
				if (json.code == 0) {
					window.location.href = '/index.php/admin/articletype/index';
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