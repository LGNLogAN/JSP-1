<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="UTF-8">
<title>m2.jsp</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h1>판매현황</h1>
		<table border=1>
			<tr>
				<td>비번호</td>
				<td>상품코드</td>
				<td>판매날짜</td>
				<td>매장코드</td>
				<td>상품명</td>
				<td>판매수량</td>
				<td>총판매액</td>
			</tr>
			<%
			try{
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
				Statement stmt=con.createStatement();
				String sql = "select ts.saleno, ts.pcode, to_char(ts.saledate , 'YYYY-MM-DD') as date1,  ts.scode, tp.name, ts.amount, "+
				" to_char(ts.amount*tp.cost,'999,999,999') as total " + 
				" from tbl_salelist_01 ts, tbl_product_01 tp " + " where ts.pcode = tp.pcode";
				ResultSet rs=stmt.executeQuery(sql);
				
				while(rs.next()){
					out.print("<tr><td>"+rs.getString("saleno")+"</td>");
					out.print("<td>"+rs.getString("pcode")+"</td>");
					out.print("<td>"+rs.getString("date1")+"</td>");
					out.print("<td>"+rs.getString("scode")+"</td>");
					out.print("<td>"+rs.getString("name")+"</td>");
					out.print("<td>"+rs.getString("amount")+"개</td>");
					out.print("<td>"+rs.getString("total")+"원</td></tr>");
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