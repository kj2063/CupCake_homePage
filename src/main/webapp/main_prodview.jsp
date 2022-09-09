<%@page import="java.text.DecimalFormat"%>
<%@page import="product.ProductBean"%>
<%@page import="product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% 
	String pno = request.getParameter("pno");
	String userId = (String)session.getAttribute("userId");

	ProductDao pd = ProductDao.getInstance();
	ProductBean pb = pd.productByPno(pno);
	DecimalFormat df = new DecimalFormat("#,###");
%>
<script type="text/javascript">
	function goOrder(id){
			
		if(id == "null"){
			location.href = "<%= request.getContextPath()%>/login/login.jsp?pre_url=<%= request.getContextPath()%>/main_prodview.jsp?pno=<%= pno%>";
			return;
		}
		
		if(id == "admin"){
			alert("관리자 계정으로는 구매할 수 없습니다");
			return;
		}
		
		if(document.forms[0].p_num.value == ""){
			alert("구매하실 갯수를 입력해 주세요");
			document.forms[0].p_num.focus();
			return;
		}
		
		if(isNaN(document.forms[0].p_num.value)){
			alert("숫자를 입력해 주세요");
			document.forms[0].p_num.select();
			return;
		}
		
		if(document.forms[0].p_num.value < 0){
			alert("1개이상 입력해 주세요");
			document.forms[0].p_num.select();
			return;
		}
		
		document.forms[0].submit();
	}
</script>

<jsp:include page="main_top.jsp"/>
	<td colspan=3 height="400px" align=center valign="top">
	
		<form action="main_addcart_Proc.jsp?" method="post">
		<input type="hidden" name="pno" value="<%= pno %>">
		<table width=500px height=380>
			<tr>
				<td rowspan=2 width="300px" align="center" valign="top">
					<img src="<%=request.getContextPath() %>/prodimg/<%= pb.getPimage() %>" width=250px height=270px style="border:2px solid black">
				</td>
				<td><h4 style="margin-bottom:5px"><%= pb.getPname() %></h4><font style="font-weight: bold;"><%= df.format(pb.getPrice()) %>￦</font></td>
			</tr>
			<tr>
				<td valign="top" height="200">
					<h5 style="margin-bottom:0px">예약 주문</h5>
					<table border="2" style="border-collapse: collapse; margin-top:0px;">
						<tr>
							<td>
								<font style="font-size:small; font-weight:bold">
								<input type="text" name="p_num" size="1" style="height:25px;">개 &nbsp;&nbsp;<a href="javascript:goOrder('<%=userId %>')" class="a1">주문하기</a>&nbsp;&nbsp;
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan=2 height=80 valign="top"><font style="font-weight: bold; font-size: small;">상품 설명</font><br><hr size="2px" color="black" style="margin-top:0px">
					<%= pb.getPcontents() %>
				</td>
			</tr>
		</table>
		</form>
		
	</td>
<jsp:include page="main_bottom.jsp"/>