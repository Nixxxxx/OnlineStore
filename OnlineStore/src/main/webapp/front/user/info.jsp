<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <td align="center" valign="top">
	    <table width="100%"  border="0" cellpadding="0" cellspacing="0">
	      <tr>
	        <td width="18" height="15" align="right">&nbsp;</td>
	        <td colspan="3" class="tableBorder_B_dashed"></td>
	        <td width="24">&nbsp;</td>
	      </tr>
	      <tr>
	        <td align="right">&nbsp;</td>
	        <td height="10" colspan="3">&nbsp;</td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td height="20" align="right">&nbsp;</td>
	        <td width="10" background="static/images/manage_leftTitle_left.GIF">&nbsp;</td>
	        <td width="989" align="center" background="static/images/manage_leftTitle_mid.GIF" class="word_white"><b>用户信息</b></td>
	        <td width="10" background="static/images/manage_leftTitle_right.GIF">&nbsp;</td>
	        <td>&nbsp;</td>
	      </tr>
	    </table>
	    <!-- 填写物流信息 -->
		<div class="row">
			<div id="content_oc" class="col-sm-12">
				<h2>小蜜蜂认证
					<c:if test="${user.verify == 0 }">(未认证)</c:if>
					<c:if test="${user.verify == 1 }">(待审核)</c:if>
					<c:if test="${user.verify == 2 }">(未通过)</c:if>
					<c:if test="${user.verify == 3 }">(已认证)</c:if>
				</h2>
				<form id="verify_form">
					<div class="table-responsive cart-info">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td class="text-right" width="20%">真实姓名：</td>
									<td class="text-left quantity">
										<div class="input-group btn-block" style="max-width: 400px;">
											<input type="text" name="name" size="10" class="form-control" value="${user.name }" required>
										</div>
									</td>
								</tr>
								<tr>
									<td class="text-right">手机：</td>
									<td class="text-left quantity">
										<div class="input-group btn-block" style="max-width: 400px;">
											<input type="text" name="mobile" size="10" class="form-control" value="${user.mobile }" required>
										</div>
									</td>
								</tr>
								<tr>
									<td class="text-right">邮箱：</td>
									<td class="text-left quantity">
										<div class="input-group btn-block" style="max-width: 400px;">
											<input type="text" name="email" size="1" class="form-control" value="${user.email }" required>
										</div>
									</td>
								</tr>
								<tr>
									<td class="text-right">学院专业班级：</td>
									<td class="text-left quantity">
										<div class="input-group btn-block" style="max-width: 400px;">
											<input type="text" name="college" size="1" class="form-control" value="${user.college }" required>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<br><br><button type="submit">确认认证</button>
					</div>
				</form>
			</div>
		</div>
    </td>
	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.js"></script>
    <script>
    	$(function(){
    		$("#verify_form").submit(function(){
    			if(confirm("确定要更新认证信息？")){
	    			$.ajax({
	    				url: "user/verify",
	    				type: "post",
	    				data: $("#verify_form").serialize(),
	    				dataType: "json",
	    				success: function(data){
	    					alert(data.msg);
	    					window.location.reload();
	    				},
	    				error: function(XMLHttpRequest, textStatus){
	    					if(textStatuc == "timeout"){
	    						alert("超时");
	    					}else{
	    						alert("失败");
	    					}
	    				}
	    			});
    			}
    		})
    	})
    </script>