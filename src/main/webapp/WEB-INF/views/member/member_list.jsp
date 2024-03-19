<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<table border="1">
	<caption>회원목록</caption>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>전화번호</th>
			<th>거주지</th>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td><a href="member_view?id=${dto.id}">${dto.id}</a></td>
				<td>${dto.name}</td>
				<td>${dto.sex}</td>
				<td>${dto.tel}</td>
				<td>${dto.address}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>