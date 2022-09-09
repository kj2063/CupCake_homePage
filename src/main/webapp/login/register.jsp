<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript">

var checked = false;
var check_res = false;

$(function(){
	
	$("input[type=button]").css("font-weight","bold");
	$("input[type=submit]").css("font-weight","bold");

	$("input[name=id]").keydown(function(){
		$("#idspan").css("display","none");
		checked = false;
		check_res = false;
	})
	
	$("input[name=id_check]").click(function(){	
		
		$.ajax({
			url : "check_id_Proc.jsp",
			data : ({
				input_id : $("input[name=id]").val(),
			}),
			success : function(data){
				checked = true;
				if($.trim(data) == "impossible"){
					$("#idspan").html("<font color='red' style='font-size:small'>중복된 ID입니다</font>");
					$("#idspan").show();
					$("input[name=id]").select();
				}
				else{
					$("#idspan").html("<font color='red' style='font-size:small'>사용 가능한 ID입니다</font>");	
					$("#idspan").show();
					check_res = true;
				}
			}
			
		})//ajax	
	})//id_check click */
})//ready

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



function check(){
	
	if($("input[name=id]").val() == ""){
		alert("ID를 입력해 주세요");
		$("input[name=id]").focus();
		return false;
	}
	
	if(checked == false){
		alert("ID 중복확인을 해주세요");
		return false;
	}
	
	if(check_res == false){
		alert("중복된 ID 입니다");
		$("input[name=id]").select();
		return false;
	}
	
	if($("input[name=pw]").val() == ""){
		alert("비밀번호를 입력해 주세요");
		$("input[name=id]").focus();
		return false;
	}
	
	if($("input[name=email]").val() == ""){
		alert("E-mail을 입력해 주세요");
		$("input[name=email]").focus();
		return false;
	}
	
	if($("input[name=name]").val() == ""){
		alert("이름을 입력해 주세요");
		$("input[name=name]").focus();
		return false;
	}
	
	if($("input[name=rrn1]").val() == ""){
		alert("주민등록번호를 입력해 주세요");
		$("input[name=rrn1]").focus();
		return false;
	}
	
	if($("input[name=rrn2]").val() == ""){
		alert("주민등록번호를 입력해 주세요");
		$("input[name=rrn2]").focus();
		return false;
	}
	if($("input[name=hp1]").val() == ""){
		alert("핸드폰 번호를 입력해 주세요");
		$("input[name=hp1]").focus();
		return false;
	}
	if(isNaN($("input[name=hp1]").val())){
		alert("숫자를 입력해 주세요");
		$("input[name=hp1]").select();
		return false;
	}
	if($("input[name=hp1]").val().length != 3){
		alert("숫자 3자리를 입력해 주세요");
		$("input[name=hp1]").select();
		return false;
	}
	if($("input[name=hp2]").val() == ""){
		alert("핸드폰 번호를 입력해 주세요");
		$("input[name=hp2]").focus();
		return false;
	}
	if(isNaN($("input[name=hp2]").val())){
		alert("숫자를 입력해 주세요");
		$("input[name=hp2]").select();
		return false;
	}
	if($("input[name=hp2]").val().length != 4){
		alert("숫자 4자리를 입력해 주세요");
		$("input[name=hp2]").select();
		return false;
	}
	if($("input[name=hp3]").val() == ""){
		alert("핸드폰 번호를 입력해 주세요");
		$("input[name=hp3]").focus();
		return false;
	}
	if(isNaN($("input[name=hp3]").val())){
		alert("숫자를 입력해 주세요");
		$("input[name=hp3]").select();
		return false;
	}
	if($("input[name=hp3]").val().length != 4){
		alert("숫자 4자리를 입력해 주세요");
		$("input[name=hp3]").select();
		return false;
	}	
	
}//check



</script>
    
    
    
    
    
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

<jsp:include page="login_top.jsp"></jsp:include>
<form action="registerProc.jsp" method="post">
<table border="1" align="center" valign="center" style="background:white; border:3px solid gray;" width="500px">
	<tr> 
		<th colspan="2" style="font-size: medium;" class="bgth"><font color="white">◈ 기본 정보 ◈</font></th>
	</tr>
	<tr>
		<th width="100px">아이디</th>
		<td><input type="text" name="id" size="15"> <input type="button" value="중복확인" name="id_check"> <span id="idspan"></span></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="pw" size="15" onBlur="return pw_check()"><font size="1" style="font-weight: bold"> ※영문 소문자/숫자 조합 3~12자</font></td>
	</tr>
	<tr>
		<th>비밀번호 확인</th>
		<td><input type="password" name="repw" size="15" onkeyup="repw_check()"> <span id="pwspan"></span></td>
	</tr>
	<tr>
		<th>E-mail</th>
		<td><input type="email" name="email" size="15"></td>
	</tr>
	<tr> 
		<th colspan="2" style="font-size: medium;" class="bgth"><font color="white">◈ 개인 신상 정보 ◈</font></th>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" size="15"><font size="1" style="font-weight: bold"> ※성과 이름을 붙여주세요 (예)홍길동</font></td>
	</tr>
	<tr>
		<th>주민등록번호</th>
		<td><input type="text" name="rrn1" size="6"> - <input type="text" name="rrn2" size="6"></td>
	</tr>
	<tr>
		<th>핸드폰 번호</th>
		<td><input type="text" name="hp1" size="3"> - <input type="text" name="hp2" size="4"> - <input type="text" name="hp3" size="4"></td>
	</tr>
	<tr>
		<th colspan="2" class="bgth">
			<input type="submit" value="가입하기" onClick="return check()"> <input type="button" value="취소" onClick="location.href='login.jsp'">
		</th>
	</tr>
</table>
</form>

<jsp:include page="login_bottom.jsp"></jsp:include>