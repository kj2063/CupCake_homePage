<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/style.css"/>

<style type="text/css">
	th{
		background: lightgray;
		font-size: small;
		height: 35px;
	}
	.bgth{
		background: gray;
	}
	input[type=text], input[type=email], input[type=password]{
		height:25px;
	}
</style>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript">
	function loginCheck(){
		
		if($("input[name=id]").val() == ""){
			alert("ID를 입력해 주세요");
			$("input[name=id]").focus();
			return false;
		}

		if($("input[name=pw]").val() == ""){
			alert("PW를 입력해 주세요");
			$("input[name=pw]").focus();
			return false;
		}
		
	}
</script>


<% 
	request.setCharacterEncoding("UTF-8");
	String pre_url = request.getParameter("pre_url");
%>

<jsp:include page="login_top.jsp"/>
<form action="loginProc.jsp" post="post">
<table border="1" width="300px" align="center" valign="center" style="background:white; border:3px solid gray;">
	<input type="hidden" name="pre_url" value="<%=pre_url %>">
	<tr>
		<th colspan="2" class="bgth"><font color="white">LOGIN</font></th>
	</tr>
	<tr>
		<th bgcolor="lightgray" width="60" height="30"><font size="2">ID</font></th>
		<td  align="center"><input type="text" name="id" size="15"></td>
	</tr>
	<tr>
		<th bgcolor="lightgray"  width="60" height="30"><font size="2">PW</font></th>
		<td align="center"><input type="password" name="pw" size="15"></td>
	</tr>
	<tr>
		<th colspan="2" class="bgth">
			<input type="submit" value="로그인" style="font-weight: bold" onClick="return loginCheck()"> 
			<input type="button" value="회원가입" style="font-weight: bold" onClick="location.href='register.jsp'"> 
			<input type="button" value="ID 찾기" style="font-weight: bold" onClick="location.href='findid.jsp'"> 
			<input type="button" value="PW 찾기" style="font-weight: bold" onClick="location.href='findpw.jsp'"> 
		</th>
	</tr>
</table>
</form>
<jsp:include page="login_bottom.jsp"/>
