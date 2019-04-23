<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:68:"F:\git\template\www/application/admin\view\Login\forgotpassword.html";i:1555645288;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>东东商城管理后台</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="/public/static/css/bootstrap.min14ed.css" rel="stylesheet">
    <link href="/public/static/css/font-awesome.min93e3.css" rel="stylesheet">
    <link href="/public/static/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/public/static/css/animate.min.css" rel="stylesheet">
    <link href="/public/static/css/style.min862f.css" rel="stylesheet">
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>
<body class="gray-bg">
    <div class="middle-box text-center loginscreen  animated fadeInDown">
        <div>
            <div>
                <h1 class="logo-name" style="font-size:120px;margin-bottom:30px;">东 东</h1>
            </div>
            <h3>忘记密码？</h3>
            <p>请填写手机号，找回密码</p>
            <form class="m-t" role="form" action="<?php echo url('Login/userforgotpassword'); ?>" id="queryForm">
                <div class="form-group">
              		<input type="text" class="form-control" id="mobilenumber" placeholder="请输入手机号" name="account">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="请输入新密码" name="password">
                </div>
                <div class="form-group">
                	<div class="col-sm-7" style="padding-left:0px;">
                		<input type="text" class="form-control" id="verifycode" placeholder="请输入验证码" name="verifycode">
                	</div>
                	<div class="col-sm-5" style="padding-right:0px;padding-left:0px;">
                    	<input type="button" class="form-control" id="btnSendCode" value="获取验证码" onclick="verifyregister()">
                    </div>
                    <div style="clear:both;"></div>
                </div>
                <button type="button" id="registerBtn" class="btn btn-primary block full-width m-b">找回密码</button>
                <p class="text-muted text-center"><small>想起密码了？</small><a href="<?php echo url('Login/login'); ?>">点此登录</a>
                </p>
            </form>
        </div>
    </div>
    <script src="/public/static/js/jquery.min.js"></script>
    <script src="/public/static/js/bootstrap.min.js"></script>
    <script src="/public/static/js/plugins/iCheck/icheck.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})});
        /* function addcompanydiv(){
        	var vs = $('#usertypediv option:selected').val();
        	if (vs == 'firstleveldistributor' || vs == 'distributor'){
        		$("#companynamediv").css('display','block');
        	}else{
        		$("#companynamediv").css('display','none');
        	}
        } */
        $("#registerBtn").click(function(){
        	var queryForm = document.getElementById("queryForm");
		    $.ajax({   
		        url:$('#queryForm').attr('action'), //发送后台的url  
		        type:'post',   
		        data:$('#queryForm').serialize(),//序列化表单内容 
		        dataType:'json', //后台返回的数据类型  
		        timeout:15000, //超时时间  
		        beforeSend:function(XMLHttpRequest){   
		       	  $('#submitBtn').attr("disabled","true");
		        },   
		        success:function(json){  //data为后台返回的数据  
		        	if (json.code){
		        		alert(json.msg);
		        		window.location.href = "<?php echo url('Index/index'); ?>";
		        	}else{
		        		alert(json.msg);
		        	}
		        }  
	        });
        })
		var InterValObj; //timer变量，控制时间
		var count = 120; //间隔函数，1秒执行
		var curCount;//当前剩余秒数
		var code = ""; //验证码
		var codeLength = 6;//验证码长度
		
		function verifyregister(){
			var phone = document.getElementById("mobilenumber").value; //手机号码
			//验证是否已注册
			if (phone != ""){
				/* if (!(/^1[3|4|5|6|7|8|9][0-9]{9}$/.test(phone))){
					alert("手机号码格式不正确");
				}else{ */
					$.post('<?php echo url("verifyregister"); ?>',
	               	{'mobilenumber':phone},completeverifyregister,'json');
				/* } */
			}else{
				alert("手机号码不能为空！");
			}
		}
		function completeverifyregister(json){
	    	if (json.code ==1){
	    		alert(json.msg);
	    	}else{
	    		resendMessage();
	    	}
	    }
	    function resendMessage() {
			curCount = count;
			var phone = document.getElementById("mobilenumber").value; //手机号码
			if(phone != ""){
				//产生验证码
				for (var i = 0; i < codeLength; i++) {
					code += parseInt(Math.random() * 9).toString();
				}
				//设置button效果，开始计时
				document.getElementById("btnSendCode").disabled = true;
				document.getElementById("btnSendCode").value = curCount + "秒";
				
				InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
				//向后台发送处理数据----verifycode暂定固定值为1
				$.post('/index.php/admin/login/getsmsverifycode',
	               {'mobilenumber':phone,'verifycode':'1'},function(json){
	            	   alert(json.msg)
            	   },'json');
			} else{
				alert("手机号码不能为空！");
			}
		}
		//timer处理函数
		function SetRemainTime() {
			if (curCount == 0) {                
				window.clearInterval(InterValObj);//停止计时器
				document.getElementById("btnSendCode").disabled = false; //启用按钮
				document.getElementById("btnSendCode").value = "重新发送验证码";
				code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效    
			} else {
				curCount--;
				document.getElementById("btnSendCode").value = curCount + "秒";
			}
		}
		
    </script>
</body>
</html>
