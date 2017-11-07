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
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>${product.name } - 蜂巢商城</title>
<base href="<%=basePath%>">
<link rel="shortcut icon" href="static/images/logo/logo.jpg">
<link rel="stylesheet" href="./static/css/mr-01.css" type="text/css">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<!-- 网站头部 -->
	<jsp:include page="/front/common/header.jsp" />
	<!-- //网站头部 -->
	<div id="mr-mainbody" class="container mr-mainbody">
		<div class="row">
			<!-- 页面主体内容 -->
			<div id="mr-content"
				class="mr-content col-xs-12 col-sm-12 col-md-9 col-md-push-3">
				<div id="mrshop" class="mrshop common-home">
					<div class="container_oc">
						<div class="row">
							<div id="content_oc" class="col-sm-12 view-product">
								<!-- 根据商品ID获取并显示商品信息 -->
								<!-- 显示商品详细信息 -->
								<div class="row">
									<div class="col-xs-12 col-md-4 col-sm-4">
										<ul class="thumbnails" style="list-style: none">
											<li><img src="${product.avater }"></li>
										</ul>
									</div>
									<div class="col-xs-12 col-md-8 col-sm-8">
										<div style="margin-left: 30px; margin-top: 20px">
											<h1 class="product-title">${product.name }</h1>
											<ul class="list-unstyled"><li><h2>${product.price }元</h2></li></ul>
											<div id="product"><hr>
												<c:if test="${user != null }">
												<div class="form-group">
													<div class="btn-group">
														<input id="productId" value="${product.id }" hidden>
														<input id="userId" value="${user.id }" hidden>
														<textarea id="msg" style="width:400px;height:150px;" placeholder="留言信息" maxlength=100></textarea>
													</div>
													<div class="btn-group">
														<button type="button" onclick="addMessage()" class="btn btn-primary btn-primary">
															<i class="fa fa-shopping-cart"></i>留言订购</button>
													</div>
												</div>
												</c:if>
											</div>
										</div>
									</div>
									<div class="col-sm-12 description_oc clearfix">
										<ul class="nav nav-tabs htabs">
											<li class="active" style="width: 150px"><a href="javascript:void(0)">商品描述</a></li>
										</ul>
										<div class="tab-content" style="border: 1px solid #eee; overflow: hidden;">
											<div class="tab-pane active">${product.introduction }</div>
										</div>
									</div>
								</div>
								<!-- //显示商品详细信息 -->
								<!-- //根据商品ID获取并显示商品信息 -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- //页面主体内容 -->
		</div>
	</div>
	<!-- 版权栏 -->
	<%@ include file="/front/common/footer.jsp"%>
	<!-- //版权栏 -->
	<script type="text/javascript">
	function addMessage(){
			$.post(
        		"user/addMessage", 
        		{	msg: $("#msg").val(),
        			productId: $("#productId").val(),
        			userId: $("#userId").val()
        			},
        		function(data){
        			if(data.result){
        				alert("留言成功");
        				window.location.reload();
        			}else{
        				alert("留言失败");
        			}
        		},"json"
        	)
		}
	</script>
</body>
</html>