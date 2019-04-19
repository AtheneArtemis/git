<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:57:"D:\wamp\wwwroot\www/application/admin\view\User\edit.html";i:1553412262;}*/ ?>
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
    <link href="/public/static/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/public/static/css/animate.min.css" rel="stylesheet">
    <link href="/public/static/css/style.min862f.css" rel="stylesheet">
    <link rel="stylesheet" href="/public/static/css/app/admin.css">
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title col-sm-12">
                        <div class="col-sm-9"><h3>修改用户</h3></div>
					    <div class="col-sm-3 text-right">
					    	<a href="/index.php/admin/user/index">
						    	<button type="submit" class="btn btn-sm btn-primary">返回上一级</button>
						    </a>
					    </div>
                    </div>
                    <div class="ibox-content"> 
                        <form method="post" class="form-horizontal" action="<?php echo url('User/update'); ?>">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">账号</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="account" value="<?php echo $list['account']; ?>">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">昵称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="nickname" value="<?php echo $list['nickname']; ?>">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">用户组别</label>
                                <div class="col-sm-10">
                                    <select name="role_id" class="form-control">
										<?php if(is_array($rolelist) || $rolelist instanceof \think\Collection || $rolelist instanceof \think\Paginator): $i = 0; $__LIST__ = $rolelist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$r): $mod = ($i % 2 );++$i;?>
											<option value="<?php echo $r['id']; ?>"<?php if($r['id'] == $list['roles']['0']['id']): ?>selected<?php endif; ?>><?php echo $r['name']; ?></option>
										<?php endforeach; endif; else: echo "" ;endif; ?>
									 </select>
                                </div>
                            </div>
                            <input type="hidden" name="id" value="<?php echo $list['id']; ?>"/>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-12 text-right">
                                    <button class="btn btn-primary" type="submit">修改</button>
                                    <button class="btn btn-white" type="reset">重置</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="/public/static/js/jquery.min.js"></script>
    <script src="/public/static/js/bootstrap.min.js"></script>
    <script src="/public/static/js/plugins/iCheck/icheck.min.js"></script>
    <script>
        $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})});
    </script>
    <script src="/public/static/js/app/admin.js"></script>
</body>
</html>
