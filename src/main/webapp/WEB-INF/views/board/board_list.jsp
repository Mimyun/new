<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		table{
			margin: auto;
			border: solid;
			width: 800px;
		}
		th{
			text-align: center;
		}
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>게시글 번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>작성날짜</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${list}" var="board">
			<tr>
				<td><a href="board_delete?num=${board.num}">${board.num}</a></td>
				<td>${board.writer}</td>
				<td style="text-align: left;">
					<a href="board_view?num=${board.num}">
					<c:if test="${board.indent > 0}">
						<c:forEach var="i" begin="1" end="${board.indent}">
							&nbsp;
						</c:forEach>
							└
					</c:if>
					${board.title}</a></td>
				<td>${board.writedate}</td>
				<td>${board.count}</td>
			</tr>
		</c:forEach>
		<tr style="border-left: none;border-right: none;border-bottom: none">
			<td colspan="5" style="text-align: center;">
			<c:if test="${paging.startPage!=1 }">
				<a href="board_page?nowPage=${paging.startPage-1 }&cntPerPage=${paging.cntPerPage}">◀</a>
			</c:if>
			
			<c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p"> 
				<c:choose>
					<c:when test="${p == paging.nowPage}">
						<b><span style="color: red;">${p}</span></b>
					</c:when>   
					<c:when test="${p != paging.nowPage}">
						<a href="board_page?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
					</c:when>   
				</c:choose>
			</c:forEach>
			
			<c:if test="${paging.endPage != paging.lastPage}">
				<a href="board_page?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">▶</a>
			</c:if>
			<div align="left"><select name="cntPerPage" onchange="changePerPage(this)">
							<option value="3" <c:if test="${paging.cntPerPage == 3}">selected</c:if>>3개</option>
							<option value="5" <c:if test="${paging.cntPerPage == 5}">selected</c:if>>5개</option>
							<option value="10" <c:if test="${paging.cntPerPage == 10}">selected</c:if>>10개</option>
							</select></div>
			</td>
		</tr>
	</table>
	<script type="text/javascript">
		function changePerPage(selectObject) {
			var selectedValue = selectObject.value;
			window.location.href = "board_page?nowPage=1&cntPerPage=" + selectedValue;
		}
	</script>
</body>
</html>