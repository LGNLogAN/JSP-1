<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action</title>
</head>
<body>
<%
	String saleno=request.getParameter("saleno");
	String pcode=request.getParameter("pcode");
	String saledate=request.getParameter("saledate");
	String scode=request.getParameter("scode");
	String amount=request.getParameter("amount");
	
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con=DriverManager.getConnection
				("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		Statement stmt=con.createStatement();
		String sql=" insert into tbl_salelist_01"+ 
				   " values("+saleno+",'"+pcode+"','"+saledate+"','"+scode+"','"+amount+"')";
		stmt.executeUpdate(sql);
		response.sendRedirect("m1.jsp");
	}catch(Exception e){
		e.printStackTrace();
	}


%>
</body>
</html>