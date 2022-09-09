<%@page import="product.ProductBean"%>
<%@page import="product.CategoryBean"%>
<%@page import="java.util.Vector"%>
<%@page import="product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String pno = request.getParameter("pno");

	ProductDao pd = ProductDao.getInstance();
	Vector<CategoryBean> cat_arr = pd.getAllCategory();
	
	ProductBean pb = pd.productByPno(pno);
%>

<script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript">
function check(){
	
	if($("select[name=pcat]").val() == ""){
		alert("카테고리를 선택해 주세요");
		return false;
	}
	if($("input[name=pname]").val() == ""){
		alert("상품명을 입력해 주세요");
		$("input[name=pname]").focus();
		return false;
	}
	if($("input[name=price]").val() == ""){
		alert("가격을 입력해 주세요");
		$("input[name=price]").focus();
		return false;
	}
	if(isNaN($("input[name=price]").val())){
		alert("올바른 상품 가격을 입력해 주세요");
		$("input[name=price]").select();
		return false;
	}
	if($("select[name=pspec]").val() == ""){
		alert("상품 스펙을 선택해 주세요");
		return false;
	}
	if($("textarea[name=pcontents]").val() == ""){
		alert("상품 설명을 입력해 주세요");
		$("textarea[name=pcontents]").focus();
		return false;
	}
	
	
}
</script>

<style type="text/css">
	th{
		border-bottom: 1px solid black;
	}
	a{
	
	}
</style>

<jsp:include page="admin_top.jsp"></jsp:include>
	<td height="380px">
	
		<form action="admin_produpdate_Proc.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pno" value="<%= pno %>">
		<table width="400px">
			<tr height="35px">
				<th colspan="2" bgcolor="gray" style="color:white; font-size:medium;">상품 등록</th>
			</tr>
			<tr height="35px">
				<th bgcolor="lightgray" width="80px" style="font-size:small;">카테고리</th>
				<td>
					<select name="pcat" style="height:25px">
						<option value=""></option>
						<% 
						for(CategoryBean cb : cat_arr){
						%>
						<option value="<%=cb.getCname() %>" <%if(pb.getPcat().equals(cb.getCname())){%>selected<%}%>><%=cb.getCname() %></option>
						<% 
						}
						%>
					</select>
				</td>
			</tr>
			<tr height="35px">
				<th bgcolor="lightgray" style="font-size:small;">상품명</th>
				<td><input type="text" name="pname" style="height:25px" size="10" value="<%= pb.getPname()%>"></td>
			</tr>
			<tr height="35px">
				<th bgcolor="lightgray" style="font-size:small;">상품 사진</th>
				<td>
					<img src="<%=request.getContextPath() %>/prodimg/<%=pb.getPimage() %>" width="50" height="50"> <input type="file" name="pimage">
					<br><font size="2"><%= pb.getPimage() %></font><input type="hidden" name="pre_pimage" value="<%= pb.getPimage() %>">
				</td>
			</tr>
			<tr height="35px">
				<th bgcolor="lightgray" style="font-size:small;">상품 가격</th>
				<td><input type="text" name="price" style="height:25px" size="10" value="<%= pb.getPrice()%>"> ￦</td>
			</tr>
			<tr height="35px">
				<th bgcolor="lightgray" style="font-size:small;">상품 스펙</th>
				<td>
					<% 
					String[] specs = {"NEW","BEST","NORMAL"};
					%>
					<select name="pspec" style="height:25px">
						<option value=""></option>
						<% 
						for(String spec : specs){
						%>
						<option value="<%= spec %>" <%if(pb.getPspec().equals(spec)){%>selected<%}%>><%= spec %></option>
						<% 
						}
						%>
					</select>
				</td>
			</tr>
			<tr height="35px">
				<th bgcolor="lightgray" style="font-size:small;">상품 설명</th>
				<td><textarea cols="40" rows="3" style="resize:none;" name="pcontents"><%= pb.getPcontents() %></textarea></td>
			</tr>
			<tr height="30px">
				<th colspan="2" bgcolor="gray">
					<input type="submit" value="등록" style="font-weight: bold; width:60px" onclick="return check()">
				</th>
			</tr>
		</table>
		</form>
	 
	</td>
<jsp:include page="admin_bottom.jsp"></jsp:include>