<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main.jsp</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<body>
<div class="alert alert-info" role="alert">
	<h3>
		<%=session.getAttribute("userName")%>님 즐거운 시간 되세요 <img
			src="images/${sessionScope.userFavo}.jpg"
			style="width: 48px; height: 48px;"> | <a href="logout.do">LogOut</a>
	</h3>
</div>

<hr>
<div class="alert alert-warning" role="alert">
<h3>
<a href="getStBoardList.do">[리스트]</a>
<a href="deleteUserCheck.jsp?id=${sessionScope.id }">[회원탈퇴]</a>
</h3>
</div>
<hr>
</body>
</html>