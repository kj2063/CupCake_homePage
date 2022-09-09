<%@page import="login.AccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = (String)session.getAttribute("userId");
	String userPw = (String)session.getAttribute("userPw");

	String pw = request.getParameter("pw");

	AccountDao ad = AccountDao.getInstance();
	int cnt = ad.changePw(userId, userPw, pw);
	
	String msg, url;
	if(cnt>0){
		msg="비밀번호 변경 성공";
		url="main_mydata.jsp";
		session.setAttribute("userPw",pw);
	}
	else{
		msg="비밀번호 변경 실패";
		url="main_mydata.jsp";
	}
%>
<script type="text/javascript">
	alert("<%= msg%>");
	location.href="<%= url%>";
</script>