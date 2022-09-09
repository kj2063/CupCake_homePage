<%@page import="product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ono = request.getParameter("ono");
	
	ProductDao pd = ProductDao.getInstance();
	int cnt = pd.deleteOrder(ono);
	
	String msg, url;
	if(cnt>0){
		msg="주문 삭제 성공";
		url="admin_ordlist.jsp";
	}
	else{
		msg="주문 삭제 실패";
		url="admin_ordlist.jsp";	
	}
%>
<script type="text/javascript">
	alert("<%= msg %>");
	location.href = "<%= url %>";
</script>