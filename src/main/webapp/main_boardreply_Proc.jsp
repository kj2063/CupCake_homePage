<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="rb" class="board.ReplyBean"></jsp:useBean>
<jsp:setProperty property="*" name="rb"/>
<%
	String bno = request.getParameter("bno");
	String pageNum = request.getParameter("pageNum");

	String ip = request.getRemoteAddr();
	rb.setR_ip(ip);
	
	BoardDao bd = BoardDao.getInstance();
	int cnt = bd.insertReply(rb);
	
	String msg, url;
	if(cnt>0){
		msg="댓글 입력 완료";
		url="main_boardview.jsp?bno="+bno+"&pageNum="+pageNum;
	}
	else{
		msg="댓글 입력 실패";
		url="main_boardview.jsp?bno="+bno+"&pageNum="+pageNum;	
	}
%>
<script type="text/javascript">
	alert("<%= msg%>");
	location.href="<%= url%>";
</script>