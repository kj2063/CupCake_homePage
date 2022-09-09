<%@page import="board.NotifyBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String userId = (String)session.getAttribute("userId");
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum="1";
	}
	
	String nno = request.getParameter("nno");
	BoardDao bd = BoardDao.getInstance();
	NotifyBean nb = bd.getNotifyByNno(nno);
%>
    
<jsp:include page="main_top.jsp"></jsp:include>
	<td colspan=3 height=400 align=center valign=top>
		<table height=300 width=600 style="border-collapse: collapse; border-bottom: 4px inset gray">
			<tr>
				<th style="border-bottom:4px outset gray; font-size: large;" align=left>&nbsp;&nbsp;공지사항</th>
				<th style="border-bottom:4px outset gray;" align=right>
				<%
				if(userId != null){
					if(userId.equals("admin")){
				%>
					<input type="button" value="수정" style="font-weight: bold; font-size:x-small;" onClick="location.href='main_notifyupdate.jsp?nno=<%= nno %>&pageNum=<%= pageNum%>'">
					<input type="button" value="삭제" style="font-weight: bold; font-size:x-small;" onClick="location.href='main_notifydelete_Proc.jsp?nno=<%= nno%>&pageNum=<%= pageNum%>'">&nbsp;&nbsp;
				<% 
					}
				}	
				%>
					<input type="button" value="글 목록" style="font-weight: bold; font-size:x-small;" onClick="location.href='main_notify.jsp?pageNum=<%=pageNum%>'">
				</th>
			</tr>
			<tr height=25>
				<th colspan=2 bgcolor=#f8f9fa style="border-bottom:1px solid lightgray; font-size: small;" align="left">
				&nbsp;
				<% 
				if(nb.getSpec().equals("공지사항")){
				%>
				<font color="red">[공지사항]</font>
				<% 
				}
				else{
				%>
				<font color="blue">[이벤트]</font>
				<% 
				}
				%>
				<%= nb.getSubject() %>
				</th>
			</tr>
			<tr height=250 valign=top>
				<th colspan=2>
					<textarea cols=85 rows=15 style="margin-top:10px; margin-bottom:10px; resize: none;" disabled><%= nb.getContent() %></textarea>
				</th>
			</tr>
		</table>
		
	</td>
<jsp:include page="main_bottom.jsp"></jsp:include>