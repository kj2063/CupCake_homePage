<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String rno = request.getParameter("rno");
	String bno = request.getParameter("bno");
	String pageNum = request.getParameter("pageNum");

	BoardDao bd = BoardDao.getInstance();
	int cnt = bd.deleteReply(rno);
	
	String msg= null, url=null;
	if(cnt>0){
		msg="댓글 삭제 성공";
		url="main_boardview.jsp?bno="+ bno +"&pageNum="+pageNum;
	}
%>
<script type="text/javascript">
	alert("<%= msg%>");
	location.href="<%= url%>";
</script>