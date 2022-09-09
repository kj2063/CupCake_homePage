<%@page import="javax.imageio.plugins.tiff.GeoTIFFTagSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
	BoardDao bd = BoardDao.getInstance();
	String userId = (String)session.getAttribute("userId");

	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	int showrow = 10;// 한페이지에 보일 글 갯수
	
	int currentPage = Integer.parseInt(pageNum); //현재 페이지 번호
		
	int countlist = bd.countlist(); // 전체 글 갯수
	
	int startrow = 1 + ( (currentPage-1) * showrow );
	int endrow = (currentPage * showrow);
	
	ArrayList<BoardBean> list = new ArrayList<BoardBean>(); 
	list = bd.getList(startrow, endrow);
	
	int number = countlist - ( (currentPage-1)*showrow );
%>

<script type="text/javascript">
	function writecheck(id){
		
		if(id == "null"){
			location.href = "<%= request.getContextPath()%>/login/login.jsp?pre_url=<%= request.getContextPath()%>/main_board.jsp";
		} else {
			location.href = "main_boardwrite.jsp";
		}
		
	}
</script>
    
<jsp:include page="main_top.jsp"></jsp:include>
	<td align=center colspan="3" height="400" valign=top>
		
		<table width=700 style="border-collapse: collapse; border-bottom: 2px solid black; margin-bottom:5px">
			<tr style="border-bottom:2px solid black">
				<th colspan=3 style="font-size:large" align="left">&nbsp;&nbsp;자유게시판</th>
				<th colspan=2 align="right"><input type="button" value="게시글 작성" style="font-weight: bold; font-size: x-small;" onClick="writecheck('<%=userId%>')"></th>
			</tr>
			<tr style="border-bottom:1px solid gray; font-size:small" height="25px">
				<th width="50">NO</th>
				<th width="350">제목</th>
				<th width="100">글쓴이</th>
				<th width="150">작성시간</th>
				<th width="50">조회수</th>
			</tr>
			<% 
			for(BoardBean bb : list){
			%>
			<tr height="30px" style="border-bottom: 1px solid gray; font-size:small;" align="center">
				<td><%= number-- %></td>
				<td align="left"><a href="main_boardview.jsp?bno=<%= bb.getBno()%>&pageNum=<%= currentPage %>" class="a3"><%= bb.getSubject() %></a></td>
				<td><%= bb.getWriter()%></td>
				<td><%= sdf.format(bb.getReg_date()) %></td>
				<td><%= bb.getReadcount()%></td>				
			</tr>
			<% 
			}
			%>
		</table>
<% 
	if(countlist>0){
		int pagecount = countlist/showrow + (countlist % showrow == 0? 0 : 1); 
		int pageblock = 5;
		
		int startPage = 1 + ( (currentPage-1)/pageblock * pageblock );
		int endPage = startPage + pageblock - 1;
		
		if(endPage > pagecount){
			endPage = pagecount;
		}
		
		if(startPage > pageblock){
		%>
			<a href="main_board.jsp?pageNum=<%= startPage - 1 %>" class="a3"><font size="2">[이전]</font></a>
		<%		
		}
		for(int i = startPage; i<=endPage; i++){
		%>
			<a href="main_board.jsp?pageNum=<%= i %>" class="a3">
				<%if(Integer.parseInt(pageNum) == i){ %>
				<font size="2" style="text-decoration: underline;"><%= i %></font>
				<%}
				else{
				%>
				<font size="2"><%= i %></font>
				<%}%>
			</a>
		<%	
		}
		if(endPage < pagecount){
		%>
			<a href="main_board.jsp?pageNum=<%= endPage + 1 %>" class="a3"><font size="2">[다음]</font></a>
		<%	
		}
	}	
%>
	<br><br><br>	
		
	</td>
<jsp:include page="main_bottom.jsp"></jsp:include>