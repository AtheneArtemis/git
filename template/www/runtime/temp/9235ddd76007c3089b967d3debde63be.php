<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:58:"D:\wamp\wwwroot\www/application/admin\view\Role\index.html";i:1555550519;s:58:"D:\wamp\wwwroot\www\application\admin\view\Public\top.html";i:1555555508;s:61:"D:\wamp\wwwroot\www\application\admin\view\Public\footer.html";i:1555558969;s:63:"D:\wamp\wwwroot\www\application\admin\view\Public\commonjs.html";i:1555575255;}*/ ?>
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
                <div class="col-sm-6"><h3>角色管理</h3></div>
                <div class="col-sm-6 text-right">
					<!-- 
					<a href="javascript:adduser()"><button class="btn btn-primary">添加用户</button></a>
					-->
					<a href="/index.php/admin/role/add"><button class="btn btn-primary">新增</button></a>
					<!-- <a href="javascript:edit('<?php echo url('edit','',''); ?>')"><button class="btn btn-primary">修改</button></a> -->
					<a href="javascript:dele('<?php echo url('shiftdelete'); ?>')"><button class="btn btn-primary">删除</button></a>
				</div>
                <div style="clear:both;height:10px"></div>
			</div>
			<!-- 搜索栏 end -->
            <div class="ibox-content">
                <div class="row row-lg">
                    <div class="col-sm-12">
                        <h4 class="example-title"></h4>
                        <div class="example">
                            <table data-toggle="table" data-mobile-responsive="true">
                                <thead>
                                    <tr>
                                        <th class="bs-checkbox " style="width: 36px; " data-field="state" tabindex="0"><div class=""><input name="btSelectAll" type="checkbox"></div><div class="fht-cell"></div></th>
										<th>序号</th>
										<th>角色名称</th>
										<th>角色描述</th>
										<th>开启状态</th>
										<th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
									<?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
									<tr>
										<td class="bs-checkbox"><input data-index="3" name="btSelectItem" type="checkbox" value="<?php echo $v['id']; ?>"></td>
										<td><?php echo $v['number']; ?></td>
										<td><?php echo $v['name']; ?></td>
										<td><?php echo $v['remark']; ?></td>
										<td><?php if($v['status'] == 1): ?>开启<?php else: ?>关闭<?php endif; ?></td>
										<td>
											<a href="<?php echo url('Role/access','',''); ?>/roleid/<?php echo $v['id']; ?>">授权</a>
											<!-- &nbsp;|&nbsp;
											<a href="/index.php/admin/role/detail/id/<?php echo $v['id']; ?>">用户列表</a> -->
										</td>
									</tr>
									<?php endforeach; endif; else: echo "" ;endif; ?>
								</tbody>
                            </table>
                            <div id="page" class="col-sm-12 text-right"><?php echo $page; ?></div>
                            <div><input type="hidden" id="orderSequence" name="" value="<?php echo $ordersequence; ?>"/></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Panel Basic -->
    </div>
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
			$.post('/index.php/admin/role/delete',{id:id},function(json){
				alert(json.msg);
				if (json.code == 0) {
					window.location.href = '/index.php/admin/role/index';
				}
			},'json')
		}
	}
	//单硬删除
	function shiftdelete(id){
		if (confirm('确认删除该条记录,删除后不可恢复？')) {
			$.post('/index.php/admin/role/shiftdelete',{id:id},function(json){
				alert(json.msg);
				if (json.code == 0) {
					window.location.href = '/index.php/admin/role/index';
				}
			},'json')
		}
	}
	//批量软删除
	function multidel(){
		if (confirm('确认删除选中记录？')) {
			$.post('/index.php/admin/role/multidelete',{ids:ids},function(json){
				alert(json.msg);
				if (json.code == 0) {
					window.location.href = '/index.php/admin/role/index';
				}
			},'json')
		}
	}


</script>
</html>
