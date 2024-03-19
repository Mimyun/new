<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<form action="member_search_do" method="post">
		<table border="1">
		<caption>회원검색</caption>
			<tr>
				<th><select name="search">
					<option value="name">이름</option>
					<option value="id">아이디</option>
					<option value="address">거주지</option>
					</select></th>
				<td><input type="text" name="value" required style="width: 99%">
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="검색"style="width: 99%;"></td>
			</tr>
		</table>
	</form>
</body>
</html>