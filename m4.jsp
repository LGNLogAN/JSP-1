<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="UTF-8">
<title>m4.jsp</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h1>상품별 판매액</h1>
		<table border=1;>
			<tr>
				<td>상품코드</td>
				<td>상품명</td>
				<td>상품별 판매액</td>
			</tr>
			
			<%
			try{
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
				Statement stmt=con.createStatement();
				String sql = "select tp.pcode, tp.name, to_char(sum(ts.amount*tp.cost),'999,999,999') as aa" + 
				" FROM tbl_salelist_01 ts , tbl_product_01 tp" +
				" where tp.pcode = ts.pcode" +
				" GROUP BY tp.pcode, tp.name" +
				" ORDER BY pcode ASC";
				ResultSet rs=stmt.executeQuery(sql);
				
				while(rs.next()){
					out.print("<tr><td>"+rs.getString("pcode")+"</td>");
					out.print("<td>"+rs.getString("name")+"</td>");
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