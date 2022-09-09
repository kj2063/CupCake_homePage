<%@page import="java.text.DecimalFormat"%>
<%@page import="product.OrderBean"%>
<%@page import="java.util.Vector"%>
<%@page import="product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
	.bg1:nth-child(2n){
		background: #dbead5;
	}
</style>

<script type="text/javascript">
	function del_check(ono){
		var flag = confirm("정말로 주문을 삭제하시겠습니까?");
		
		if(flag == true){
			location.href = "admin_orddelete_Proc.jsp?ono="+ono;
		}
	}
</script>
    
<jsp:include page="admin_top.jsp"></jsp:include>
	<td height="380px"  valign="top">
		<table width=900px style="border-bottom:2px solid gray; margin-bottom: 30px;">
			<tr>
				<th colspan=9 bgcolor="gray" style="color:white">주문 내역</th>
			</tr>
			<tr height=25px bgcolor="lightgray" style="font-size: small;">
				<th width="80">ID</th>
				<th width="60">이름</th>
				<th width="120">전화번호</th>
				<th width="200">상품명</th>
				<th width="60">개수</th>
				<th width="100">전체 금액</th>
				<th width="100">주문일</th>
				<th width="100">수취일</th>
				<th width="40" bgcolor="white"></th>
			</tr>
			<% 
				DecimalFormat df = new DecimalFormat("#,###");
			
				ProductDao pd = ProductDao.getInstance();
				Vector<OrderBean> olist = pd.getAllOrder();
				
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
			<tr style="font-size: small;" class="bg1" height=30px>
				<th style="border-bottom: 1px dotted black"><%= ob.getId() %></th>
				<th style="border-bottom: 1px dotted black"><%= ob.getName() %></th>
				<th style="border-bottom: 1px dotted black"><%= ob.getHp1() %>-<%= ob.getHp2()%>-<%= ob.getHp3() %></th>
				<th style="border-bottom: 1px dotted black"><%= pname %></th>
				<th style="border-bottom: 1px dotted black"><%= p_num %></th>
				<th style="border-bottom: 1px dotted black" align="right"><%= df.format(ob.getTot_price()) %>￦</th>
				<th style="border-bottom: 1px dotted black"><%= ob.getOrd_date().substring(0,11) %></th>
				<th style="border-bottom: 1px dotted black"><%= ob.getTakeout_date() %></th>
				<th style="border-bottom: 1px dotted black"><a href="javascript:del_check('<%= ob.getOno()%>')"><span style="background:lightgray; border:2px solid black; border-radius:5px">삭제</span></a></th>
			</tr>
			<% 
				}
			%>
		</table>
	</td>	
<jsp:include page="admin_bottom.jsp"></jsp:include>
	