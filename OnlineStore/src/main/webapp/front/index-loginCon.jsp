<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="toolbar" style="background-color: #F0F0F0; width: 100%;">
	<div class="container">
		<div class="row">
			<div class="toolbar-ct-1">
			<i class="fa fa-phone"></i><span style="margin-right: 15px;">电话：400-675-1066</span>
			</div>
			<div class="toolbar-ct-2">
				<c:choose>
				<c:when test="${user == null }">
					<a href="login.jsp">登录</a>&nbsp; ｜ &nbsp;<a href="register.jsp">注册</a>
				</c:when>
				<c:otherwise>
					您好，${user.name }&nbsp; &nbsp;<a href="modifyMember.jsp">修改</a>&nbsp;&nbsp;
						|&nbsp;&nbsp;<a href="logout.jsp">退出</a>
				</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<div style="background-color: white; width: 100%">
		<div class="container">
			<div class="row">
				<div class="toolbar-ct col-xs-12 col-md-6  hidden-sm hidden-xs">
					<div class="toolbar-ct-1">
						<img src="./static/images/51logo.png">
					</div>
					<div>
						<!-- 搜索条 -->
						<div class="search_box">
							<div class="top-nav-search">
								<form method="post" action="search_result.jsp">
									<input type="text" name="searchword" size="38"
										style="border: 0px;" class="top-nav-search-input"
										placeholder="请输入内容" /> <input type="image"
										src="./static/images/search.png" class="search_box_img"
										onFocus="this.blur()" />
								</form>
							</div>
						</div>
						<!-- //搜索条 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>