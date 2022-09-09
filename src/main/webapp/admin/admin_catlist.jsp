<%@page import="product.CategoryBean"%>
<%@page import="java.util.Vector"%>
<%@page import="product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ProductDao pd = ProductDao.getInstance();
	Vector<CategoryBean> cat_arr = pd.getAllCategory();
%>
<jsp:include page="admin_top.jsp"></jsp:include>
	<td height="380px" valign="top">
		<table width="400px" border="2" style="border-collapse: collapse;">
			<tr height="30px">
				<th colspan="3" bgcolor="gray" style="font-size:medium; color:white">카테고리 목록</th>
			</tr>
			<tr bgcolor="lightgray" style="font-size:small;" height="30px">
				<th width="50px">NO</th>
				<th>카테고리 이름</th>
				<th width="50px">삭제</th>
			</tr>
			<%
			for(CategoryBean cb : cat_arr){
			%>
			<tr height="30px" align="center">
				<td><%= cb.getCno() %></td>
				<td><%= cb.getCname() %></td>
				<td style="font-size:small;"><a href="admin_catdelete_Proc.jsp?cno=<%=cb.getCno()%>" class="a1">삭제</a></td>
			</tr>
			<% 
			}
			%>
		</table>
	</td>
<jsp:include page="admin_bottom.jsp"></jsp:include>