<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String bno = request.getParameter("bno");
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
	
	BoardDao bd = BoardDao.getInstance();
	int cnt = bd.deletelist(bno);
	
	int showlist = 10;
	int count = bd.countlist();
	int pageCount = count / showlist + (count % showlist == 0 ? 0 : 1);
	
	String msg, url;
	if(cnt>0){
		msg="글 삭제 성공";
		if(pageNum > pageCount){
			url="main_board.jsp?pageNum="+(pageNum-1);
		}
		else{
			url="main_board.jsp?pageNum="+pageNum;	
		}
	}
	else{
		msg="글 삭제 실패";
		url="main_board.jsp?pageNum="+pageNum;
	}
%>
<script type="text/javascript">
	alert("<%= msg%>");
	location.href="<%= url %>";
</script>