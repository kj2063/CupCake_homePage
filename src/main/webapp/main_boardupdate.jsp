<%@page import="board.BoardDao"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String bno = request.getParameter("bno");

	BoardDao bd = BoardDao.getInstance();
	BoardBean bb = bd.getlistByBno(bno);
%>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript">
function check(){
	if($("input[name=subject]").val() == ""){
		alert("제목을 입력해 주세요");
		$("input[name=subject]").focus();
		return false;
	}
	if($("textarea[name=content]").val() == ""){
		alert("내용을 입력해 주세요");
		$("textarea[name=content]").focus();
		return false;
	}
}
</script>


<jsp:include page="main_top.jsp"></jsp:include>
	<td colspan=3 height=400 align=center valign=top>
		
		<form action="main_boardupdate_Proc.jsp" method="post">
		<input type="hidden" name="bno" value="<%= bno %>"/>
		<table height=300 width=600 style="border-collapse: collapse; border-bottom: 2px solid black; margin-bottom: 40;">
			<tr>
				<th style="border-bottom:4px outset gray; font-size: large;" align=left>&nbsp;&nbsp;자유게시판</th>
				<th style="border-bottom:4px outset gray;" align=right>
					<input type="button" value="글 목록" style="font-weight: bold; font-size:x-small;" onClick="location.href='main_board.jsp'">
				</th>
			</tr>
			<tr height=50>
				<th colspan=2><input type="text" name="subject" style="width:590; height:30;" value="<%= bb.getSubject()%>"></th>
			</tr>
			<tr height=250 valign=top>
				<th colspan=2>
					<textarea cols=85 rows=15 style="margin-top:10px; margin-bottom:10px; resize: none;" name="content"><%= bb.getContent()%></textarea>
				</th>
			</tr>
			<tr height="40" valign=top>
				<th colspan=2>
					<input type="submit" value="수정 완료" style="font-weight: bold" onclick="return check()">
					<input type="button" value="취소" style="font-weight: bold" onClick="location.href='main_boardview.jsp?bno=<%= bno %>'">
				</th>
			</tr>
		</table>
		</form>
		
	</td>
<jsp:include page="main_bottom.jsp"></jsp:include>