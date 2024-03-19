<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		table{
			margin: auto;
			border: solid;
		}
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="board_reply" method="post">
	<input type="hidden" name="num" value="${dto.num}">
		<table border="1">
		<caption>${dto.title}</caption>
			<tr>
				<th>작성자</th>
				<td>${dto.writer}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td style="width: 400px; height: 100px; text-align: left;">${dto.content}</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="답글달기">
												<input type="button" value="뒤로" onclick="location.href='board_list'"></td>
			</tr>
		</table>
	</form>
</body>
</html>