<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String userId = (String)session.getAttribute("userId");
%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style.css"/>
<style type="text/css">
	.top{
		text-decoration:none;
		color:green;
	}
	.top:hover{
		text-decoration:underline;
		color:orange;
	}
	.a2{
		color:black;
		font-weight: bold;
		text-decoration: none;
	}
	.a2:hover{
		color:#ff8c00;	
	}
	.a1{
		color:#ff8c00;
		font-weight: bold;
		text-decoration: none;
	}
	.a1:hover{
		color:#ffdab9;
	}
	.a3{
		color:black;
		text-decoration: none;
	}
	.a3:hover{
		color:#ff8c00;
	}

</style>
<table width="100%" style="font-family:돋음체;" class="maintable">
	<tr>
		<%-- <td colspan=3 valign="top" align="right"><font size="1"><a href="<%=request.getContextPath()%>/login/login.jsp">로그인</a></font></td> --%>
		<td colspan=3 valign="top" align="right"><font size="1">
		<% 
		if(userId != null){
			if(userId.equals("admin")){
		%>	
			<%=userId%>님 <a href="<%= request.getContextPath() %>/admin/admin_main.jsp" class="top">관리자 홈</a> | 
			<a href="<%= request.getContextPath()%>/login/logout.jsp" class="top">로그아웃</a>&nbsp;&nbsp;
			</font></td>
		<%		
			}
			else{
		%>
			
			<%=userId%>님 
			<a href="main_mydata.jsp" class="top">내정보</a> | 
			<a href="main_cart.jsp" class="top">장바구니</a> | 
			<a href="main_ordlist.jsp" class="top">주문확인</a> | 
			<a href="<%= request.getContextPath()%>/login/logout.jsp" class="top">로그아웃</a>&nbsp;&nbsp;
			</font></td>
		<% 
			}
		}
		else{
		%>
			[&nbsp;<a href="<%=request.getContextPath()%>/login/login.jsp" class="top">LOGIN</a>&nbsp;]&nbsp;&nbsp;</font></td>
		<% 
		}
		%>
	</tr>
	<tr bgcolor="#D3D3D3">
		<td rowspan=2 width="100" class="logo_img">
			<a href="main.jsp"><img src="images/logo.png" width="100" height="100"></a>
		</td>
		<td colspan=2 align="center" valign="bottom" height="50" style="border-bottom:6px inset #5F5F5F; font-size:1;">
			<table width="60%">
				<tr align="center" valign="bottom" class="menu maintable">
					<td><a href="main.jsp" class="a2">HOME</a></td>
					<td><a href="main_come.jsp" class="a2">오시는 길</a></td>
					<td><a href="main_menu.jsp" class="a2">메뉴/주문예약</a></td>
					<td><a href="main_board.jsp" class="a2">자유게시판</a></td>
					<td><a href="main_notify.jsp" class="a2">공지사항</a></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td width="150px">
		</td>
		<td>
		</td>
	</tr>
	<tr>
	