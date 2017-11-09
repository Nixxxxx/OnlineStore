<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>登录-蜂巢商城</title>
<base href="<%=basePath%>">
<link rel="shortcut icon" href="static/images/logo/logo.jpg">
<link rel="stylesheet" href="./static/css/mr-01.css" type="text/css">
<style>
.invisible {
	visibility: hidden;
}
</style>
</head>
<body>
	<div id="mr-mainbody" class="container mr-mainbody">
		<div class="row">
			<!-- 主体内容 -->
			<div id="mr-content" class="mr-content col-xs-12">
				<div class="login-wrap" style="margin-bottom: 60px; margin-top: 50px">
					<div style="max-width: 540px; margin: 0 auto;">
						<a href="product" title="点击返回首页"><img src="./static/images/logo/IMANGO.jpg"></a>
					</div>
					<div class="login">
						<div class="page-header" style="pause: 0px;"><h1 class="login_h1">会员登录</h1> </div>
						<!-- 会员登录表单 -->
						<form id="login_form" class="form-horizontal">
							<div align="center" id="error_msg" style="color: #ff0000;" class="invisible">错误信息</div>
							<div class="form-group">
								<div class="col-sm-4 control-label">
									<label for="userName" class="required">账户 ：</label>
								</div>
								<div class="col-sm-8">
									<!-- 账户文本框 -->
									<input type="text" name="userName" id="userName" size=35 maxlength=20
										class="validate-username required" required autofocus="">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-4 control-label">
									<label for="password" class="required">密码 ：</label>
								</div>
								<div class="col-sm-8">
									<!-- 密码文本框 -->
									<input type="password" name="password" id="password" size=35 maxlength=20
										class="validate-password required" required aria-required="true">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-4 control-label">
									<label for="password" class="required">验证码 ：</label>
								</div>
								<div class="col-sm-8" style="clear: none;">
									<!-- 验证码文本框 -->
									<input type="text" name="captcha" id="captcha"
										class="validate-password required" style="float: left;"
										size=18 maxlength=4 required aria-required="true"> 
										<!-- 显示验证码 -->
										<img id="randImage" name="randImage" src="image.jsp" onclick="javascript:loadImage();"
											width=116 height=43 class="img_checkcode"/>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-4 col-sm-8">
									<button id="login_btn" type="submit" class="btn btn-primary login">登录</button>
								</div>
							</div>
							<div class="form-group" style="border-top: 1px solid #D9D9D9; margin: 20px;">
								<label style="float: right; color: #858585; margin-right: 40px; margin-top: 10px; font-size: 14px;">没有账户？
									<a href="register">立即注册</a></label>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- //主体内容 -->
		</div>
	</div>
	
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script>
$(function () {
    var $error_msg = $("#error_msg");
    var show_error = function (error_msg) {
        $error_msg.text(error_msg).removeClass("invisible");
    };
    $("#login_form").submit(function () {
        var userName = $.trim($("#userName").val());
        var password = $.trim($("#password").val());
        var captcha = $.trim($("#captcha").val());
        var u_pattern = /^[a-zA-Z0-9_@]{4,20}$/;
        var c_pattern = /^[a-zA-Z0-9]{4}$/;
        if (!u_pattern.test(userName)) {
            show_error("请输入正确格式的用户名");
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
        var login_btn = $("#login_btn");
        $.ajax({
            url: "user/login",
            type: "post",
            data: {
                userName: userName,
                password: password,
                captcha: captcha
            },
            dataType: "json",
            complete: function () {
                //重置验证码
                $("#randImage").trigger("click");
            },
            success: function (data) {
            	if(data.result){
            		if(window.location.href.indexOf("login")){
            			window.location.href = "product";
            		}else
            			window.location.reload();
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
</body>
</html>