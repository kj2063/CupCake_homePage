<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript">
	function check(){
		if($("input[name=name]").val() == ""){
			alert("이름을 입력 해주세요");
			$("input[name=name]").focus();
			return false;
		}
		if($("input[name=rrn1]").val() == ""){
			alert("주민번호를 입력 해주세요");
			$("input[name=rrn1]").focus();
			return false;
		}
		if(isNaN($("input[name=rrn1]").val())){
			alert("올바른 주민번호(숫자)를 입력 해주세요");
			$("input[name=rrn1]").select();
			return false;
		}
		if($("input[name=rrn2]").val() == ""){
			alert("주민번호를 입력 해주세요");
			$("input[name=rrn2]").focus();
			return false;
		}
		if(isNaN($("input[name=rrn2]").val())){
			alert("올바른 주민번호(숫자)를 입력 해주세요");
			$("input[name=rrn2]").select();
			return false;
		}
		
	}
</script>
    
<jsp:include page="login_top.jsp"></jsp:include>

<form action="findProc.jsp" post="post">
<table border="1" width="300px" align="center" valign="center" style="background:white; border:3px solid gray;">
	<tr>
		<th colspan="2" class="bgth"><font color="white">아이디 찾기</font></th>
	</tr>
	<tr>
		<th bgcolor="lightgray" width="60" height="30"><font size="2">이름</font></th>
		<td  align="center"><input type="text" name="name" size="15"></td>
	</tr>
	<tr>
		<th bgcolor="lightgray"  width="60" height="30"><font size="2">주민등록번호</font></th>
		<td align="center"><input type="text" name="rrn1" size="7"> - <input type="text" name="rrn2" size="7"></td>
	</tr>
	<tr>
		<th colspan="2" class="bgth">
			<input type="submit" value="확인" style="font-weight: bold" onClick="return check()"> 
			<input type="button" value="취소" style="font-weight: bold" onClick="location.href='login.jsp'"> 
		</th>
	</tr>
</table>
</form>

<jsp:include page="login_bottom.jsp"></jsp:include>