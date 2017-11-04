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
<title>51商城――后台管理</title>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="static/css/style.css" rel="stylesheet">
</head>
<body>
<table width="1280" height="114"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><img src="static/images/manage_banner.JPG" width="1280" height="114"/></td>
  </tr>
</table>
<table width="1280" height="288" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
  	<jsp:include page="${pagePath }"></jsp:include>
	<td width="182" valign="top">
	  <table width="100%" height="431"  border="0" cellpadding="0" cellspacing="0">
	      <tr>
	        <td width="199" valign="top" bgcolor="#FFFFFF"><%@ include file="/front/user/common/navigation.jsp"%></td>
	      </tr>
      </table>
    </td>	  
  </tr>
</table>
<%@ include file="/front/user/common/copyright.jsp"%>
</body>
</html>
