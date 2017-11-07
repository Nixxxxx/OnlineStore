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
	<!-- 所有商品展示 -->
	<nav class="container mr-masstop hidden-sm hidden-xs">
	<div class="custom">
		<div>
			<div class="ja-tabswrap default" style="width: 100%;">
				<div id="myTab" class="container">

					<h3 class="index_h3">
						<span class="index_title">所有商品</span>
					</h3>
					<!-- //最新上架选项卡 -->
					<div class="ja-tab-content ja-tab-content col-6 active"
						style="opacity: 1; width: 100%; visibility: visible;">
						<div class="ja-tab-subcontent">
							<div class="mijoshop">
								<div class="container_oc">
									<div class="row">
										<!-- 循环显示最新上架商品 ：添加12条商品信息-->
										<c:forEach var="product" items="${productList }">
										<div class="product-grid col-lg-2 col-md-3 col-sm-6 col-xs-12">
											<div class="product-thumb transition">
												<div class="actions">
													<div class="image">
														<a href="product/${product.id }"> 
														  <img src="${product.avater }" alt="${product.name }" class="img-responsive"></a>
													</div>
												</div>
												<div class="caption">
													<div class="name" style="height: 40px">
														<a href="product/${product.id }"> <span
															style="color: #0885B1">商品名：${product.name }</span> </a>
													</div>
													<p class="price">
														价格： ${product.price }元
													</p>
												</div>
											</div>
										</div>
										</c:forEach>
										<!-- //循环显示最新上架商品：添加12条商品信息 -->
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
										  <tr>
										    <td height="30" align="right">当前页数：[ ${page } / ${total } ]&nbsp;
										      <a href="product?page=1">首页</a>
											  <c:if test="${page > 1 }">
											  <a href="product?page=${page-1 }">上一页</a>
											  </c:if>
											  <c:if test="${page < total }">
											  <a href="product?page=${page+1 }">下一页</a>
											  </c:if>
											  <a href="product?page=${total }">尾页</a>
											</td>
										  </tr>
										</table>
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