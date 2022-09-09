<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String userId = (String)session.getAttribute("userId");
	String userPw = (String)session.getAttribute("userPw");

%>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript">
	function check(){
		if($("input[name=pre_pw]").val() != <%=userPw%>){
			alert("입력하신 현재 비밀번호가 해당 계정의 비밀번호와 일치하지 않습니다.");
			$("input[name=pre_pw]").select();
			return false;
		}
		
		
	}
	
	function pw_check(){
		
		var pw = $("input[name=pw]").val();
		
		var regexp = /^[a-z0-9]{3,12}$/;
		var chk_num =  pw.search(/^[0-9]{3,12}$/);	
		var chk_eng =  pw.search(/^[a-z]{3,12}$/);
		

		if(pw.search(regexp) == -1){
			alert("3~12자리의 영소문자/숫자를 조합해 주세요");
		}
		if(chk_num == 0 || chk_eng == 0){
			alert("3~12자리의 영소문자/숫자를 조합해 주세요");
			return false;
		}
		
	}
	
	function repw_check(){
		if($("input[name=pw]").val() == $("input[name=repw]").val()){
			$("#pwspan").html("<font style='font-size:small'>비밀번호가 일치 합니다</font>");
		}
		else{
			$("#pwspan").html("<font color='red' style='font-size:small'>비밀번호가 일치 하지 않습니다</font>");
		}
	}
	
</script>
    
<jsp:include page="main_top.jsp"></jsp:include>
	<td colspan="3" align="center" height="400" valign=top>
	
<form action="main_changepw_Proc.jsp" method="post">    
	<table width=550 style="border-collapse: collapse; border-bottom:2px solid black">
		<tr>
			<th align="left" colspan=2 style="border-bottom: 2px solid black; font-size: large;">&nbsp;&nbsp;비밀번호 변경</th>
		</tr>
		<tr style="border-bottom:1px solid black">
			<th width="150" style="background:gray; color:white; font-size: small" height="35">현재 비밀번호</th>
			<td bgcolor="lightgray">&nbsp;<input type="password" name="pre_pw" style="height:25"></td>
		</tr>
		<tr>
			<th  style="background:gray; color:white; font-size: small" height="35">변경 비밀번호</th>
			<td bgcolor="lightgray">&nbsp;<input type="password" name="pw" style="height:25" onblur="return pw_check()"></td>
		</tr>
		<tr>
			<th  style="background:gray; color:white; font-size: small" height="35">변경 비밀번호 확인</th>
			<td bgcolor="lightgray">&nbsp;<input type="password" name="repw" style="height:25" onkeyup="repw_check()"> <span id="pwspan"></span></td>
		</tr>		
	</table>
	<br>
	<input type="submit" value="완료" style="font-weight: bold" onClick="return check()">&nbsp;
	<input type="button" value="취소" style="font-weight: bold" onClick="location.href='main_mydata.jsp'">
	</form>
	
	
	</td>
<jsp:include page="main_bottom.jsp"></jsp:include>	
	