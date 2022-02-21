<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getBoardListJstl.jsp</title>
<style type="text/css">
th {
	width: 100px;
	background-color: rgb(200, 150, 200);
	align: center;
}

.title {
	width: 300px
}
</style>
</head>
<body>
	<h1>Board List - JSTL</h1>
	<h3>
		Login : Hong | <a href="logout.do">LogOut</a>
	</h3>
	<hr>
	<form action="search.do" method="get">
		<select name="searchType">
			<option value="KIND">Title</option>
			<option value="FAVOCHAR">Title</option>
			<option value="CONTENT">Content</option>
		</select> 
		<input type="text" name="ti"> 
		<input type="submit"value="글삭제"> 
	</form>
	<table width="700">
		<tr>
			<th>Seq</th>
			<th class="title">Title</th>
			<th>Writer</th>
			<th>RegDate</th>
			<th>Cnt</th>
		</tr>
<c:forEach items="${boardList }" var="vo">
		<tr>
			<td>${vo.seq }</td>
			<td><a href="getBoardJstl.do?seq=${vo.seq }">${vo.title }</a></td>
			<td>${vo.writer }</td>
			<td>${vo.regDate }</td>
			<td>${vo.cnt }</td>
		</tr>
</c:forEach>		
	</table>
	<hr>
	<a href="insertBoard.jsp">[Write]</a> |[1][2][3] |
</body>
</html>