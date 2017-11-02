<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section class="content-header">
	<ol class="breadcrumb">
		<li>商品管理</li>
		<li class="active">商品信息</li>
	</ol>
</section>
<div class="sidebar-content">
	<div class="row">
		<div class="col-sm-3 thumbnail">
			<%-- <img src="${product.imagePath }">  --%>
			<div class="text-danger wrapper-xs text-center invisible" id="error_msg">错误信息</div>
		</div>
		<div class="col-sm-7 col-sm-offset-1">
			<form action="manage/product/update" method="post" class="form-horizontal" id="updateForm" enctype="multipart/form-data">
				<input type="hidden" name="id" value="${product.id }"> 
				<div class="form-group input-group">
					<span class="input-group-addon">封&nbsp;&nbsp;&nbsp;面</span> 
					<input type="file" id="image" name="image" accept="image">
				</div>
				<div class="form-group input-group">
					<span class="input-group-addon">名&nbsp;&nbsp;&nbsp;称</span> 
					<input type="text" class="form-control" id="name" name="name" value="${product.name }" maxlength="20" size="20" required>
				</div>
				<div class="form-group input-group">
					<span class="input-group-addon">价格</span> 
					<input type="text" class="form-control" id="price" name="price" value="${product.price }" maxlength="20" size="20" required>
				</div>
				<div class="form-group input-group">
					<span class="input-group-addon">商品介绍</span>
					<textarea id="introduction" name="introduction">${product.introduction }</textarea>
				</div>

				<div class="form-group">
					<input type="submit" id="updateBtn" class="btn btn-success btn-block" value="保存">
				</div>
			</form>
		</div>
	</div>
</div>

<script src="static/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(function() {
	CKEDITOR.replace( 'introduction', {
		height: 300,
		width: 700,
	} );
	
})
</script>