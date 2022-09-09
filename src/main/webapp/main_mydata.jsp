<%@page import="login.AccountBean"%>
<%@page import="login.AccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String userId = (String)session.getAttribute("userId");
	String userPw = (String)session.getAttribute("userPw");
	
	AccountDao ad = AccountDao.getInstance();
	AccountBean ab = ad.getMemberInfo(userId,userPw);
%>

<jsp:include page="main_top.jsp"></jsp:include>
	<td colspan="3" align="center" height="400" valign=top>
	
	<table width=300>
		<tr>
			<th align="left" colspan=2 style="border-bottom: 2px solid black; font-size: large;">&nbsp;&nbsp;내 정보</th>
		</tr>
		<tr style="font-size: small;" height="30">
			<th width=100 bgcolor="gray" style="color:white">아이디</th>
			<td bgcolor="lightgray">&nbsp;<%=ab.getId() %></td>
		</tr>
		<tr style="font-size: small;" height="30">
			<th bgcolor="gray" style="color:white">이름</th>
			<td bgcolor="lightgray">&nbsp;<%=ab.getName() %></td>
		</tr>
		<tr style="font-size: small;" height="30">
			<th bgcolor="gray" style="color:white">이메일</th>
			<td bgcolor="lightgray">&nbsp;<%=ab.getEmail() %></td>
		</tr>
		<tr style="font-size: small;" height="30">
			<th bgcolor="gray" style="color:white">핸드폰 번호</th>
			<td bgcolor="lightgray">&nbsp;<%=ab.getHp1() %> - <%=ab.getHp2() %> - <%=ab.getHp3() %></td>
		</tr>
		<tr style="font-size: small;" height="30">
			<th bgcolor="gray" style="color:white">가입일</th>
			<td bgcolor="lightgray">&nbsp;<%=ab.getJoindate().substring(0,11) %></td>
		</tr>
	</table>
	<br>
	<input type="button" value="내 정보 수정" style="font-weight: bold" onClick="location.href='main_mydataupdate.jsp'">&nbsp;
	<input type="button" value="비밀번호 변경" style="font-weight: bold" onClick="location.href='main_changepw.jsp'">

	</td>
<jsp:include page="main_bottom.jsp"></jsp:include>	
	