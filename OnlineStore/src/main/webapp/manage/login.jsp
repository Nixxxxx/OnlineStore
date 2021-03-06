<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>蜂巢商城</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<base href="<%=basePath%>">
<link rel="shortcut icon" href="static/images/logo/logo.jpg">
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="./static/css/login.css">
<style>
body {
	font-family: "Segoe UI", "Lucida Grande", Helvetica, Arial,
		"Microsoft YaHei", FreeSans, Arimo, "Droid Sans",
		"wenquanyi micro hei", "Hiragino Sans GB", "Hiragino Sans GB W3",
		"FontAwesome", sans-serif;
}
</style>
</head>
<body>
	<div class="container w-xxl w-auto-xs">
		<a href="#" class="navbar-brand block m-t m-b-sm">蜂巢商城</a>
		<div class="m-b-xxl">
			<div class="wrapper text-center">
				<strong>Login</strong>
			</div>
			<form id="login_form">
				<div class="text-danger wrapper-xs text-center invisible"
					id="error_msg">错误信息</div>
				<div class="list-group list-group-sm">
					<div class="list-group-item">
						<input type="text" name="userName" id="userName"
							placeholder="Username" class="form-control no-border">
					</div>
					<div class="list-group-item">
						<input type="password" name="password" id="password"
							placeholder="Password" class="form-control no-border">
					</div>
					<div class="list-group-item">
						<div class="row">
							<div class="col-xs-7">
								<input id="captcha" type="text" name="captcha" size=8
									value="${imageCode }" placeholder="Captcha" class="form-control no-border">
							</div>
							<div class="col-xs-5">
								<img id="randImage" name="randImage" style="cursor: pointer; height: 34px; width: 100%"
									title="点击可更换" onclick="javascript:loadImage();" src="image.jsp">
							</div>
						</div>
					</div>
				</div>
				<button type="submit" class="btn btn-lg btn-primary btn-block"
					id="login_btn" data-loading-text="登录中...">立即登录</button>
				<div class="line line-dashed"></div>
			</form>
		</div>
		<div class="text-center">
			<p>
				<small class="text-muted"><a href="product" target="_blank">蜂巢</a><br>
					Copyright &copy; 2017  ~ 
				</small>
			</p>
		</div>
	</div>
</body>

<script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
$(function () {
    var $error_msg = $("#error_msg");
    var show_error = function (error_msg) {
        $error_msg.text(error_msg).removeClass("invisible");
    };
    $("#login_form").submit(function () {
        $error_msg.addClass("invisible")
        var userName = $.trim($("#userName").val());
        var password = $.trim($("#password").val());
        var captcha = $.trim($("#captcha").val());
        var u_pattern = /^[a-zA-Z0-9_@]{4,20}$/;
        var c_pattern = /^[a-zA-Z0-9]{4}$/;
        if (!u_pattern.test(userName)) {
            show_error("请输入正确格式的用户名");
            return false;
        }
        if (password == "") {
            show_error("请输入密码");
            return false;
        }
        if (!u_pattern.test(password)) {
            show_error("请输入正确格式的密码");
            return false;
        }
        if (!c_pattern.test(captcha)) {
            show_error("请输入正确格式的验证码");
            return false;
        }
        /*var shaObj = new jsSHA("SHA-1", "TEXT");
        shaObj.update(password);
        var hash_password = shaObj.getHash("HEX", {
            "outputUpper": false
        });*/
        var login_btn = $("#login_btn");
        $.ajax({
            url: "manage/admin/login",
            type: "POST",
            data: {
                userName: userName,
                password: password,
                captcha: captcha
            },
            dataType: "json",
            beforeSend: function () {
                login_btn.button("loading");
            },
            complete: function () {
                //重置登录按钮
                login_btn.button("reset");
                //重置验证码
                $("#randImage").trigger("click");
            },
            success: function (data) {
            	if(data.result){
            		window.location.href ="manage/admin/index";
            	}else{
                    show_error(data.msg);
            	}
            },
            error: function (XMLHttpRequest, textStatus) {
                if (textStatus == "timeout") {
                    show_error("登录超时");
                } else {
                    show_error("登录失败");
                }
            }
        });
        return false;
    });
})
    
    
    function loadImage(){
  		$("#randImage").attr("src","image.jsp?"+Math.random());  //document.getElementById("randImage")定义一个img对象     src="image.jsp?"指定对象        +Math.random()为了使每次访问image.jsp的地址不一样，这样浏览器不会取本地缓存的数据。
  	}
</script>
</html>