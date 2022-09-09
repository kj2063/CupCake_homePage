<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.ReplyBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDao"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum="1";
	}
	
	String bno = request.getParameter("bno");	
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY/MM/DD HH:mm");	

	BoardDao bd = BoardDao.getInstance();
	BoardBean bb = bd.getlistByBno(bno);
	
	String userId = (String)session.getAttribute("userId");
%>    
<script type="text/javascript">
	function deletecheck(bno){
		
		var flag = confirm("정말 삭제 하시겠습니까?");
		
		if(flag == true){
			location.href="main_boarddelete_Proc.jsp?bno="+bno+"&pageNum="+<%=pageNum%>;
		}
		
	}
	
	function writecheck(id){
		
		if(id == "null"){
			location.href = "<%= request.getContextPath()%>/login/login.jsp?pre_url=<%= request.getContextPath()%>/main_boardview.jsp?bno=<%=bno%>";
			return false;
		}
		
	}
	
</script>    

<jsp:include page="main_top.jsp"></jsp:include>
	<td colspan=3 height=400 align=center valign=top>
		<table height=300 width=600 style="border-collapse: collapse;">
			<tr>
				<th style="border-bottom:4px outset gray; font-size: large;" align=left>&nbsp;&nbsp;자유게시판</th>
				<th style="border-bottom:4px outset gray;" align=right>
				<% 
				if(userId != null){
					if(userId.equals(bb.getWriter()) || userId.equals("admin")){
				%>
					<input type="button" value="수정" style="font-weight: bold; font-size:x-small;" onClick="location.href='main_boardupdate.jsp?bno=<%= bno %>'">
					<input type="button" value="삭제" style="font-weight: bold; font-size:x-small;" onClick="deletecheck('<%= bno %>')">&nbsp;&nbsp;
				<% 
					}
				}	
				%>
					<input type="button" value="글 목록" style="font-weight: bold; font-size:x-small;" onClick="location.href='main_board.jsp?pageNum=<%= pageNum%>'">
				</th>
			</tr>
			<tr height=25>
				<th colspan=2 bgcolor=#f8f9fa style="border-bottom:1px solid lightgray; font-size: small;" align="left">&nbsp;<%= bb.getSubject() %></th>
			</tr>
			<tr height=20>
				<th align=left style="border-bottom:1px solid lightgray; font-weight: normal; font-size:x-small;">&nbsp;작성자: <font size="1" style="text-decoration: underline;"><%= bb.getWriter() %></font>
				&nbsp;&nbsp;&nbsp;&nbsp;IP: <%= bb.getIp() %></th>
				<th align=right style="border-bottom:1px solid lightgray; font-weight: normal; font-size:x-small;">
				 조회수: <%= bb.getReadcount() %>&nbsp;&nbsp;&nbsp;
				</th>
			</tr>
			<tr height=250 valign=top>
				<th colspan=2>
					<textarea cols=85 rows=15 style="margin-top:10px; margin-bottom:10px; resize: none;" disabled><%= bb.getContent() %></textarea>
				</th>
			</tr>
		</table>
		
		<table style="margin-bottom:60px; border-bottom: 2px solid black; border-collapse: collapse;">
			<tr>
				<th height=35 width=600 align=left colspan=4>
					<form action="main_boardreply_Proc.jsp?pageNum=<%=pageNum %>" method="post">
						<input type="hidden" name="r_writer" value="<%= userId %>">
						<input type="hidden" name="bno" value="<%= bno %>">
						<input type="submit" value="댓글 등록" style="font-weight: bold" onClick="return writecheck('<%= userId %>')">&nbsp;
						<input type="text" name="r_content" style="height:30px; width:500">
					</form>
				</th>
			</tr>
			<tr>
				<th colspan=4 align=left><font size="2">댓글</font></th>
			</tr>
			<% 
			ArrayList<ReplyBean> rlist = bd.getAllReply(bno);
			for( ReplyBean rb : rlist){
			%>
			<tr bgcolor="#f8f9fa" height=20 align=left style="font-size:1;" valign=bottom>
				<th width=70>&nbsp;<%= rb.getR_writer() %></th>
				<td width=100>IP:<%= rb.getR_ip() %></td>
				<td width=100><%= sdf.format(rb.getR_reg_date()) %></td>
				<td align="right">
				<%
				if(userId != null){
					if(rb.getR_writer().equals(userId) || userId.equals("admin")){
				%>
				<a href="main_deleteReply_Proc.jsp?rno=<%= rb.getRno() %>&bno=<%= bno %>&pageNum=<%= pageNum%>">댓글삭제</a>&nbsp;&nbsp;
				<% 
					}
				}	
				%>
				</td>
			</tr>
			<tr valign=top height=25 bgcolor="#f8f9fa">
				<td colspan=4><font size=2>&nbsp;&nbsp;&nbsp;<%= rb.getR_content() %></font></td>
			</tr>
			<% 
			}
			%>
		</table>
		
	</td>
<jsp:include page="main_bottom.jsp"></jsp:include>