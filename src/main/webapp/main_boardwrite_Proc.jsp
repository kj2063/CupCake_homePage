<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bb" class="board.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="bb"/>
<% 
	String ip = request.getRemoteAddr();
	bb.setIp(ip);
	
	BoardDao bd = BoardDao.getInstance();
	int cnt = bd.insertlist(bb);
	
	String msg,url;
	if(cnt>0){
		msg="게시글 작성 성공";
		url="main_board.jsp";		
	}
	else{
		msg="게시글 작성 실패";	
		url="main_board.jsp";
	}
%>
<script type="text/javascript">
	alert("<%= msg %>");
	location.href="<%= url%>";
</script>
    