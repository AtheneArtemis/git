<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:57:"D:\wamp\wwwroot\www/application/admin\view\Node\edit.html";i:1520323398;}*/ ?>
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
                        <div class="col-sm-9"><h3>修改节点</h3></div>
					    <div class="col-sm-3 text-right">
					    	<a href="<?php echo url('Node/index'); ?>">
						    	<button type="button" class="btn btn-sm btn-primary">返回上一级</button>
						    </a>
					    </div>
                    </div>
                    <div class="ibox-content"> 
                        <form method="post" class="form-horizontal" action="<?php echo url('Node/update'); ?>">
                            <div class="form-group">
                                <label class="col-sm-2 control-label"><?php echo $type; ?>名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" datatype="*1-30" name="name" value="<?php echo $list['name']; ?>" placeholder="请输入英文字母，若为控制器首字母请大写">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"><?php echo $type; ?>描述</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" datatype="*1-30" name="title" value="<?php echo $list['title']; ?>" placeholder="节点在页面显示的名称">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"><?php echo $type; ?>排序</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="sort" datatype="n1-2" value="<?php echo $list['sort']; ?>">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <?php if(!(empty($list['level']) || (($list['level'] instanceof \think\Collection || $list['level'] instanceof \think\Paginator ) && $list['level']->isEmpty()))): ?>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"><?php echo $type; ?>level</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="level" readonly value="<?php echo $list['level']; ?>">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <?php endif; ?>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"><?php echo $type; ?>pid</label>
                                <div class="col-sm-10">
                                <?php if(empty($list['pid']) || (($list['pid'] instanceof \think\Collection || $list['pid'] instanceof \think\Paginator ) && $list['pid']->isEmpty())): ?>
                                	<input type="text" class="form-control" name="pid" readonly value="<?php echo $list['parent_id']; ?>">
                               	<?php else: ?>
                               		<input type="text" class="form-control" name="pid" readonly value="<?php echo $list['pid']; ?>">
                                <?php endif; ?>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <?php if(!(empty($list['group_id']) || (($list['group_id'] instanceof \think\Collection || $list['group_id'] instanceof \think\Paginator ) && $list['group_id']->isEmpty()))): ?>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"><?php echo $type; ?>所属分组</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="group_id" readonly value="<?php echo $list['group_id']; ?>">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <?php endif; ?>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">是否开启<?php echo $type; ?></label>
                                <div class="col-sm-10">
                                    <select name="status" class="form-control">
										<option value="1"<?php if($list['status'] == 1): ?>selected<?php endif; ?>>开启</option>
										<option value="0"<?php if($list['status'] == 0): ?>selected<?php endif; ?>>关闭</option>
									 </select>
                                </div>
                            </div>
                            <input type="hidden" name="nodetype" value="<?php echo $list['nodetype']; ?>"/>
                            <input type="hidden" name="id" value="<?php echo $list['id']; ?>"/>
                            <div class="hr-line-dashed"></div>
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
    <script src="/public/static/js/jquery.min.js"></script>
    <script src="/public/static/js/bootstrap.min.js"></script>
    <script src="/public/static/js/plugins/iCheck/icheck.min.js"></script>
    <script type="text/javascript" src="/public/static/js/Validform_v5.3.2_min.js"></script>
    <script src="/public/static/js/app/admin.js"></script>
    <script type="text/javascript">
	    $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})});
	    $(".form-horizontal").Validform();
    </script>
</body>
</html>
