<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:59:"F:\git\template\www/application/admin\view\Login\login.html";i:1555654956;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title><?php echo $sysset['storename']; ?>管理后台</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="/public/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/public/static/css/font-awesome.min93e3.css" rel="stylesheet">
    <link href="/public/static/css/animate.min.css" rel="stylesheet">
    <link href="/public/static/css/style.min.css" rel="stylesheet">
    <link href="/public/static/css/login.min.css" rel="stylesheet">
    <script>
        if(window.top!==window.self){window.top.location=window.location};
    </script>
</head>
<body class="signin" style="background:url('<?php echo $sysset['loginbg']; ?>') no-repeat center fixed;">
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-7">
                <div class="signin-info">
                    <div class="logopanel m-b">
                        <h1><?php echo $sysset['storename']; ?>管理后台</h1>
                    </div>
                    <div class="m-b"></div>
                    <h4>欢迎使用 <strong><?php echo $sysset['storename']; ?>管理后台</strong></h4>
                    <!-- <ul class="m-b">
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i>1</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i>2</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i>3</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i>4</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i>5</li>
                    </ul> -->
                    <!--
                    <strong>还没有账号？ <a href="<?php echo url('Login/register'); ?>">立即注册&raquo;</a></strong>
                    -->
                </div>
            </div>
            <div class="col-sm-5" style="background:#f6f6f6;filter:alpha(opacity=90);opacity:0.90;">
                <form method="post" action="" id="loginform">
                    <!-- <h3 class="no-margins" style="color:#5a5a5a;margin-bottom:40px;">登录到经销商服务系统管理后台</h3> -->
                    <p class="m-t-md" style="color:#5a5a5a;font-size:16px;">登录到<?php echo $sysset['storename']; ?>管理后台</p>
                    <div id="loginsuccess"></div>
                    <input type="text" name="account" class="form-control uname" placeholder="用户名" />
                    <input type="password" name="password" class="form-control pword m-b" placeholder="密码" onkeydown="javascript:dealpresskeyevent(event)"/>
                    <a href="<?php echo url('Login/forgotpassword'); ?>">忘记密码了？</a>
                    <button type="button" class="btn btn-success btn-block" onclick="btnsubmit()">登录</button>
                </form>
            </div>
        </div>
        <div class="signup-footer">
            <div class="pull-left">
                &copy; 2018 All Rights Reserved. dongdong
            </div>
        </div>
    </div>
    <script type="text/javascript" src="/public/static/js/jquery.min.js"></script>
	<script type="text/javascript">
		function btnsubmit(){
			var loginform = document.getElementById('loginform');
			$.post("<?php echo url('Login/login'); ?>",{'account':loginform['account'].value,'password':loginform['password'].value},function(json){
				if (json.code ==2){
					var str = json.msg;
					$("#loginsuccess").append(str);
	              	window.location.href = "<?php echo url('Index/index'); ?>"
				}else{
					alert(json.msg);
					window.location.href = json.data;
				}
			},'json')
		}
		function dealpresskeyevent(ev){
			if(navigator.appName == "Microsoft Internet Explorer") { //判断浏览器类型
				var keycode = ev.keyCode;
			} else {
				var keycode = ev.which;
			}
			if(keycode == 13) {	//如果是回车键，则查询
				btnsubmit();
			}
		}
	</script>
</body>
</html>
