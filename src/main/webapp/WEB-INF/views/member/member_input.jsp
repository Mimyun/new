<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#ic").click(function() {
				var id = $("#id").val();
				$.ajax({
					type : "post",
					async : "true",
					url : "idcheck",
					data : {"id":id},
					success : function(result) {
						if (result == "ok"){
							alert("사용가능");
							$("#done").prop("disabled",false);
						}
						else{
							alert("중복ID");
							$("#done").prop("disabled",true);
						}
					},
					error: function() {
						alert("검증실패");
					}
				});
			});
		});
	</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="member_save" method="post" enctype="multipart/form-Data">
		<table border="1">
		<caption>회원가입</caption>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" id="id" required style="width: 70%">
					<input type="button" value="중복검사" id="ic" onclick="idcheck()" style="width: 28%"></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="text" name="pw" id="pw" required style="width: 99%;"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" id="name" required style="width: 99%;"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td align="left"><select name="tel1" style="width: 20%">
					<option value="010">010</option>
					<option value="010">011</option>
					</select> - 
					<input type="text" name="tel2" required style="width: 20%"> - 
					<input type="text" name="tel3" required style="width: 20%"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td align="left"><input type="radio" name="sex" value="남성">남성
					<input type="radio" name="sex" value="여성">여성</td>
			</tr>
			<tr>
				<th>거주지</th>
				<td><input type="text" name="add" required style="width: 99%;"></td>
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
				<td><textarea name="hello" style="width: 99%"></textarea></td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="file" name="image"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="확인" id="done" style="width: 99%;" disabled></td>
			</tr>
		</table>
	</form>
</body>
</html>