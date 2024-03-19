<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		table{
			margin: auto;
			border: solid;
			width: 350px;
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
	<form action="member_update_do" method="post" enctype="multipart/form-Data">
	<input type="hidden" name="sex_old" value="${user.sex}">
	<input type="hidden" name="hobby_old" value="${user.hobby}">
	<input type="hidden" name="image_old" value="${user.image}">
		<table border="1">
		<caption>회원수정</caption>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" value="${user.id}" readonly style="width: 99%">
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="text" name="pw" value="${user.pw}" required style="width: 99%;"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" value="${user.name}" required style="width: 99%;"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td align="left"><input type="text" name="tel1" value="${user.tel.substring(0, 3)}" required style="width: 20%"> - 
					<input type="text" name="tel2" value="${user.tel.substring(4, 8)}" required style="width: 20%"> - 
					<input type="text" name="tel3" value="${user.tel.substring(9, 13)}" required style="width: 20%"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td align="left"><input type="radio" name="sex" value="남성">남성
					<input type="radio" name="sex" value="여성">여성</td>
			</tr>
			<tr>
				<th>거주지</th>
				<td><input type="text" name="add" value="${user.address}" required style="width: 99%;"></td>
			</tr>
			<tr>
				<th>취미</th>
				<td><input type="checkbox" name="hobby" value="취미A">취미A
					<input type="checkbox" name="hobby" value="취미B">취미B
					<input type="checkbox" name="hobby" value="취미C">취미C
					<input type="checkbox" name="hobby" value="취미D">취미D
					<input type="checkbox" name="hobby" value="취미E">취미E</td>
			</tr>
			<tr>
				<th>인사말</th>
				<td><textarea name="hello" style="width: 99%">${user.hello}</textarea></td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="file" name="image"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="확인" id="done" style="width: 99%;"></td>
			</tr>
		</table>
	</form>
</body>
</html>