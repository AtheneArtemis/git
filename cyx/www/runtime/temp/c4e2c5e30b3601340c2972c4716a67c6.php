<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:80:"D:\phpStudy\PHPTutorial\WWW\git\cyx\www/application/admin\view\Article\edit.html";i:1556595884;s:78:"D:\phpStudy\PHPTutorial\WWW\git\cyx\www\application\admin\view\Public\top.html";i:1556531645;s:81:"D:\phpStudy\PHPTutorial\WWW\git\cyx\www\application\admin\view\Public\footer.html";i:1556531645;s:83:"D:\phpStudy\PHPTutorial\WWW\git\cyx\www\application\admin\view\Public\commonjs.html";i:1556531645;}*/ ?>
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
                        <?php if($list['id'] > 0): ?>
                            <div class="col-sm-9"><h3>编辑文章</h3></div>
                        <?php else: ?>
                            <div class="col-sm-9"><h3>新增文章</h3></div>
                        <?php endif; ?>
					    <div class="col-sm-3 text-right">
						    <a href="/index.php/admin/article/index">
						    	<button type="submit" class="btn btn-sm btn-primary">返回上一级</button>
						    </a>
					    </div>
                    </div>
                    <div class="ibox-content"> 
                        <?php if($list['id'] > 0): ?>
                            <form method="post" class="form-horizontal" action="/index.php/admin/article/update" enctype="multipart/form-data">
                        <?php else: ?>
                            <form method="post" class="form-horizontal" action="/index.php/admin/article/insert" enctype="multipart/form-data">
                        <?php endif; ?>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">文章类型</label>
                                <div class="col-sm-4">
                                    <select name="" class="form-control" id="group" onchange="changeGroup()">
                                        <option value="-10000">请选择文章分组</option>
                                        <?php if(is_array($grouptype) || $grouptype instanceof \think\Collection || $grouptype instanceof \think\Paginator): $i = 0; $__LIST__ = $grouptype;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                                            <option value="<?php echo $v['id']; ?>" <?php if($list['articletype_id'] == $v['id']): ?>selected<?php endif; ?> ><?php echo $v['title']; ?></option>
                                        <?php endforeach; endif; else: echo "" ;endif; ?>
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <select name="" class="form-control" id="parent" onchange="changeParent()">
                                        <option value="-10000">请选择文章一级分类</option>
                                        <?php if(is_array($parenttype) || $parenttype instanceof \think\Collection || $parenttype instanceof \think\Paginator): $i = 0; $__LIST__ = $parenttype;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                                            <option value="<?php echo $v['id']; ?>" <?php if($list['articletype_id'] == $v['id']): ?>selected<?php endif; ?> ><?php echo $v['title']; ?></option>
                                        <?php endforeach; endif; else: echo "" ;endif; ?>
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <select name="" class="form-control" id="sub" onchange="changeSub()">
                                        <option value="-10000">请选择文章二级分类</option>
                                        <?php if(is_array($subtype) || $subtype instanceof \think\Collection || $subtype instanceof \think\Paginator): $i = 0; $__LIST__ = $subtype;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                                            <option value="<?php echo $v['id']; ?>" <?php if($list['articletype_id'] == $v['id']): ?>selected<?php endif; ?> ><?php echo $v['title']; ?></option>
                                        <?php endforeach; endif; else: echo "" ;endif; ?>
                                    </select>
                                </div>
                                <input type="hidden" name="articletype_id" value="<?php echo $list['articletype_id']; ?>" datatype="*1-10" id="articletypeId">
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">标题</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="title" value="<?php echo $list['title']; ?>">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">副标题</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="secondtitle" value="<?php echo $list['secondtitle']; ?>">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">来源</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="comefrom" value="<?php echo $list['comefrom']; ?>">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">作者</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="author" value="<?php echo $list['author']; ?>">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">文章简介</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="intro" value="<?php echo $list['intro']; ?>">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">缩略图</label>
                                <div class="col-sm-10">
                                    <div style="height:198px;width:198px;padding:10px;padding-top:5px;">
                                        <div class="upload05" style="width:800px;margin-left:0px;">
                                            <div class="uploadbox05" style="margin-top:26px;margin-bottom:1px;">
                                                <img id="uploadmainpicture1" src="<?php echo $uploadurl; ?><?php echo $list['thumbpicture']; ?>" style="width:240px;height:200px;">
                                                <div class="uploadbuttombox05">
                                                    <div><input type="file" class="uploadinput05" style="width:240px;height:200px;margin-top:-80px;" 
                                                    name="thumbpicture" onchange="return onUploadImgChange(this,'uploadmainpicture1','240px','200px')"/></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clear" style="height:35px;text-align:center;line-height:55px;width:240px;">点击图片上传缩略图</div>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">正文</label>
                                <div class="col-sm-10">
                                    <script id="container" name="content" type="text/plain" style="width: 100%;height: 260px;"><?php echo $list['content']; ?></script>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <input type="hidden" name="id" value="<?php echo $list['id']; ?>">
                            <div class="form-group">
                                <div class="col-sm-12 text-right">
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
        function changeGroup(){
            var group = $("#group option:selected").val();
            $.post("/index.php/admin/article/getArticleType",{id:group,type:'group'},function(json){
                $("#parent").empty();
                $("#parent").append(json.phtml);
                $("#sub").empty();
                $("#sub").append(json.shtml);
            },'json')
        }
        function changeParent(){
            var parent = $("#group option:selected").val();
            $.post("/index.php/admin/article/getArticleType",{id:parent,type:'parent'},function(json){
                $("#sub").empty();
                $("#sub").append(json.shtml);
                $("#articletypeId").val(parent);
            },'json')
        }
        function changeSub(){
            var sub = $("#sub option:selected").val();
            $("#articletypeId").val(sub);
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
</html>