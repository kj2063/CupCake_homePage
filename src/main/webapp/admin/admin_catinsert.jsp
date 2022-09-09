<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	function check(){
		if(document.forms[0].cname.value == ""){
			alert("카테고리 이름을 입력해 주세요");
			document.forms[0].cname.focus();
			return false;
		}
	}

</script>    


<jsp:include page="admin_top.jsp"></jsp:include>
	<td height="380px">
		<form action="admin_catinsert_Proc.jsp" method="post">
		<table width="300px" height="100px" border="2" class="adtable">
			<tr>
				<th colspan="2" bgcolor="gray" style="font-size:medium;color:white;" height="30px">
					카테고리 등록
				</th>
			</tr>
			<tr>
				<th bgcolor="lightgray" style="font-size:small;" width="60px">카테고리 이름</th>
				<td align="center"><input type="text" name="cname" style="height:25px"></td>
			</tr>
			<tr>
				<th colspan="2" height="30px" bgcolor="gray" style="font-weight: bold">
					<input type="submit" value="등록" style="font-weight: bold; width:60px;" onclick="return check()"> 
				</th>
			</tr>
		</table>
		</form>
	</td>
<jsp:include page="admin_bottom.jsp"></jsp:include>