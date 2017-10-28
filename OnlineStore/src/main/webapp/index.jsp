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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<base href="<%=basePath %>">
<link type="text/css" rel="stylesheet" href="./static/css/style.css" />
<script type="text/javascript" src="./static/js/function.js"></script>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><img src="./static/images/logo.gif" /></div>
	<div class="help"><a href="login.html">登录</a></div>
</div><br>
<div id="childNav">
	<div class="wrap">
		<ul class="clearfix">
			<li class="first"><a href="#">音乐</a></li>
			<li><a href="#">影视</a></li>
			<li><a href="#">少儿</a></li>
			<li><a href="#">动漫</a></li>
			<li><a href="#">小说</a></li>
			<li><a href="#">外语</a></li>
			<li class="last"><a href="#">Investor Relations</a></li>
		</ul>
	</div>
</div>
<div id="main" class="wrap">
	<div class="lefter">
		<div class="box">
			<h2>商品分类</h2>
			<dl>
				<dt>图书音像</dt>
				<dd><a href="product-list.html">图书</a></dd>
				<dd><a href="product-list.html">音乐</a></dd>
				<dt>百货</dt>
				<dd><a href="product-list.html">运动健康</a></dd>
				<dd><a href="product-list.html">服装</a></dd>
				<dd><a href="product-list.html">家居</a></dd>
				<dd><a href="product-list.html">美妆</a></dd>
				<dd><a href="product-list.html">母婴</a></dd>
				<dd><a href="product-list.html">食品</a></dd>
			</dl>
		</div>
		<div class="spacer"></div>
		<div class="last-view">
			<h2>最近浏览</h2>
			<dl class="clearfix">
				<dt><img src="./static/images/product/0_tiny.gif" /></dt>
				<dd><a href="product-view.html">法国德菲丝松露精品巧克力500g/盒</a></dd>
				<dt><img src="./images/product/0_tiny.gif" /></dt>
				<dd><a href="product-view.html">法国德菲丝松露精品巧克力500g/盒</a></dd>
			</dl>
		</div>
	</div>
	<div class="main">
		<div class="price-off">
			<h2>今日特价</h2>
			<ul class="product clearfix">
			  <c:if test="${commodityList != null}">
			  <c:forEach var="commodity" items="${commodityList }">
				<li>
					<dl>
						<dt><a href="product-view.html" target="_blank"><img src="${commodity.img }" /></a></dt>
						<dd class="title"><a href="commodity/${commodity.id }" target="_blank">${commodity.name }</a></dd>
						<dd class="price">￥ ${commodity.price }</dd>
					</dl>
				</li>
			  </c:forEach>
			  </c:if>
			</ul>
		</div>
		<div class="side">
			<div class="news-list">
				<h4>最新公告</h4>
				<ul>
					<li><a href="news-view.html" target="_blank">抢钱啦</a></li>
					<li><a href="news-view.html" target="_blank">抢钱啦</a></li>
					<li><a href="news-view.html" target="_blank">抢钱啦</a></li>
					<li><a href="news-view.html" target="_blank">抢钱啦</a></li>
					<li><a href="news-view.html" target="_blank">抢钱啦</a></li>
					<li><a href="news-view.html" target="_blank">抢钱啦</a></li>
					<li><a href="news-view.html" target="_blank">抢钱啦</a></li>
				</ul>
			</div>
			<div class="spacer"></div>
			<div class="news-list">
				<h4>新闻动态</h4>
				<ul>
					<li><a href="news-view.html" target="_blank">抢钱啦</a></li>
					<li><a href="news-view.html" target="_blank">抢钱啦</a></li>
					<li><a href="news-view.html" target="_blank">抢钱啦</a></li>
					<li><a href="news-view.html" target="_blank">抢钱啦</a></li>
					<li><a href="news-view.html" target="_blank">抢钱啦</a></li>
					<li><a href="news-view.html" target="_blank">抢钱啦</a></li>
					<li><a href="news-view.html" target="_blank">抢钱啦</a></li>
				</ul>
			</div>
		</div>
		<div class="spacer clear"></div>
		<div class="hot">
			<h2>热卖推荐</h2>
			<ul class="product clearfix">
			  <c:if test="${commodityList != null}">
			  <c:forEach var="commodity" items="${commodityList }">
				<li>
					<dl>
						<dt><a href="product-view.html" target="_blank"><img src="images/product/1.jpg" /></a></dt>
						<dd class="title"><a href="product-view.html" target="_blank">${commodity.name }</a></dd>
						<dd class="price">￥ ${commodity.price }</dd>
					</dl>
				</li>
			  </c:forEach>
			  </c:if>
			</ul>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2017  All Rights Reserved.
</div>
</body>
</html>