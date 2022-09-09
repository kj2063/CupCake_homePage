<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="<%=request.getContextPath() %>/style.css"/>
<style type="text/css">
	a{
		font-weight:bold;
		text-decoration: none;
		color: black;
	}
	a:hover{
		color:#ff8c00;
	}
	.a1{
		color:#ff8c00;
	}
	.a1:hover{
		color:#ffdab9;
	}
	.adtable{
		border-collapse: collapse;
	}
</style>

<table align="center" valign="top" width="100%" height="100%">
	<tr align="right" height="20px">
		<td>
			<font size="1">
			<a href="<%= request.getContextPath()%>/main.jsp">사용자 홈</a> | 
			<a href="<%= request.getContextPath()%>/login/logout.jsp">로그아웃</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
	<tr align="center" height="40px">
		<td>
			<font size="6" color="#060"><b>Cubby's Cupcake</b></font>
		</td>
	</tr>
	<tr align="center" height="5px">
		<td>
			<font size="2" color="#ff8c00"><b>관리자 페이지</b></font>
		</td>
	</tr>
	<tr>
		<td valign="top">
			<table border="1" align="center" style="margin-top:20px" width="80%">
				<tr align="center" height="30px">
					<td bgcolor="lightgray">
					<a href="admin_main.jsp">관리자 홈</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<a href="admin_catinsert.jsp">카테고리 등록</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<a href="admin_catlist.jsp">카테고리 목록</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<a href="admin_prodinsert.jsp">상품 등록</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<a href="admin_prodlist.jsp">상품 목록</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<a href="admin_ordlist.jsp">주문 내역</a>
					</td>
				</tr>
				<tr align="center">
