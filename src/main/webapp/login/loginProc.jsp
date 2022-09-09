<%@page import="login.AccountBean"%>
<%@page import="login.AccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	

	String pre_url = request.getParameter("pre_url");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	AccountDao ad = AccountDao.getInstance();
	AccountBean user = ad.getMemberInfo(id, pw);
	
	String msg, url;
	if(user == null){
		msg = "로그인 실패! ID 또는 PW를 잘못 입력했습니다";
		url = "login.jsp?pre_url="+pre_url;
	}
	else if(user.getId().equals("admin")){
		int no = user.getNo();
		
		msg = "관리자 ID로 로그인 하였습니다";
		if( pre_url.equals("null") ){
			url = request.getContextPath() + "/main.jsp";
		}
		else{
			url = pre_url;
		}
		session.setAttribute("userId",id);
		session.setAttribute("userNo",no);
		session.setAttribute("userPw",pw);
	}
	else{
		int no = user.getNo();
		
		msg = "로그인 성공";
		if( pre_url.equals("null") ){
			url = request.getContextPath() + "/main.jsp";
		}
		else{
			url = pre_url;
		}
		session.setAttribute("userId",id);
		session.setAttribute("userNo",no);
		session.setAttribute("userPw",pw);
	}
%>
<script type="text/javascript">
	alert("<%= msg %>");
	location.href="<%= url %>";
</script>