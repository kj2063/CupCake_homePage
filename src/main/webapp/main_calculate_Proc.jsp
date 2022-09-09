<%@page import="product.ProductDao"%>
<%@page import="product.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cart" class="product.CartBean" scope="session"></jsp:useBean>
<%
	String takeout_date = request.getParameter("takeout_date");	

	int userNo = (int)session.getAttribute("userNo");
	Vector<ProductBean> clist = cart.getCart();
	
	ProductDao pd = ProductDao.getInstance();
	int cnt = pd.addOrder(clist, userNo, takeout_date);
	
	String msg, url;
	if(cnt > 0){
		msg="주문 완료";
		url="main.jsp";
		session.removeAttribute("cart");
	}
	else{
		msg="주문 실패";
		url="main.jsp";
	}
%>
<script type="text/javascript">
	alert("<%= msg %>");
	location.href = "<%= url %>";
</script>
