<%@page import="login.AccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String userId = (String)session.getAttribute("userId");
	String userPw = (String)session.getAttribute("userPw");
%>
<jsp:useBean id="ab" class="login.AccountBean"></jsp:useBean>
<jsp:setProperty property="*" name="ab"/>
<%
	ab.setId(userId);
	ab.setPw(userPw);

	AccountDao ad = AccountDao.getInstance();
	int cnt = ad.updateAccount(ab);
	
	String msg, url;
	if(cnt>0){
		msg="개인정보 수정 성공";
		url="main_mydata.jsp";
	}
	else{
		msg="개인정보 수정 실패";
		url="main_mydata.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%= url%>";
</script>