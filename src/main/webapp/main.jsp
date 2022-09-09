<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.NotifyBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDao"%>
<%@page import="java.util.Vector"%>
<%@page import="product.ProductDao"%>
<%@page import="product.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ProductDao pd = ProductDao.getInstance();
	Vector<ProductBean> new_list = pd.getNewProduct();
	
	int img_count = new_list.size(); 
%>
<style type="text/css">
	.imgdiv{
		width:<%= img_count *150%>px;
		height:180px;
	}
	.regdiv{
		width:150;
		height:170px;
		overflow:hidden;
		border-top:6px double black;
		border-bottom:6px double black;
	}
</style>

<script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		var count=1;
		function move(){
			count++;
			
			if(count==<%=img_count+1%>){
				$("div>img:first-child").animate({marginLeft : "+=<%= 155*(img_count-1) %>px"},500);
				count=1;
			}
			else{
				$("div>img:first-child").animate({marginLeft : "-=155px"},500);
			}
		}
		
		window.setInterval(move,3000);
	});
</script>
    
<jsp:include page="main_top.jsp"></jsp:include>
	<td colspan="3" align="center" height="400">
		<table width=1000 height="550" style="margin-bottom:70; margin-top:20; border-spacing: 15px">
			<tr>
				<td rowspan=3 width=395 align=right bgcolor="lightgray"><img src="<%= request.getContextPath()%>/images/Home.jpg" width="370" height="480"></td>
				<td bgcolor="white" align=left><img style="border:2px solid gray" src="<%=request.getContextPath()%>/images/wellcome.gif" width="250" height="200"></td>
				<td align="left" width=150 height=200px valign=bottom>
					<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="4">NEW</font></b>
					<br>
					<div class="regdiv">
						<div class="imgdiv">
						<%
						for(ProductBean pb : new_list){
						%>
						<img src="<%= request.getContextPath() %>/prodimg/<%= pb.getPimage() %>" width="150" height="170" onClick="location.href='main_prodview.jsp?pno=<%= pb.getPno()%>'">
						<%
						}
						%>
						</div>	
					</div>
				</td>
			</tr>
			<tr>
				<td bgcolor="lightgray" colspan=2 height=240 align=center>
					
					<table style=" background:white; border-collapse: collapse; border:2px solid gray"><tr><td>
					<table style="border-collapse: collapse; margin:5px; margin-left:10px; margin-right: 10px" width=500>
						<tr align=left>
							<th colspan=2 style="border-bottom: 2px solid black">&nbsp;&nbsp;공지사항</th>
						</tr>
						<tr style="font-size: small;" height=20px>
							<th>제목</th>
							<th>게시일</th>
						</tr>
						<% 
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
						
						BoardDao bd = BoardDao.getInstance();
						ArrayList<NotifyBean> nlist = bd.getNotify(1,5);

						for(NotifyBean nb : nlist){
						%>
						<tr style="border-top:1px solid gray; font-size:small;" height=28px>
							<td align=left>
							<% 
							if(nb.getSpec().equals("공지사항")){
							%>
							<font color="red">[공지사항]</font>
							<% 
							}
							else{
							%>	
							<font color="blue">[이벤트]</font>
							<% 
							}
							%>
							<a href="main_notifyview.jsp?nno=<%= nb.getNno()%>" class="a3">
							<%= nb.getSubject() %>
							</a>
							</td>
							<td width=150 align=center><%= sdf.format(nb.getReg_date()) %></td>
						</tr>
						<% 
						}
						%>
					</table>
					</td></tr></table>
					
				</td>
			</tr>
			<tr>
				<td colspan=2></td>
			</tr>
		</table>
		
	</td>
<jsp:include page="main_bottom.jsp"></jsp:include>