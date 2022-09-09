<%@page import="java.text.DecimalFormat"%>
<%@page import="product.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cart" class="product.CartBean" scope="session"></jsp:useBean>
<% 
	DecimalFormat df = new DecimalFormat("#,###");
	Vector<ProductBean> clist = cart.getCart();
	
	String takeout_date = request.getParameter("takeout_date");
%>
<jsp:include page="main_top.jsp"></jsp:include>
	<td colspan="3" align="center" height="400px" valign="top">
		
		<table style="font-size: small;" width="600px">
			<tr style="font-size:large;">
				<th colspan=3 align="left" style="border-bottom: 2px solid black">&nbsp;&nbsp;결제 내역서 확인</th>
			</tr>
			<tr bgcolor="gray" style="color:white">
				<th width="300px">상품명</th>
				<th width="100px">갯수</th>
				<th width="200px">금액</th>
			</tr>
			<%
			int tot_price_end = 0;
			for(ProductBean pb : clist){
				tot_price_end += pb.getTot_price();
			%>
			<tr height="30px" bgcolor="lightgray">
				<th><%= pb.getPname() %></th>
				<th align="right"><%= pb.getP_num() %>개</th>
				<th align="right"><%= df.format(pb.getTot_price())%>￦</th>
			</tr>
			<% 
			}
			%>
			<tr height="30px">
				<th></th>
				<th></th>
				<th align="right" bgcolor="lightgray" style="border:2px solid black">상품 수취일 : <font color="red"><%= takeout_date %></font></th>
			</tr>
			<tr height="30px">
				<th></th>
				<th></th>
				<th align="right" bgcolor="lightgray" style="border:2px solid black">결제하실 총액 : <font color="red"><%= df.format(tot_price_end) %></font>￦</th>
			</tr>
		</table>
		
		<br>
		<h3><a href="main_calculate_Proc.jsp?takeout_date=<%=takeout_date%>" class="a1">결제하기</a></h3>
	
	</td>
<jsp:include page="main_bottom.jsp"></jsp:include>