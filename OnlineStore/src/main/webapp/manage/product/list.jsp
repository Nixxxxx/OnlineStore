<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

	<section class="content-header">
	<ol class="breadcrumb">
		<li><i class="fa fa-dashboard"></i>首页</li>
		<li class="active">商品管理</li>
	</ol>
	</section>

	<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">商品列表</h3>
					<div class="box-tools">
						<a class="btn btn-info btn-sm" href="manage/product/insert">添加商品</a>
					</div>
				</div>
				<div class="box-body table-responsive no-padding">
					<table class="table table-hover table-bordered text-center">
						<thead>
							<tr>
								<th>序号</th>
								<th>名称</th>
								<th>价格</th>
								<th>操作</th>
							</tr>
						</thead>
						<c:if test="${productList != null }">
							<c:forEach var="product" items="${productList }" varStatus="status">
								<tr>
									<td>${status.index+1 }</td>
									<td>${product.title }</td>
									<td>${product.price }</td>
									<td><a href="manage/product/modify/${product.id }"><i class="fa fa-edit"></i> 编辑</a>
										<a data-id="${product.id }" class="del"
										href="javascript:void(0)"> <i class="fa fa-trash"></i> 删除</a>
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${productList == null }">
							<tr>
								<td colspan="4">无记录！</td>
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

        //删除
        $(".del").click(function () {

            if (confirm("确认要删除吗？")) {
                var id = $(this).data("id");
                $.ajax({
                    url: "admin/product/del",
                    type: "POST",
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