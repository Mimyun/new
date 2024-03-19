<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<header><h2 align="center">Spring Framework</h2></header>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header"><a class="navbar-brand" href="#">Ezen</a></div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="./">Home</a></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="member_list">회원목록</a></li>
						<li><a href="member_search">회원검색</a></li>
					</ul>
				</li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">게시판<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="board_input">게시글등록</a></li>
						<li><a href="board_page">게시글목록</a></li>
						<li><a href="board_search">게시글검색</a></li>
					</ul>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
			<c:choose>
				<c:when test="${login_state==true}">
					<li><a href="#"><span class="glyphicon glyphicon-user"></span>${user_id}</a></li>
					<li><a href="member_logout"><span class="glyphicon glyphicon-log-out"></span>로그아웃</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="member_input"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>
					<li><a href="member_login"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
				</c:otherwise>
			</c:choose>
			</ul>
		</div>
	</nav>
</body>
</html>