<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<section class="content-header">
	<ol class="breadcrumb">
		<li><i class="fa fa-dashboard"></i>首页</li>
		<li>用户管理</li>
		<li class="active">用户列表</li>
	</ol>
	</section>

	<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">用户列表</h3>
				</div>
				<div class="box-body table-responsive no-padding">
					<table class="table table-hover table-bordered text-center">
						<thead>
							<tr>
								<th>序号</th>
								<th>用户名</th>
								<th>密码</th>
								<th>真实姓名</th>
								<th>学院专业班级</th>
								<th>手机</th>
								<th>邮箱</th>
								<th>小蜜蜂</th>
								<th>操作</th>
							</tr>
						</thead>
						<c:if test="${userList != null }">
							<c:forEach var="user" items="${userList }" varStatus="status">
								<tr>
									<td>${status.index+1 }</td>
									<td>${user.userName }</td>
									<td>${user.password }</td>
									<td>${user.name }</td>
									<td>${user.mobile }</td>
									<td>${user.email }</td>
									<td>${user.college }</td>
									<td>
										<c:if test="${user.bee == 0}">未认证</c:if>
										<c:if test="${user.bee == 1}">待审核</c:if>
										<c:if test="${user.bee == 2}">未通过</c:if>
										<c:if test="${user.bee == 3}">已认证</c:if>
									</td>
									<td>
										<a data-id="${user.id }" class="approve" href="javascript:void(0)"> <i class="fa fa-trash"></i>未通过</a>
										<a data-id="${user.id }" class="deny" href="javascript:void(0)"> <i class="fa fa-trash"></i>审核通过</a>
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${userList == null }">
							<tr>
								<td colspan="7">无记录！</td>
							</tr>
						</c:if>
					</table>
				</div>
				<div class="box-footer clearfix">
					<div class="pull-right">
						<nav aria-label="Page navigation">
						<ul class="pagination">${pageCode }</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	
<script>
$(function(){
	//通过审核
	$(".approve").click(function () {

	    if (confirm("确认通过审核吗？")) {
	        var id = $(this).data("id");
	        $.ajax({
	            url: "admin/user/approve",
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
	                    alert("审核超时！");
	                } else {
	                    alert("审核失败！");
	                }
	            }
	        })
	    }
	});


	//拒绝审核
	$(".deny").click(function () {

	  if (confirm("确认拒绝审核吗？")) {
	      var id = $(this).data("id");
	      $.ajax({
	          url: "admin/user/deny",
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
	                  alert("审核超时！");
	              } else {
	                  alert("审核失败！");
	              }
	          }
	      })
	  }
	});
})
</script>