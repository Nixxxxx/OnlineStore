<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="toolbar" style="background-color: #F0F0F0; width: 100%;">
	<div class="container">
		<div class="row">
			<div class="toolbar-ct-1">
			<i class="fa fa-phone"></i><span style="margin-right: 15px;">电话：189-7492-7540</span>
			</div>
			<div class="toolbar-ct-2">
				<c:choose>
				<c:when test="${user == null }">
					<a href="login">登录</a>&nbsp; ｜ &nbsp;<a href="register">注册</a>
				</c:when>
				<c:otherwise>
					您好，${user.userName }&nbsp; &nbsp;<a href="user/info" target="_blank">用户页</a>&nbsp;&nbsp;
						|&nbsp;&nbsp;<a href="javascript:logout()">退出</a>
				</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<div style="background-color: white; width: 100%">
		<div class="container">
			<div class="row">
				<div class="toolbar-ct col-xs-12 col-md-6  hidden-sm hidden-xs">
					<div class="toolbar-ct-1">
						<img src="./static/images/logo/IMANGO.jpg">
					</div>
					<div>
						<!-- 搜索条 -->
						<div class="search_box">
							<div class="top-nav-search">
								<form method="post">
									<input type="text" name="searchword" size="38"
										style="border: 0px;" class="top-nav-search-input"
										placeholder="请输入内容" /> 
										<input type="image" src="./static/images/search.png" class="search_box_img"/>
								</form>
							</div>
						</div>
						<!-- //搜索条 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<header id="mr-header" class="wrap mr-header">
	<div class="container">
		<div class="row">
			<!-- 主导航条 -->
			<nav id="mr-mainnav"
				class="col-xs-12 col-md-6 mr-mainnav navbar navbar-default">
				<div class="mr-navbar navbar-collapse collapse">
					<div class="mr-megamenu animate slide" data-duration="400"
						data-responsive="true">
						<ul class="nav navbar-nav level0">
							<li data-level="1"><a href="product">首页</a></li>
							<li data-level="1"><a href="express">疾峰取件</a></li>
							<li data-level="1"><a href="index">关于我们 </a></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- //主导航条 -->
		</div>
	</div>
</header>
<script>
function logout(){
	$.post(
		"user/logout",
		{},
		function(data){
			if(data.result){
				alert("已退出登录");
				window.location.reload();
			}
		},"json"
	)
}
</script>