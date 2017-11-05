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
	        <td width="989" align="center" background="static/images/manage_leftTitle_mid.GIF" class="word_white"><b>疾蜂取件</b></td>
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
	                <td width="80%" align="center">信息</td>
	                <td width="15%" align="center">审核</td>
	              </tr>
	              <c:forEach var="express" items="${expressList }" varStatus="status">
	              <tr style="padding:5px;">
	              	<td height="20" align="center">${status.index+1 }</td>
	                <td align="left">${express.message }</td>
	                <td align="center">
	                	<c:if test="${express.verify == 0}">待审核</c:if>
	                	<c:if test="${express.verify == 1}">未通过</c:if>
	                	<c:if test="${express.verify == 2}">已通过</c:if>
	                	<c:if test="${express.verify == 3}">已被接单</c:if>
	                </td>
	              </tr>
	              </c:forEach>
			      <c:if test="${expressList == null }">
				  <tr>
					<td colspan="4">无记录！</td>
				  </tr>
				  </c:if>
		        </table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
				    <td height="30" align="right">当前页数：[ ${page } / ${total } ]&nbsp;
					  <c:if test="">
					  <a href="express?page=1">第一页</a>　<a href="">上一页</a>
					  </c:if>
					  <c:if test="${express != null }">
					  <a href="">下一页</a><a href="">最后一页&nbsp;</a>
					  </c:if>
					</td>
				  </tr>
				</table>
		    </td>
	      </tr>
	    </table>
    </td>