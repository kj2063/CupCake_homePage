<%@page import="java.text.DecimalFormat"%>
<%@page import="product.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cart" class="product.CartBean" scope="session"></jsp:useBean>
<% 
	Vector<ProductBean> cart_list = cart.getCart();
	int cart_len = cart_list.size();
%>

<script type="text/javascript">
	function order(){
		
		if(<%=cart_len%> == 0){
			alert("구매할 상품이 없습니다");
			return false;
		}
		
		if(document.ordform.takeout_date.value == ""){
			alert("상품을 가져가실 날짜를 선택해 주세요");
			return false;
		}
		
		document.ordform.submit();
	}
	
	function check(){
		for(var i=0; i<<%=cart_len%>; i++){
			if(document.forms[i].p_num.value == ""){
				alert("수정할 값을 입력해 주세요");
				document.forms[i].p_num.focus();
				return false;
			}
			
			if(document.forms[i].p_num.value < 0){
				alert("1개 이상의 갯수를 입력해 주세요");
				document.forms[i].p_num.select();
				return false;
			}
			
			if(isNaN(document.forms[i].p_num.value)){
				alert("숫자를 입력해 주세요");
				document.forms[i].p_num.select();
				return false;
			}
		}
	}
</script>

<jsp:include page="main_top.jsp"></jsp:include>
	<td colspan="3" align="center" height="400px" valign="top">
		
		
		<table width="700" style="margin-bottom: 30px; font-size:small; margin-left: 100px;">
			<tr>
				<th colspan="5" align="left" style="font-size:large; border-bottom:2px solid black;">&nbsp;&nbsp;장바구니</th>
			</tr>
			<tr bgcolor="gray" style="color:white">
				<th width="100px" height="25px">상품 사진</th>
				<th width="200px">상품명</th>
				<th width="120px">수량</th>
				<th width="90px">단가</th>
				<th width="90px">금액</th>
			</tr>
			<% 
			DecimalFormat df = new DecimalFormat("#,###");
			Vector<ProductBean> clist = cart.getCart();

			int tot_price_end = 0;
			
			if(clist.size() == 0){
			%>
			<tr>
				<td colspan=5 align="center" height=50>장바구니에 넣은 상품이 없습니다</td>
				<td></td>
			</tr>
			<%	
			}
			else{
				for(ProductBean pb : clist){
					tot_price_end += pb.getTot_price();
				
			%>
			 
			<tr height=80px align="center" bgcolor="lightgray">
				<td width="100px"><img src="<%=request.getContextPath() %>/prodimg/<%= pb.getPimage()%>" width=68 height=70></td>
				<td><b><%= pb.getPname()%></b></td>
				<td>
					<form action="main_cartedit_Proc.jsp" method="post">
					<input type="hidden" name="pno" value="<%= pb.getPno() %>">
					<input type="text" size="1" name="p_num" value="<%= pb.getP_num()%>">개&nbsp;
					<input type="submit" value="수정" style="font-size:small; font-weight: bold;" onclick="return check()">
					</form>
				</td>
				<td align="right"><%= df.format(pb.getPrice()) %>￦</td>
				<td align="right"><%= df.format(pb.getTot_price()) %>￦</td>
				<td width="80px" bgcolor="white">
					<table>
						<tr>
							<th bgcolor="lightgray" style="font-size:small; border-radius:5px; border:2px solid black">
								<a href="main_cartdelete_Proc.jsp?pno=<%=pb.getPno() %>" class="a2">상품 제거</a>							
							</th>
						</tr>
					</table>
				
				</td>
			</tr>
			<% 
				}
			}	
			%>
			<tr>
				<th colspan=5 align="right">총액 : <%= df.format(tot_price_end) %>￦</th>
			</tr>
			<tr>
				<th colspan=5 align="right" style="padding-top:20px">
				<form action="main_calculate.jsp" name="ordform">
					상품 가져가실 날짜 : <input type="date" name="takeout_date"><br>
					<span style="font-size:x-small; color:red;">※상품은 배달이 아닌 수취하러 '직접' 가게로 오셔야 합니다.</span>
				</th>
			</tr>
			<tr>
				<th align="right" colspan=5 style="font-size: medium; padding-top:10px;">
					<a href="javascript:order()" class="a1">주문 완료</a>
				</form>
				</th>
			</tr>
				
		</table>
		
		
	</td>
<jsp:include page="main_bottom.jsp"></jsp:include>