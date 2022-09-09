<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="nb" class="board.NotifyBean"></jsp:useBean>
<jsp:setProperty property="*" name="nb"/>
<%
	String pageNum = request.getParameter("pageNum");
	String nno = request.getParameter("nno");
	
	BoardDao bd = BoardDao.getInstance();
	int cnt = bd.updateNotify(nb);
	
	String msg, url;
	if(cnt>0){
		msg="공지사항 수정 성공";
		url="main_notifyview.jsp?nno="+ nno + "&pageNum=" + pageNum;
	}
	else{
		msg="공지사항 수정 실패";
		url="main_notifyview.jsp?nno=" + nno+ "&pageNum=" + pageNum;
	}
%>
<script type="text/javascript">
	alert("<%= msg %>");
	location.href="<%= url%>";
</script>