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
	String res = ad.find_account(ab);
	
	if(res == null){
	%>
	<script type="text/javascript">
		alert("해당되는 계정이 없습니다");
		history.go(-1);
	</script>
	<%	
	}
	else{
	%>
	<script type="text/javascript">
		alert("<%= res %>");
		location.href = "login.jsp";
	</script>
	<%
	}
	%>