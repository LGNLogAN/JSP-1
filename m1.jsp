<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="UTF-8">
<script type="text/javascript">
	function aaa(){
		if(document.frm.saleno.value.length != 6){
			alert("판매번호가 입력되지않았거나. 길이에 충족되지않았습니다");
			frm.saleno.focus();
			return false;
		}
		if(document.frm.pcode.value.length != 4){
			alert("상품코드가 입력되지않았거나. 길이에 충족되지않습니다.")
			frm.pcode.focus();
			return false;
		}
		if(document.frm.saledate.value.length != 8){
			alert("YYYY-MM-DD 형식으로 입력해세요")
			frm.saledate.focus();
			return false;
		}
		if(document.frm.scode.value.length != 4){
			alert("매장코드가 입력되지않았거나. 길이에 충족되지않습니다.")
			frm.scode.focus();
			return false;
		}
		if(document.frm.amount.value.length == 0){
			alert("판매수량이 입력되지않았거나. 0 이상의 값을 적어주세요")
			frm.amount.focus();
			return false;
		}
		success();
		return true;
	}
	
	function success(){
		alert("등록이 완료되었습니다.");
	}
	
	function bbb(){
		/* window.location="";*/
		alert("판매등록을 초기화합니다");
		frm.saleno.focus();
	}
</script>
<title>m1.jsp</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h1>판매등록</h1>
		<form name="frm" action="action.jsp">
		<table border=1>
			<tr>
				<td>비번호</td>
				<td><input type="text" name="saleno"></td>
			</tr>
			<tr>
				<td>상품코드</td>
				<td><input type="text" name="pcode"></td>
			</tr>
			<tr>
				<td>판매날짜</td>
				<td><input type="text" name="saledate"></td>
			</tr>
			<tr>
				<td>매장코드</td>
				<td><input type="text" name="scode"></td>
			</tr>
			<tr>
				<td>판매수량</td>
				<td><input type="text" name="amount"></td>
			</tr>
			<tr>
				<td colspan=2>
					<input type="submit" value="등록" onclick="return aaa()">
					<input type="reset" value="다시쓰기" onclick="return bbb()">
				</td>
			</tr>
		</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>