<%@page import="java.io.File"%>
<%@page import="product.ProductDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String uploadDir = config.getServletContext().getRealPath("prodimg");
	int imgSize = 1024 * 1024 * 10;
	String encType="UTF-8";
	
	MultipartRequest mr = new MultipartRequest(request,
												uploadDir,
												imgSize,
												encType,
												new DefaultFileRenamePolicy());
	
	ProductDao pd = ProductDao.getInstance();
	int cnt = pd.updateProduct(mr);
	
	String pre_pimage = mr.getParameter("pre_pimage");
	String pimage = mr.getFilesystemName("pimage");
	
	if(pimage != null){
		if(pre_pimage != null){
			File img = new File(uploadDir,pre_pimage);
			
			if(img.exists()){
				img.delete();
			}
		}
	}
	
	String msg,url;
	if(cnt>0){
		msg="상품 수정 성공";
		url="admin_prodlist.jsp";
	}
	else{
		msg="상품 수정 성공";
		url="admin_prodlist.jsp";
	}		
%>
<script type="text/javascript">
	alert("<%= msg %>");
	location.href = "<%= url %>";
</script>
