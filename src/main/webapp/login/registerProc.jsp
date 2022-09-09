<%@page import="login.AccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="ab" class="login.AccountBean"></jsp:useBean>
<jsp:setProperty property="*" name="ab"/>
<%
	AccountDao ad = AccountDao.getInstance();
	int cnt = ad.insertAccount(ab);
	
	String msg, url;
	if(cnt>0){
		msg="가입 성공";
		url= "login.jsp";
	%>
		<script type="text/javascript">
			alert("<%= msg %>");
			location.href="<%= url %>";
		</script>
	<%	
	}
	else{
		msg="가입 실패";
	%>
		<script type="text/javascript">
			alert("<%= msg %>");
			history.go(-1);
		</script>
	<%
	}
%>
