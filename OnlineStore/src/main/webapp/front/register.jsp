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
<title>注册-51商城</title>
<base href="<%=basePath %>">
<link rel="stylesheet" href="./static/css/mr-01.css" type="text/css">
</head>
<body>
	<!-- 主体内容 -->
	<div id="mr-mainbody" class="container mr-mainbody">
		<div class="row">
			<div id="mr-content" class="mr-content col-xs-12">
				<div class="login-wrap"
					style="margin-bottom: 60px; margin-top: 50px">
					<div style="max-width: 540px; margin: 0 auto;">
						<a href="product" title="点击返回首页"><img
							src="./static/images/51logo.png"></a>
					</div>
					<div class="login">
						<div class="page-header" style="pause: 0px;">
							<h1 class="login_h1">会员注册</h1>
						</div>
						<!-- 会员注册表单 -->
						<form id="register_form" class="form-horizontal">
							<div align="center" id="error_msg" style="color:#ff0000">错误信息</div>
							<fieldset>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label for="userName" class="required"> 账户 ：</label>
									</div>
									<div class="col-sm-8">
										<!-- 账户文本框 -->
										<input type="text" name="userName" id="userName"
											class="required" size="38" required aria-required="true"><span
											class="star">&nbsp;*</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label for="password" class="required">密码 ：</label>
									</div>
									<div class="col-sm-8">
										<!-- 密码文本框 -->
										<input type="password" name="password" id="password"
											autocomplete="off" class="validate-password required"
											size="38" maxlength=20 required="required"
											aria-required="true"><span class="star">&nbsp;*</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label for="password" class="required"> 确认密码 ：</label>
									</div>
									<div class="col-sm-8">
										<!-- 确认密码文本框 -->
										<input type="password" name="password2" id="password2"
											autocomplete="off" class="validate-password required"
											size="38" maxlength=20 required aria-required="true"><span
											class="star">&nbsp;*</span>
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
										<img id="randImage" name="randImage" src="image.jsp"
											onclick="javascript:loadImage();" width=116 height=43
											class="img_checkcode" />
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-4 col-sm-8">
										<button id="register_btn" type="submit" class="btn btn-primary login">同意并注册</button>
									</div>
								</div>
								<div class="form-group" style="margin: 20px;">
									<label
										style="float: right; color: #858585; margin-right: 80px; margin-top: 10px; font-size: 14px;">已有账号！<a
										href="login">去登录</a></label>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //主体内容 -->
	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>

	<script>
$(function () {
    var $error_msg = $("#error_msg");
    var show_error = function (error_msg) {
        $error_msg.text(error_msg);
    };
    $("#register_form").submit(function () {
        var userName = $.trim($("#userName").val());
        var password = $.trim($("#password").val());
        var password2 = $.trim($("#password2").val());
        var captcha = $.trim($("#captcha").val());
        var u_pattern = /^[a-zA-Z0-9_@]{4,20}$/;
        var c_pattern = /^[a-zA-Z0-9]{4}$/;
        if (!u_pattern.test(userName)) {
            show_error("请输入正确格式的用户名");
            return false;
        }
        if (password.localeCompare(password2) != 0) {
            show_error("两次密码需一致");
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
        var register_btn = $("#register_btn");
        $.ajax({
            url: "user/register",
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
            		alert("登陆成功，前去登陆");
            		window.location.href = "login";
            	}else{
                    show_error(data.msg);
            	}
            },
            error: function (XMLHttpRequest, textStatus) {
                if (textStatus == "timeout") {
                    show_error("注册超时");
                } else {
                    show_error("注册失败");
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