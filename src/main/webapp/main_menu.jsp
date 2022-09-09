<%@page import="java.text.DecimalFormat"%>
<%@page import="product.ProductBean"%>
<%@page import="product.CategoryBean"%>
<%@page import="java.util.Vector"%>
<%@page import="product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css"> 
	.a3{
		color: black;
	}
	.a3:hover{
		color: #ff8c00;
	}
</style>

<% 
	request.setCharacterEncoding("UTF-8");
	
	ProductDao pd = ProductDao.getInstance();
	Vector<CategoryBean> cat_arr = pd.getAllCategory();
	DecimalFormat df = new DecimalFormat("#,###"); 
	
	Vector<ProductBean> prod_arr = null;
	String cat = request.getParameter("cat");
	if(cat == null){
		prod_arr = pd.getAllProduct_Menu();
	}
	else{
		prod_arr = pd.getAllProduct_MenuCat(cat);	
	}
%>
    
<jsp:include page="main_top.jsp"></jsp:include>
	<td colspan=2 height="400px" valign="top" align="center">
		
		<table style="border-collapse: collapse; margin-top:50px; border:6px inset gray;">
			<% 
			for(CategoryBean cb : cat_arr){
			%>
			<tr>
				<td width="120px" height="30px" align="center" bgcolor="lightgray"><a href="main_menu.jsp?cat=<%=cb.getCname()%>" class="a2"><%= cb.getCname() %></a></td>
			</tr>
			<% 
			}
			%>
		</table>
	
	</td>
	<td valign="top" align="left">
		
		<table style="margin-top:15px">
			<tr>
				<%
				int count = 0;
				for(ProductBean pb : prod_arr){
					count++;
					if(count%4 == 1){
					%>
					</tr>
					<tr>
					<%
					}
				%>
				<td width="220px" height="250px" align="center">
					<a href="main_prodview.jsp?pno=<%= pb.getPno() %>" class="a3">
					<img border="2" src="<%= request.getContextPath() %>/prodimg/<%= pb.getPimage() %>" width="160px" height="180px">
					</a>
					<font style="font-weight: bold; font-size: small;">
					<br><%if(!pb.getPspec().equals("NORMAL")){%><font color="red">[<%= pb.getPspec() %>]</font><%}%><%=pb.getPname() %>
					<br><%=df.format(pb.getPrice()) %>￦
					</font>
				</td>
				<% 
				}
				%>
			</tr>		
		</table>
		
	</td>
<jsp:include page="main_bottom.jsp"></jsp:include>