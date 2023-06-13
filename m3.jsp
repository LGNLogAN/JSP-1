<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="UTF-8">
<title>m3.jsp</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h1>판매현황</h1>
		<table border=1>
			<tr>
				<td>매장코드</td>
				<td>매장명</td> 
				<td>매장별 판매액</td>
			</tr>
			<%
			try{
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
				Statement stmt=con.createStatement();
				String sql = "select th.scode, th.sname, to_char(sum(ts.amount*tp.cost),'999,999,999') as aa" + 
				" FROM tbl_shop_01 th, tbl_salelist_01 ts , tbl_product_01 tp" +
				" where th.scode = ts.scode and tp.pcode = ts.pcode" +
				" GROUP BY th.scode, th.sname" +
				" ORDER BY scode ASC";
				ResultSet rs=stmt.executeQuery(sql);
				
				while(rs.next()){
					out.print("<tr><td>"+rs.getString("scode")+"</td>");
					out.print("<td>"+rs.getString("sname")+"</td>");
					out.print("<td>"+rs.getString("aa")+"원</td></tr>");
					}
				}catch(Exception e){
					e.printStackTrace();
				}
			%>
		</table>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>