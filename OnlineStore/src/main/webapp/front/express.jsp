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
<title>疾蜂取件-51商城</title>
<base href="<%=basePath%>">
<link rel="stylesheet" href="static/css/mr-01.css" type="text/css">
<script src="static/js/jsArr01.js" type="text/javascript"></script>
<script src="static/js/module.js" type="text/javascript"></script>
<script src="static/js/jsArr02.js" type="text/javascript"></script>
<script src="static/js/tab.js" type="text/javascript"></script>
</head>

<body>
	<!-- 网站头部 -->
	<jsp:include page="/front/common/header.jsp" />
	<!-- //网站头部 -->
	<div id="mr-mainbody" class="container mr-mainbody">
		<div class="row">
			<!-- 页面主体内容 -->
			<div id="mr-content" class="mr-content col-xs-12">
				<div id="mrshop" class="mrshop common-home">
					<div class="container_oc">
						<div class="row">
							<div id="content_oc" class="col-sm-12">
								<h1>疾蜂取件</h1>
								<!-- 显示购物车中的商品 -->
								<div class="table-responsive cart-info">
									<table class="table table-bordered">
										<thead>
											<tr>
												<td class="text-center">序号</td>
												<td class="text-center">用户</td>
												<td class="text-center">信息</td>
												<td class="text-center">操作</td>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="express" items="${expressList }" varStatus="status">
											<tr>
												<td class="text-center" width=5%>${status.index+1 }</td>
												<td class="text-center" width=15%>${express.user.userName }</td>
												<td class="text-center" width=70%>${express.message }</td>
												<td class="text-center" width=10%>
													<c:if test="${express.sender == null }">
													<a data-id="${express.id }" class="order" href="javascript:void(0)"><i class="fa fa-trash"></i>接单</a>
													</c:if>
													<c:if test="${express.sender != null }">
													已接单
													</c:if>
												</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!-- //显示购物车中的商品 -->
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
	
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script>
$(function(){
    //删除
    $(".order").click(function () {
        if (confirm("确认要接单么吗？")) {
            var id = $(this).data("id");
            $.ajax({
                url: "user/order",
                type: "post",
                data: {id: id},
                dataType: "json",
                success: function (data) {
                    alert(data.msg);
                    if (data.result) {
                    	window.location.reload();
                    }
                },
                error: function (XMLHttpRequest, textStatus) {
                    if (textStatus === "timeout") {
                        alert("接单超时！");
                    } else {
                        alert("接单失败！");
                    }
                }
            })
        }
    });
})
</script>
</body>
</html>