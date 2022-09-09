<%@page import="login.AccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String input_id = request.getParameter("input_id");
	
	AccountDao ad = AccountDao.getInstance();
	boolean flag = ad.check_id_dup(input_id);
	
	if(flag == true){
		out.print("impossible");
	}
	else{
		out.print("possible");
	}
%>
