<%@page import="product.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@page import="product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	function delete_check(pno,pimage){
		
		var flag = confirm("정말로 해당 상품을 삭제 하시겠습니까?");
		
		if(flag){
			location.href = "admin_proddelete_Proc.jsp?pno="+pno+"&pimage="+pimage;	
		}
		
	}
</script>

<jsp:include page="admin_top.jsp"/>
	<td height="380px" valign="top">
		<table border="2" style="border-collapse: collapse;" width="650px">
			<tr style="background:gray; color:white;">
				<th colspan="6">상품 목록</th>
			</tr>
			<tr style="font-size: small; background:lightgray; height:25px;">
				<th>NO</th>
				<th>카테고리</th>
				<th>상품명</th>
				<th>상품스펙</th>
				<th>가격</th>
				<th>수정/삭제</th>
			</tr>
			<% 
			ProductDao pd = ProductDao.getInstance();
			Vector<ProductBean> prod_arr = pd.getAllProduct();
			
			for(ProductBean pb : prod_arr){
			%>
			<tr align="center" style="font-size:small; font-weight:bold">
				<td><%= pb.getPno()%></td>
				<td><%= pb.getPcat()%></td>
				<td><img src="<%=request.getContextPath()%>/prodimg/<%= pb.getPimage()%>" width="50" height="50"><br><%= pb.getPname()%></td>
				<td><%= pb.getPspec()%></td>
				<td align="right"><%= pb.getPrice()%>￦</td>
				<td>
				<a href="admin_produpdate.jsp?pno=<%= pb.getPno()%>" class="a1">수정</a> |
				<a href="javascript:delete_check('<%= pb.getPno()%>','<%= pb.getPimage()%>')" class="a1">삭제</a>
				</td>
			</tr>
			<% 
			}
			%>		
		</table>
	</td>
<jsp:include page="admin_bottom.jsp"/>