<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<section class="content-header">
	<ol class="breadcrumb">
		<li><i class="fa fa-dashboard"></i>首页</li>
		<li class="active">疾蜂取件</li>
	</ol>
	</section>

	<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">取件列表</h3>
				</div>
				<div class="box-body table-responsive no-padding">
					<table class="table table-hover table-bordered text-center">
						<thead>
							<tr>
								<th>序号</th>
								<th>发布者</th>
								<th>发布信息</th>
								<th>审核</th>
								<th>接单人</th>
								<th>操作</th>
							</tr>
						</thead>
						<c:if test="${expressList != null }">
							<c:forEach var="express" items="${expressList }" varStatus="status">
								<tr>
									<td>${status.index+1 }</td>
									<td>${express.user.userName }</td>
									<td>${express.message }</td>
									<td>
										<c:if test="${express.verify == 0}">待审核</c:if>
										<c:if test="${express.verify == 1}">未通过</c:if>
										<c:if test="${express.verify == 2}">已通过</c:if>
										<c:if test="${express.verify == 3}">已接单</c:if>
									</td>
									<td>${express.sender.userName }</td>
									<td>
										<a data-id="${express.id }" class="approve" href="javascript:void(0)"> <i class="fa fa-trash"></i>审核通过</a>
										<a data-id="${express.id }" class="deny" href="javascript:void(0)"> <i class="fa fa-trash"></i>审核拒绝</a>
										<a data-id="${express.id }" class="del" href="javascript:void(0)"> <i class="fa fa-trash"></i>删除</a>
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${expressList == null }">
							<tr>
								<td colspan="6">无记录！</td>
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
	            url: "manage/express/update",
	            type: "post",
	            data: {id: id, verify: 2},
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
	          url: "manage/express/update",
	          type: "post",
	          data: {id: id, verify: 1},
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
	
	//删除用户
	$(".del").click(function () {
	  if (confirm("确认删除用户吗？")) {
	      var id = $(this).data("id");
	      $.ajax({
	          url: "manage/express/delete",
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
	                  alert("删除超时！");
	              } else {
	                  alert("删除失败！");
	              }
	          }
	      })
	  }
	});
})
</script>