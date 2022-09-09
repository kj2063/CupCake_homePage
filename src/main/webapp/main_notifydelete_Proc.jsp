<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String nno = request.getParameter("nno");
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	BoardDao bd = BoardDao.getInstance();
	int cnt = bd.deleteNotify(nno);
	
	int showrow = 10;
	int count = bd.countNotify();
	int pageCount = count / showrow + (count % showrow == 0 ? 0 : 1);
	
	
	String msg=null,url=null;
	if(cnt>0){
		msg="공지사항 글 삭제 성공";
		if(pageNum > pageCount){
			url="main_notify.jsp?pageNum="+(pageNum-1);		
		}
		else{
			url="main_notify.jsp?pageNum="+pageNum;
		}
	}
%>
<script type="text/javascript">
	alert("<%= msg %>");
	location.href="<%= url %>";
</script>
