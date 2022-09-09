<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String bno = request.getParameter("bno");
%>
<jsp:useBean id="bb" class="board.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="bb"/>
<%
	BoardDao bd = BoardDao.getInstance();
	int cnt = bd.updatelist(bb);
	
	String msg, url;
	if(cnt > 0){
		msg="글 수정 성공";
		url="main_boardview.jsp?bno="+bno;
	}
	else{
		msg="글 수정 실패";
		url="main_boardview.jsp?bno="+bno;	
	}
%>
<script type="text/javascript">
	alert("<%= msg%>");
	location.href="<%= url%>";
</script>
