<%@page import="board.NotifyBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	String nno = request.getParameter("nno");
	String pageNum =request.getParameter("pageNum");	

	BoardDao bd = BoardDao.getInstance();
	NotifyBean nb = bd.getNotifyByNno(nno);
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
		
		<form action="main_notifyupdate_Proc.jsp" method="post">
		<input type="hidden" name="nno" value="<%= nno %>">
		<input type="hidden" name="pageNum" value="<%= pageNum %>">
		<table height=300 width=600 style="border-collapse: collapse; border-bottom: 4px inset gray; margin-bottom: 40px">
			<tr>
				<th style="border-bottom:4px outset gray; font-size: large;" align=left>&nbsp;&nbsp;공지사항</th>
				<th style="border-bottom:4px outset gray;" align=right>
					<input type="button" value="글 목록" style="font-weight: bold; font-size:x-small;" onClick="location.href='main_notify.jsp'">
				</th>
			</tr>
			<tr height=40 valign="bottom">
				<th colspan=2 style="font-size:medium;" align="left">
					<select name="spec" style="height:30px">
						<option value="공지사항" <%if(nb.getSpec().equals("공지사항")){%>selected<%}%>>공지사항</option>
						<option value="이벤트" <%if(nb.getSpec().equals("이벤트")){%>selected<%}%>>이벤트</option>
					</select>
					&nbsp;&nbsp;<input type="text" name="subject" value="<%=nb.getSubject() %>" style="height:30px; width:500">
				</th>
			</tr>
			<tr height=250 valign=top>
				<th colspan=2>
					<textarea cols=85 rows=15 style="margin-top:10px; margin-bottom:10px; resize: none;" name="content"><%= nb.getContent() %></textarea>
				</th>
			</tr>
			<tr height="40" valign=top>
				<th colspan=2>
					<input type="submit" value="수정 완료" style="font-weight: bold" onclick="return check()">
					<input type="button" value="취소" style="font-weight: bold" onClick="location.href='main_notifyview.jsp?nno=<%= nno%>'">
				</th>
			</tr>
		</table>
		</form>
		
	</td>
<jsp:include page="main_bottom.jsp"></jsp:include>