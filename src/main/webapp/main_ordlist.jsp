<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Vector"%>
<%@page import="product.OrderBean"%>
<%@page import="product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="main_top.jsp"></jsp:include>
	<td colspan=3 align="center" height="400px" valign="top">
	
		<table width="700">
			<tr align="left">
				<th colspan=5 style="border-bottom: 2px solid black; font-size: large;">&nbsp;&nbsp;주문 확인</th>
			</tr>
			<tr bgcolor="gray" height="25px" style="color:white; font-size:small;">
				<th width=250>상품명</th>
				<th width=80>갯수</th>
				<th width=120>전체 금액</th>
				<th width=110>주문일</th>
				<th width=110>수취일</th>
			</tr>
			<% 
			DecimalFormat df = new DecimalFormat("#,###");
			
			int userNo = (int)session.getAttribute("userNo");
			
			ProductDao pd = ProductDao.getInstance();
			Vector<OrderBean> olist = pd.getOrderByMemno(userNo);
			
			if(olist.size() == 0){
			%>
			<tr height=50px>
				<td colspan=5 align=center style="font-size:small;">주문 목록이 없습니다</td>
			</tr>
			<%	
			}
			else{
			
				String pname, p_num;
				for(OrderBean ob : olist){
					
					String[] pno_list = ob.getPno().split("/");			
					String[] p_num_list = ob.getP_num().split("/");
					
					pname = pd.getPnameByPno(pno_list[0]);
					p_num = p_num_list[0]+"개";
					
					if(pno_list.length != 1){
						for(int i=1; i<pno_list.length; i++){
							pname += "<br>" + pd.getPnameByPno(pno_list[i]); 
							p_num += "<br>" + p_num_list[i] + "개";
						}
					}
			%>
			<tr height="30px" bgcolor="lightgray" style="font-size: small;">
				<th><%= pname %></th>
				<th><%= p_num %></th>
				<th align="right"><%= df.format(ob.getTot_price()) %>￦</th>
				<th><%= ob.getOrd_date().substring(0,11) %></th>
				<th><%= ob.getTakeout_date() %></th>
			</tr>
			<%
				}
			}
			%>
		</table>
		
	</td>
<jsp:include page="main_bottom.jsp"></jsp:include>