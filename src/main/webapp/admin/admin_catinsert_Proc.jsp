<%@page import="product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String cname = request.getParameter("cname");
	
	ProductDao pd = ProductDao.getInstance();
	int cnt = pd.insertCategory(cname);
	
	String msg, url;
	if(cnt>0){
		msg="카테고리 등록 성공";
		url="admin_catinsert.jsp";
	}
	else{
		msg="카테고리 등록 실패";	
		url="admin_catinsert.jsp";
	}
%>
<script type="text/javascript">
	alert("<%= msg %>");
	location.href = "<%= url %>";
</script>