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
	        <td width="989" align="center" background="static/images/manage_leftTitle_mid.GIF" class="word_white"><b>留言列表</b></td>
	        <td width="10" background="static/images/manage_leftTitle_right.GIF">&nbsp;</td>
	        <td>&nbsp;</td>
	      </tr>
	    </table>
	    <table width="92%" height="192"  border="0" cellpadding="0" cellspacing="0">
	      <tr>
		    <td valign="top">
				<table width="100%" height="14"  border="0" cellpadding="0" cellspacing="0">
			       <tr>
			         <td height="13" align="center">&nbsp;</td>
			       </tr>
			    </table>
		        <table width="100%" height="60"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#E6E6E6">
	              <tr bgcolor="#eeeeee">
	              	<td width="5%" height="24" align="center">序号</td>
	                <td width="15%" align="center">商品</td>
	                <td width="70%" align="center">留言</td>
	                <td width="10%" align="center">审核</td>
	              </tr>
	              <c:forEach var="message" items="${messageList }" varStatus="status">
	              <tr style="padding:5px;">
	              	<td align="center">${status.index+1 }</td>
	                <td height="20" align="center"><a href="product/${message.product.id }">${message.product.name }</a></td>
	                <td align="left">${message.message }</td>
	                <td align="center">
	                	<c:if test="${message.verify == 0}">待审核</c:if>
	                	<c:if test="${message.verify == 1}">未通过</c:if>
	                	<c:if test="${message.verify == 2}">已通过</c:if>
	                </td>
	              </tr>
	              </c:forEach>
		        </table>
				<table width="100%"  border="0" cellspacing="0" cellpadding="0">
				  <tr>
				    <td height="30" align="right">当前页数：[ ${page } / ${total } ]&nbsp;
				      <a href="user/message?page=1">首页</a>
					  <c:if test="${page > 1 }">
					  <a href="user/message?page=${page-1 }">上一页</a>
					  </c:if>
					  <c:if test="${page < total }">
					  <a href="user/message?page=${page+1 }">下一页</a>
					  </c:if>
					  <a href="user/message?page=${total }">尾页</a>
					</td>
				  </tr>
				</table>
		    </td>
	      </tr>
	    </table>
    </td>