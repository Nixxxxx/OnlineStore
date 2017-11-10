<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<section class="content-header">
	<ol class="breadcrumb">
		<li><i class="fa fa-dashboard"></i>首页</li>
		<li class="active">留言管理</li>
	</ol>
	</section>

	<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">留言列表</h3>
				</div>
				<div class="box-body table-responsive no-padding">
					<table class="table table-hover table-bordered text-center">
						<thead>
							<tr>
								<th>序号</th>
								<th>用户</th>
								<th>商品</th>
								<th>留言</th>
								<th>审核</th>
								<th>操作</th>
							</tr>
						</thead>
						<c:if test="${messageList != null }">
							<c:forEach var="message" items="${messageList }" varStatus="status">
								<tr>
									<td>${status.index+1 }</td>
						            <td class="message_user">
						              <input class="user_userName" type="hidden" value="${message.user.userName }">
						              <input class="user_name" type="hidden" value="${message.user.name }">
						              <input class="user_mobile" type="hidden" value="${message.user.mobile }">
						              <input class="user_email" type="hidden" value="${message.user.email }">
						              <input class="user_college" type="hidden" value="${message.user.college }">
						              <input class="user_verify" type="hidden" value="${message.user.verify }">
						              <a class="user" href="javascript:void(0)" data-toggle="modal" data-remote="false" data-target="#user_modal" data-backdrop="static">
						                  ${message.user.userName }</a></td>
									<td><a href="product/${message.product.id }" target="_blank">${message.product.name }</a></td>
									<td>${message.message }</td>
									<td>
										<c:if test="${message.verify == 0}">待审核</c:if>
										<c:if test="${message.verify == 1}">未通过</c:if>
										<c:if test="${message.verify == 2}">已通过</c:if>
									</td>
									<td>
										<a data-id="${message.id }" class="approve" href="javascript:void(0)"> <i class="fa fa-trash"></i>审核通过</a>
										<a data-id="${message.id }" class="deny" href="javascript:void(0)"> <i class="fa fa-trash"></i>审核拒绝</a>
										<a data-id="${message.id }" class="del" href="javascript:void(0)"> <i class="fa fa-trash"></i> 删除</a>
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${messageList == null }">
							<tr>
								<td colspan="5">无记录！</td>
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
	
	<!-- Modal -->
<div class="modal fade" id="user_modal" tabindex="-1" role="dialog" aria-labelledby="user_update_label">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <!-- Horizontal Form -->
      <div class="box box-info">
        <div class="box-header with-border">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
          <h3 class="box-title" id="user_update_label">用户信息</h3>
        </div>
        <!-- /.box-header -->
          <div class="box-body">
            <div class="form-group">
              <label for="user_userName" class="col-sm-3 control-label">用户名</label>
              <div class="col-sm-9">
                <input type="text" class="form-control pull-right" id="user_userName" readonly>
              </div>
            </div>
            <div class="form-group">
              <label for="user_name" class="col-sm-3 control-label">真实姓名</label>
              <div class="col-sm-9">
                <input type="text" class="form-control pull-right" id="user_name" readonly>
              </div>
            </div>
            <div class="form-group">
              <label for="user_mobile" class="col-sm-3 control-label">手机</label>
              <div class="col-sm-9">
                <input type="text" class="form-control pull-right" id="user_mobile" readonly>
              </div>
            </div>
            <div class="form-group">
              <label for="user_email" class="col-sm-3 control-label">邮箱</label>
              <div class="col-sm-9">
                <input type="text" class="form-control pull-right" id="user_email" readonly>
              </div>
            </div>
            <div class="form-group">
              <label for="user_college" class="col-sm-3 control-label">学院专业班级</label>
              <div class="col-sm-9">
                <input type="text" class="form-control pull-right" id="user_college" readonly>
              </div>
            </div>
            <div class="form-group">
              <label for="user_verify" class="col-sm-3 control-label">小蜜蜂</label>
              <div class="col-sm-9">
                <input type="text" class="form-control pull-right" id="user_verify" readonly>
              </div>
            </div>
          </div>
          <!-- /.box-body -->
          <div class="box-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
          </div>
          <!-- /.box-footer -->
      </div>
      <!-- /.box -->
    </div>
  </div>
</div>

<script>
$(function(){
   	$(".user").click(function () {
        $("#user_userName").val($(this).prevAll(".user_userName").val());
        $("#user_name").val($(this).prevAll(".user_name").val());
        $("#user_mobile").val($(this).prevAll(".user_mobile").val());
        $("#user_email").val($(this).prevAll(".user_email").val());
        $("#user_college").val($(this).prevAll(".user_college").val());
        var verify = $(this).prevAll(".user_verify").val();
        if(verify == 0)
        	$("#user_verify").val("待审核");
        else if(verify == 1)
        	$("#user_verify").val("未通过");
        if(verify == 2)
        	$("#user_verify").val("已通过");
    });
   	
    //通过审核
	$(".approve").click(function () {
	    if (confirm("确认通过审核吗？")) {
	        var id = $(this).data("id");
	        $.ajax({
	            url: "manage/message/update",
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
	          url: "manage/message/update",
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
	
    //删除
    $(".del").click(function () {

        if (confirm("确认要删除吗？")) {
            var id = $(this).data("id");
            $.ajax({
                url: "manage/message/delete",
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