<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.NotifyBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	String userId = (String)session.getAttribute("userId");
	
	int currentPage = Integer.parseInt(pageNum);

	int showrow = 10;
	
	int startrow = (currentPage-1)*showrow + 1;
	int endrow = startrow + showrow - 1;
	
	BoardDao bd = BoardDao.getInstance();
	int count = bd.countNotify();
	
	int number = count - ((currentPage - 1)*showrow);
	ArrayList<NotifyBean> nlist = bd.getNotify(startrow, endrow);
%>
<jsp:include page="main_top.jsp"></jsp:include>
	<td align=center colspan="3" height="400" valign="top">
		
		<table style="border-collapse: collapse; border-bottom: 2px solid black; margin-bottom:5px" width=550>
			<tr style="border-bottom: 2px solid black; font-size: large;">
				<th colspan=2 align="left">&nbsp;&nbsp;공지사항</th>
				<th align="right">
				<% 
				if(userId != null){
					if(userId.equals("admin")){
				%>
					<input type="button" value="게시글 작성" style="font-weight: bold; font-size: x-small;" onClick="location.href='main_notifyinsert.jsp'">
				<% 
					}
				}
				%>
				</th>
			</tr>
			<tr height="25">
				<th width= 50 style="font-size:small">NO</th>
				<th style="font-size:small">제목</th>
				<th width=150 style="font-size:small">작성일</th>
			</tr>
		<% 
		for(NotifyBean nb : nlist){
		%>
			<tr style="font-size: small; border-top:1px solid gray" height="30">
				<td align="center"><%= number-- %></td>
				<td>
					<% 
					if(nb.getSpec().equals("공지사항")){
					%>
					<font color="red">[<%= nb.getSpec()%>]</font>
					<% 
					}
					else{
					%>
					<font color="blue">[<%= nb.getSpec()%>]</font>
					<% 
					}
					%>
					<a href="main_notifyview.jsp?nno=<%= nb.getNno()%>&pageNum=<%= pageNum %>" class="a3"><%= nb.getSubject() %></a>
				</td>
				<td align="center"><%= sdf.format(nb.getReg_date())%></td>				
			</tr>
		<% 
		}
		%>	
		</table>
		<% 
		int tot_page = count/showrow + (count % showrow == 0? 0 : 1); 

		int pageblock = 5;
		
		int startpage = ((currentPage-1)/pageblock * pageblock) + 1;
		int endpage = startpage + pageblock -1;
		
		if(endpage > tot_page){
			endpage = tot_page;
		}
		if(startpage > pageblock){
		%>
		<a href="main_notify.jsp?pageNum=<%= startpage-1 %>" class="a3"><font size=2>[이전]</font></a>
		<%	
		}
		for(int i=startpage; i<=endpage; i++){
		%>
		<a href="main_notify.jsp?pageNum=<%= i %>" class="a3">
		<%if(Integer.parseInt(pageNum) == i){ %>
			<font size=2 style="text-decoration:underline;"><%= i %></font>
		<%}else{%>
			<font size=2><%= i %></font>
		<%}%>
		</a>	
		<%	
		}
		if(endpage < tot_page){
		%>
		<a href="main_notify.jsp?pageNum=<%= endpage+1 %>" class="a3"><font size=2>[다음]</font></a>	
		<%	
		}
		%>
		<br><br><br>
		
	</td>
<jsp:include page="main_bottom.jsp"></jsp:include>