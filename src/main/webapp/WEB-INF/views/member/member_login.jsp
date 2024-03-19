<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		table{
			margin: auto;
			border: solid;
			width: 200px;
		}
		caption{
			text-align: center;
			font-size: x-large;
			font-weight: bold;
			color: black;
		}
		th{
			text-align: center;
			background-color: rgb(0,0,255,0.2);
			width: 70px;
		}
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="member_login_check" method="post">
		<table border="1">
		<caption>로그인</caption>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" required style="width: 99%">
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="text" name="pw" required style="width: 99%;"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="로그인" id="done" style="width: 99%;"></td>
			</tr>
		</table>
	</form>
</body>
</html>