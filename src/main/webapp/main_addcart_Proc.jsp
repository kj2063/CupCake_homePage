<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cart" class="product.CartBean" scope="session"></jsp:useBean>

<%
	String pno = request.getParameter("pno");
	String p_num = request.getParameter("p_num");
	
	cart.addCart(pno, p_num);
%>

<script type="text/javascript">
	location.href = "main_cart.jsp";
</script>