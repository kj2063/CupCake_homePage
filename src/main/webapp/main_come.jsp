<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="main_top.jsp"></jsp:include>
	<td align=center colspan="3" height="400" valing="top">
		<table width=1000 style="margin-bottom: 50px; margin-left: 60px; border-bottom:4px double black">
			<tr align=left>
				<th colspan=2 style="border-bottom:4px double black; font-size: large">
					&nbsp;&nbsp;오시는 길
				</th>
			</tr>
			<tr align=center height=350>
				<td width=500>
					<img src="<%= request.getContextPath()%>/images/map.PNG" width="500" height="300" style="border:2px solid black">
				</td>
				<td align="left" style="padding-left:20px" valign="top">
					<br>
					<font size="2">
					<br>
					<b>
					양평역 2번 출구로 나와서 약 100m 직진을 하면 장군집이 보입니다.<br>
					장군집을 끼고 우회전 후 약 100m 직진하면 작은 사거리가 나옵니다.<br>
					사거리 동애빌딩 1층에 매장이 있습니다.<br>
					</b></font>
					<br><br><br><br><br><br><br>
					&nbsp;<b>영업 시간: 12:00 - 22:00</b>
					&nbsp;<b><font color="red" size="1">※매주 월요일은 휴무일 입니다</font></b>				
					<br><br>
					&nbsp;<b>Tel. 0507-1414-7963</b>
				</td>
			</tr>
		</table>
	</td>
<jsp:include page="main_bottom.jsp"></jsp:include>