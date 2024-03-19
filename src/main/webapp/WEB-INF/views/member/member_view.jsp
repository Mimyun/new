<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		table{
			margin: auto;
			border: solid;
			width: 500px;
		}
		caption{
			text-align: center;
			font-size: x-large;
			font-weight: bold;
			color: black;
		}
		th{
			text-align: center;
			background-color: rgb(0,0,0,0.2);
		}
		td{
			text-align: center;
		}
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="" method="post">
	<input type="hidden" name="id" value="${user.id}">
	<input type="hidden" name="image" value="${user.image}">
		<table border="1">
			<tr>
				<td rowspan="3" style="border-right: solid;"><img src="./image/${user.image}" width="80px" height="100px"></td>
				<th>이름</th><td>${user.name}</td>
				<th>성별</th><td>${user.sex}</td>
			</tr>
			<tr>
				<th>아이디</th><td>${user.id}</td>
				<th>패스워드</th><td>${user.pw}</td>
			</tr>
			<tr>
				<th>전화번호</th><td colspan="3">${user.tel}</td>
			</tr>
			<tr>
				<th height="33px" style="border-top: solid;">주소</th><td colspan="4">${user.address}</td>
			</tr>
			<tr>
				<th height="33px">취미</th><td colspan="4">${user.hobby}</td>
			</tr>
			<tr>
				<th height="33px">인사말</th><td colspan="4">${user.hello}</td>
			</tr>
		</table><br>
		<div><input type="submit" value="수정" formaction="member_update" style="width: 200px; height: 33px;">&emsp;&emsp;
			<input type="submit" value="삭제" formaction="member_delete" style="width: 200px; height: 33px;"></div>
	</form>
</body>
</html>