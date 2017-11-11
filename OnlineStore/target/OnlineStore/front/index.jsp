<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>蜂巢商城</title>
<base href="<%=basePath%>">
<link rel="shortcut icon" href="static/images/logo/logo.jpg">
<link rel="stylesheet" href="./static/css/mr-01.css" type="text/css">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<!-- 网站头部 -->
    <jsp:include page="/front/common/header.jsp"></jsp:include>
	<!-- //网站头部 -->
	<jsp:include page="${pagePath }"></jsp:include>
	<!-- 版权栏 -->
	<%@ include file="/front/common/footer.jsp"%>
	<!-- //版权栏 -->
</body>
</html>