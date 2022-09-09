<%@page import="product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String cno = request.getParameter("cno");

	ProductDao pd = ProductDao.getInstance();
	int cnt = pd.deleteCategory(cno);
	
	String msg, url;
	if(cnt > 0){
		msg="카테고리 삭제 성공";
		url="admin_catlist.jsp";
	}
	else{
		msg="카테고리 삭제 실패";
		url="admin_catlist.jsp";
	}
%>
<script type="text/javascript">
	alert("<%= msg %>");
	location.href = "<%= url %>";
</script>