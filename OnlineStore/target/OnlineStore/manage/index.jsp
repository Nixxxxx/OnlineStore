<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>蜂巢商城管理</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<base href="<%=basePath%>">

<link rel="shortcut icon" href="static/images/logo/logo.jpg">
<script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">
<link rel="stylesheet" href="https://cdn.bootcss.com/admin-lte/2.3.11/css/AdminLTE.css">
<link rel="stylesheet" href="https://cdn.bootcss.com/admin-lte/2.3.11/css/skins/_all-skins.min.css">
<script src="https://cdn.bootcss.com/admin-lte/2.3.11/js/app.min.js"></script>
<script src="https://cdn.bootcss.com/jQuery-slimScroll/1.3.8/jquery.slimscroll.min.js"></script>

<style>
body, button, input, select, textarea, h1, h2, h3, h4, h5, h6 {
	font-family: Microsoft YaHei, "宋体", Tahoma, Helvetica, Arial,
		"\5b8b\4f53", sans-serif;
}

.content-header>.breadcrumb {
	position: relative;
	margin-top: 5px;
	top: 0;
	right: 0;
	float: none;
	background: #d2d6de;
	padding-left: 10px;
}

.content-header>.breadcrumb li:before {
	color: #97a0b3;
}

.navbar-nav>.user-menu {
	padding-right: 30px;
}

.navbar-nav>.user-menu>.dropdown-menu>li.user-header {
	height: 150px;
}

.navbar-nav>.user-menu>.dropdown-menu>li.user-body {
	padding: 8px;
}
</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<header class="main-header">
			<a href="javascript:void(0)" class="logo">
			<span class="logo-lg"><b>蜂巢商城后台</b></span>
		</a>
		<nav class="navbar navbar-static-top">

		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<li class="dropdown user user-menu">
				  <a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
					<span class="hidden-xs">${admin.userName }</span>
				  </a>
				</li>
			</ul>
		</div>
		</nav> 
		</header>
		<aside class="main-sidebar">
		<section class="sidebar">
		<ul class="sidebar-menu">
			<li class="header">MAIN NAVIGATION</li>
			<li><a href="javascript:void(0)"><i class="fa fa-circle-o"></i> 通知</a></li>
			<li><a href="manage/admin/list"><i class="fa fa-circle-o"></i> 管理员管理 </a></li>
			<li><a href="manage/user/list"><i class="fa fa-circle-o"></i> 用户管理 </a></li>
			<li><a href="manage/product/list"><i class="fa fa-circle-o"></i> 商品管理 </a></li>
			<li><a href="manage/message/list"><i class="fa fa-circle-o"></i> 留言管理 </a></li>
			<li><a href="manage/express/list"><i class="fa fa-circle-o"></i> 疾蜂取件 </a></li>
			<li class="header">THEMES</li>
			<li><a href="javascript:void(0)" data-skin="skin-blue">
				<i class="fa fa-circle-o text-aqua"></i> <span>Blue</span></a></li>
			<li><a href="javascript:void(0)" data-skin="skin-green">
				<i class="fa fa-circle-o text-green"></i> <span>Green</span></a></li>
			<li><a href="javascript:void(0)" data-skin="skin-red">
				<i class="fa fa-circle-o text-red"></i> <span>Red</span></a></li>
		</ul>
		</section>
	</aside>

		<div class="content-wrapper">
			<c:if test="${pagePath != null }">
				<jsp:include page="${pagePath }" />
			</c:if>
		</div>
		
		<footer class="main-footer text-center"> 
			<strong> <a href="product" target="_blank">蜂巢</a></strong> 
			All Rights Reserved &copy; 2017 
		</footer>
	</div>

<script src="https://cdn.bootcss.com/admin-lte/2.3.11/js/demo.js"></script>
</body>
</html>