<%@page import="product.ProductDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String uploadDir = config.getServletContext().getRealPath("prodimg");
	int imgSize = 1024 * 1024 * 10;
	String encType = "UTF-8";
	
	MultipartRequest mr = new MultipartRequest(request,
												uploadDir,
												imgSize,
												encType,
												new DefaultFileRenamePolicy());
	
	ProductDao pd = ProductDao.getInstance();
	int cnt = pd.insertProduct(mr);
	
	String msg, url;
	if(cnt > 0){
		msg="상품 추가 성공";	
		url="admin_prodinsert.jsp";
	}
	else{
		msg="상품 추가 실패";	
		url="admin_prodinsert.jsp";	
	}
%>
<script type="text/javascript">
	alert("<%= msg %>");
	location.href = "<%= url %>";
</script>