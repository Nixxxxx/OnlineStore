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
<title>蜂巢</title>
<base href="<%=basePath%>">
<link rel="stylesheet" href="./static/css/mr-01.css" type="text/css">
<script src="./static/js/jsArr01.js" type="text/javascript"></script>
<script src="./static/js/module.js" type="text/javascript"></script>
<script src="./static/js/jsArr02.js" type="text/javascript"></script>
<script src="./static/js/tab.js" type="text/javascript"></script>
</head>
<body>
	<!-- 网站头部 -->
    <jsp:include page="/front/common/header.jsp"></jsp:include>
	<!-- //网站头部 -->
	<!-- 轮播广告及热门商品 -->
	<div class="container mr-sl mr-sl-1">
		<div class="mr-spotlight mr-spotlight-1 row">
			<!-- 显示轮播广告 -->
			<div
				class="col-lg-9 col-md-12 col-sm-3 hidden-sm col-xs-6 hidden-xs">
				<div class="mr-module module " id="Mod159">
					<div class="module-inner">
						<div class="module-ct">
							<div class="mijoshop">
								<div class="container_oc">
									<div class="slideshow">
										<div id="slidershow" class="nivoSlider">
											<a href="#" class="nivo-imageLink" style="display: block;"><img
												src="images/img1.png" class="img-responsive"
												style="display: none;"> </a> <a href="#"
												class="nivo-imageLink" style="display: none;"> <img
												src="images/img2.png" class="img-responsive"
												style="display: none;">
											</a> <a href="#" class="nivo-imageLink" style="display: none;">
												<img src="images/img3.png" class="img-responsive"
												style="display: none;">
											</a> <a href="#" class="nivo-imageLink" style="display: none;">
												<img src="images/img4.png" class="img-responsive"
												style="display: none;">
											</a>
										</div>
									</div>
									<script type="text/javascript">
										//实现调用幻灯片插件轮播广告
										<!--
										jQuery(document).ready(function() {
											jQuery('#slidershow').nivoSlider();
										});
									//-->
									</script>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //轮播广告及热门商品  -->
	<!-- 最新上架商品展示 -->
	<nav class="container mr-masstop hidden-sm hidden-xs">
	<div class="custom">
		<div>
			<div class="ja-tabswrap default" style="width: 100%;">
				<div id="myTab" class="container">

					<h3 class="index_h3">
						<span class="index_title">最新上架</span>
					</h3>
					<!-- //最新上架选项卡 -->
					<div class="ja-tab-content ja-tab-content col-6 active"
						style="opacity: 1; width: 100%; visibility: visible;">
						<div class="ja-tab-subcontent">
							<div class="mijoshop">
								<div class="container_oc">
									<div class="row">
										<!-- 循环显示最新上架商品 ：添加12条商品信息-->
										<c:forEach items="product" var="productList">
										<div class="product-grid col-lg-2 col-md-3 col-sm-6 col-xs-12">
											<div class="product-thumb transition">
												<div class="actions">
													<div class="image">
														<a href="goods/detail/${product.id }"> <img
															src="${product.img }"
															alt="${product.name }" class="img-responsive"></a>
													</div>
												</div>
												<div class="caption">
													<div class="name" style="height: 40px">
														<a href="goods/detail/${product.id }"> <span
															style="color: #0885B1">商品名：</span> </a>
													</div>
													<p class="price">
														价格： ${product.price }元
													</p>
												</div>
											</div>
										</div>
										</c:forEach>
										<!-- //循环显示最新上架商品：添加12条商品信息 -->
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- //最新上架选项卡 -->
			</div>
		</div>
	</div>
	</nav>
	<!-- //最新上架及打折商品展示 -->
	<!-- 版权栏 -->
	<%@ include file="/front/common/footer.jsp"%>
	<!-- //版权栏 -->
</body>
</html>