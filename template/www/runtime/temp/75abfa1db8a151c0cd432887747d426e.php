<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:59:"D:\wamp\wwwroot\www/application/admin\view\Role\access.html";i:1555550434;}*/ ?>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>授权管理</title>
		<meta name="Generator" content="EditPlus®">
		<meta name="Author" content="">
		<meta name="Keywords" content="">
		<meta name="Description" content="">
		<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
		<link href="/public/static/css/bootstrap.min14ed.css" rel="stylesheet">
	    <link href="/public/static/css/font-awesome.min93e3.css" rel="stylesheet">
	    <link href="/public/static/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	    <link href="/public/static/css/animate.min.css" rel="stylesheet">
	    <link href="/public/static/css/style.min862f.css" rel="stylesheet">
		<link rel="stylesheet" href="/public/static/css/app/admin.css" />
	</head>
	<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox float-e-margins">
            <div class="ibox-title col-sm-12">
                <div class="col-sm-9"><h3>为&nbsp;<?php echo $rlist['name']; ?>&nbsp;授权</h3></div>
			    <div class="col-sm-3 text-right">
			    <form action="<?php echo url('Role/index','',''); ?>" method="post">
			    	<input type="hidden" value="<?php echo $pagenumber; ?>" name="pagenumber"/>
			    	<button type="submit" class="btn btn-primary btn-sm">返回上一级</button>
			    </form>
			    </div>
			</div>
			<!-- 搜索栏 end -->
            <div class="ibox-content">
                <div class="row row-lg">
                    <div class="col-sm-12">
                        <h4 class="example-title"></h4>
                        <form method=post id="form1" action="">
                        <div id="moduleframe">
                        	<?php if(is_array($module) || $module instanceof \think\Collection || $module instanceof \think\Paginator): $i = 0; $__LIST__ = $module;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$module): $mod = ($i % 2 );++$i;?>
                        		<div class="module" style="font-size:18px;line-height:50px;"><?php echo $module['title']; ?></div>
                        		<input type="hidden" name="module" id="module" class="module" value="<?php echo $module['id']; ?>"/>
                        		<div id="groupframe">
								<?php if(is_array($module['group']) || $module['group'] instanceof \think\Collection || $module['group'] instanceof \think\Paginator): $i = 0; $__LIST__ = $module['group'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$group): $mod = ($i % 2 );++$i;?>
									<div>
										<div class="group">
											<?php echo $group['title']; ?><input type="checkbox" style="margin-left:20px;" name="group" id="group_<?php echo $group['id']; ?>" onclick="selectallofgroup('<?php echo $group['id']; ?>')" value="<?php echo $group['id']; ?>" <?php if($group['Rbacstatus'] == 1): ?>checked<?php endif; ?> /><span style="font-size:16px;">全选</span>
										</div>
										<div class="controllerframe float-div">
											<?php if(is_array($group['controller']) || $group['controller'] instanceof \think\Collection || $group['controller'] instanceof \think\Paginator): $i = 0; $__LIST__ = $group['controller'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$c): $mod = ($i % 2 );++$i;?>
												<div>
													<div class="controller">
														<?php echo $c['title']; ?><input type="checkbox" style="margin-left:20px;" name="controller" class="<?php echo $group['id']; ?>" id="<?php echo $c['id']; ?>" onclick="selectallofcontroller('<?php echo $group['id']; ?>','<?php echo $c['id']; ?>')" value="<?php echo $c['id']; ?>-2" <?php if($c['Rbacstatus'] == 1): ?>checked<?php endif; ?>/><span style="font-size:14px;">全选</span>
													</div>
													<div style="clear:both;"></div>
													<div class="actionframe">
														<?php if(is_array($c['action']) || $c['action'] instanceof \think\Collection || $c['action'] instanceof \think\Paginator): $i = 0; $__LIST__ = $c['action'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$a): $mod = ($i % 2 );++$i;?>
															<div class="action">
																<input type="checkbox" name="action" class="<?php echo $group['id']; ?>" id="action_<?php echo $c['id']; ?>" value="<?php echo $a['id']; ?>-3" onclick="selectP('<?php echo $group['id']; ?>','<?php echo $c['id']; ?>')" <?php if($a['Rbacstatus'] == 1): ?>checked<?php endif; ?>/><?php echo $a['title']; ?>
															</div>
														<?php endforeach; endif; else: echo "" ;endif; ?>
														<div style="clear:both;"></div>
													</div>
												</div>
												<div style="clear:both;"></div>
											<?php endforeach; endif; else: echo "" ;endif; ?>
										</div>
									</div>
									<div style="clear:both;"></div>
								<?php endforeach; endif; else: echo "" ;endif; ?>
							</div>
                        	<?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
						<div style="height:30px;"></div>
						<input type="hidden" id="roleid" value="<?php echo $roleid; ?>"/>
						<div class="col-md-12">
							<div style="margin:20px 0px;" class="col-md-3">
								<input type="button" value="授权" id="accessBtn" class="btn btn-block btn-primary btn-lg"/>
							</div>
						</div>
						</form>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Panel Basic -->
    </div>
</body>
	<script src="/public/static/js/jquery.min.js"></script>
    <script src="/public/static/js/bootstrap.min.js"></script>
    <script type="text/javascript">
	function selectallofgroup(groupid){
		
		var groupinput = document.getElementById("group_"+groupid);
		var colInputs = $("."+groupid);
		for	(i=0; i < colInputs.length; i++){
			colInputs[i].checked = groupinput.checked;
		}
	}
	function selectallofcontroller(gid,cid){
		
		var cinput = document.getElementById(cid);
		var aInputs = $("."+gid);
		for	(i=0; i < aInputs.length; i++){
			if ($("."+gid).eq(i).attr("id") == 'action_'+cid){
				aInputs[i].checked = cinput.checked;
			}
		}
		if (!($("#group_"+gid).prop('checked'))) {
			$("#group_"+gid).prop('checked','checked')
		}else{
			if ($("#"+cid).parent().parent().parent().find('.controller input:checked').size() == 0) {
				$("#group_"+gid).removeAttr('checked')
			}
		}
	}
	function selectP(gid,cid){
		if (!($("#"+cid).prop('checked'))) {
			$("#"+cid).prop('checked','checked')
		}else{
			if ($("#action_"+cid).parent().parent().find('input:checked').size() == 0) {
				$("#"+cid).removeAttr('checked')
			}
		}
		if (!($("#group_"+gid).prop('checked'))) {
			$("#group_"+gid).prop('checked','checked')
		}else{
			if ($("#group_"+gid).parent().parent().find('input:checked').size() == 1) {
				$("#group_"+gid).removeAttr('checked')
			}
		}
	}
	$("#accessBtn").click(function(){
		var a = $("input[type='checkbox']:checked");
		var accessarray = [];
		
		for(i=0;i<a.length;i++){
			accessarray[i] = $("input[type='checkbox']:checked").eq(i).val()
		}
		$.post('/index.php/admin/role/setAccess',{'access':accessarray,'roleid':$("#roleid").val()},
			function(json){
				if(json.code){
					alert(json.msg);
					window.location.href="<?php echo url('Role/index'); ?>";
				}else{
					alert(json.msg);
					location.replace(location.href);
				}
			}
		,'json')
	})
	function dele(id,level){
		
		var con = confirm('删除确认');
		if(con){
			$.post('<?php echo url("delete"); ?>',{'id':id},function(json){
				if(json.code == 1){
					alert(json.msg)
					window.location.href = "<?php echo url('Node/index'); ?>";
				}
			},'json')
		}
	}	
	</script>
</html>