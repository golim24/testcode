<%@page import="com.spring.web.vo.DisBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertBoard.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<style type="text/css">
table.type09 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;

}
table.type09 thead th {
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #369;
  border-bottom: 3px solid #036;
}
table.type09 tbody th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #f3f6f7;
}
table.type09 td {
  width: 800px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}
</style>
<script type="text/javascript" src="<%=path%>/ckeditor/ckeditor.js"></script>

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
	<form action="insertBoard.do" method="post"
		enctype="multipart/form-data">

		<table class="type09">
		<thead>
			<tr>
				<th class="local" scope="cols">Local</th>
				<td scope="row"><input type="text" name="local"></td>
			</tr>
			<tr>
				<th scope="cols">kind</th>
				<td scope="row"><input type="text" name="kind"></td>
			</tr>
			<tr>
				<th scope="cols">Favochar</th>
				<td scope="row"><input type="text" name="favoChar"></td>
			</tr>
			<tr>
			</thead>
				<th>Content</th>
				<td><textarea name="content" id="ckeditor" cols="80" rows="10">
	임상진 텍스트 에리어 사용해보기
	</textarea> <script type="text/javascript">
		CKEDITOR.replace('ckeditor');
	</script></td>
			</tr>
			<thead>
			<tr>
				<th scope="cols">Direct</th>
				<td scope="row"><input type="text" name="direct"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" scope="row"><input type="submit"
					value="입력하기"></td>
			</tr>
			</thead>
		</table>
	</form>
	<hr>
	<h3>
	<a href="getBoardList.do">[리스트가기]</a>
	</h3>
	<hr>
</body>

</html>




