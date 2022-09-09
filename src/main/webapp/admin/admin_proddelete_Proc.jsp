<%@page import="java.io.File"%>
<%@page import="product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pno = request.getParameter("pno");
	String pimage = request.getParameter("pimage");
	
	ProductDao pd = ProductDao.getInstance();
	int cnt = pd.deleteProduct(pno);
	
	String uploadDir = config.getServletContext().getRealPath("prodimg");
	
	if(pimage != null){
		File img = new File(uploadDir, pimage);
		
		if(img.exists()){
			img.delete();
		}
	}
	
	String msg, url;
	if(cnt>0){
		msg="상품 삭제 성공";
		url="admin_prodlist.jsp";
	}
	else{
		msg="상품 삭제 실패";
		url="admin_prodlist.jsp";
	}
%>
<script type="text/javascript">
	alert("<%= msg %>");
	location.href="<%= url %>";
</script>