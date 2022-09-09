<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="nb" class="board.NotifyBean"></jsp:useBean>
<jsp:setProperty property="*" name="nb"/>
<%
	BoardDao bd = BoardDao.getInstance();
	int cnt = bd.insertNotify(nb);
	
	String msg, url;
	if(cnt>0){
		msg="공지사항 글 작성 성공";
		url="main_notify.jsp";
	}
	else{
		msg="공지사항 글 작성 실패";
		url="main_notify.jsp";
	}		
%>
<script type="text/javascript">
	alert("<%= msg%>");
	location.href="<%= url%>";
</script>