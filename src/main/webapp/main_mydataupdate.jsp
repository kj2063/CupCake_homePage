<%@page import="login.AccountBean"%>
<%@page import="login.AccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	function check(){
		if(document.forms[0].email.value == ""){
			alert("email을 넣어주세요");
			document.forms[0].email.focus();
			return false;
		}
		if(document.forms[0].hp1.value == ""){
			alert("핸드폰 번호를 입력해주세요");
			document.forms[0].hp1.focus();
			return false;
		}
		if(document.forms[0].hp2.value == ""){
			alert("핸드폰 번호를 입력해주세요");
			document.forms[0].hp2.focus();
			return false;
		}
		if(document.forms[0].hp3.value == ""){
			alert("핸드폰 번호를 입력해주세요");
			document.forms[0].hp3.focus();
			return false;
		}
		
		
		if(document.forms[0].hp1.value.length > 3){
			alert("숫자는 3글자를 넘어가면 안됩니다.");
			document.forms[0].hp1.select();
			return false;
		}
		if(document.forms[0].hp2.value.length > 4){
			alert("숫자는 4글자를 넘어가면 안됩니다.");
			document.forms[0].hp2.select();
			return false;
		}
		if(document.forms[0].hp3.value.length > 4){
			alert("숫자는 4글자를 넘어가면 안됩니다.");
			document.forms[0].hp3.select();
			return false;
		}
	}
</script>    
    
    
<%
	String userId = (String)session.getAttribute("userId");
	String userPw = (String)session.getAttribute("userPw");
	
	AccountDao ad = AccountDao.getInstance();
	AccountBean ab = ad.getMemberInfo(userId,userPw);
%>
<jsp:include page="main_top.jsp"></jsp:include>
	<td colspan="3" align="center" height="400" valign=top>
	
	<form action="main_mydataupdate_Proc.jsp" method="post">
	<table width=400>
		<tr>
			<th align="left" colspan=2 style="border-bottom: 2px solid black; font-size: large;">&nbsp;&nbsp;내 정보 수정</th>
		</tr>
		<tr style="font-size: small;" height="30">
			<th width=100 bgcolor="gray" style="color:white">아이디</th>
			<td bgcolor="lightgray">&nbsp;<%=ab.getId() %></td>
		</tr>
		<tr style="font-size: small;" height="30">
			<th bgcolor="gray" style="color:white">이름</th>
			<td bgcolor="lightgray">&nbsp;<%= ab.getName() %></td>
		</tr>
		<tr style="font-size: small;" height="30">
			<th bgcolor="gray" style="color:white">이메일</th>
			<td bgcolor="lightgray">&nbsp;<input type="email" name="email" value="<%= ab.getEmail()%>" style="height:25"></td>
		</tr>
		<tr style="font-size: small;" height="30">
			<th bgcolor="gray" style="color:white">핸드폰 번호</th>
			<td bgcolor="lightgray">&nbsp;<input type="text" name="hp1" size="3" value="<%=ab.getHp1() %>" style="height:25"> - <input type="text" name="hp2" size="4" value="<%=ab.getHp2() %>" style="height:25"> - <input type="text" name="hp3" size="4" value="<%= ab.getHp3()%>" style="height:25"></td>
		</tr>
	</table>
	<br>
	<input type="submit" value="변경 완료" style="font-weight: bold" onClick="return check()">&nbsp;
	<input type="button" value="취소" style="font-weight: bold" onClick="location.href='main_mydata.jsp'">
	</form>
	
	</td>
<jsp:include page="main_bottom.jsp"></jsp:include>	