<%@page import="com.spring.web.vo.CommentVO"%>
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
<title>getBoard.jsp</title>
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
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}
</style>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<body>
<%@ include file="header.jsp" %>
	<%
		DisBoardVO board = (DisBoardVO) request.getAttribute("board");
	%>
	<div class="alert alert-info" role="alert">
	<h3>
		<%=session.getAttribute("userName")%>님 즐거운 시간 되세요 <img
			src="images/${sessionScope.userFavo}.jpg"
			style="width: 48px; height: 48px;"> | <a href="logout.do">LogOut</a>
	</h3>
</div>
<div class="alert alert-danger" role="alert">
  <h3><%=board.getFavoChar() %>의 먹방</h3>
</div>

	<form action="updateBoard.do" method="post">
		<input type="hidden" name="seq" value="<%=board.getSeq()%>">
		<table class="type09">
		<thead>
			<tr>
				<th scope="cols">Seq</th>
				<td scope="row"><%=board.getSeq()%></td>
			</tr>
			<tr>
				<th class="local" scope="cols">Local</th>
				<td scope="row"><input type="text" name="local"
					value="<%=board.getLocal()%>"></td>
			</tr>
			<tr>
				<th scope="cols">Kind</th>
				<td scope="row"><input type="text" name="kind" value="<%=board.getKind()%>"></td>
			</tr>
			<tr>
				<th scope="cols">FavoChar</th>
				<td scope="row"><input type="text" name="favoChar"
					value="<%=board.getFavoChar()%>"></td>
			</tr>

			<tr>
				<th scope="cols">Content</th>
				<td scope="row"><textarea name="content" id="ckeditor" cols="80" rows="10">
	<%=board.getContent()%>
	</textarea> </td>
			</tr>

			<tr>
				<th>Direct</th>
				<td><input type="text" name="direct"
					value="<%=board.getDirect()%>"></td>
			</tr>
</thead>
		</table>
	</form>
	<hr>
	<h4>
	<a href="insertBoard.jsp">[글쓰기]</a> |
	<a href="deleteBoard.do?seq=<%=board.getSeq()%>">[삭제]</a> |
	<a href="getBoardList.do">[리스트]</a>
	</h4>
	<hr>
	<form action="insertComment.do" method="post">
		<input type="hidden" name="bseq" value="<%=board.getSeq()%>">
		작성자 : <input type="text" name="writer"> 댓글 : <input
			type="text" name="title"> <input type="submit" value="댓글달기">
	</form>
	<hr>


	<table class="type09">
	<thead>
		<tr>
			<th scope="cols">Seq</th>
			<th class="title" scope="cols">Title</th>
			<th scope="cols">Writer</th>
			<th scope="cols">RegDate</th>
		</tr>
		</thead>
		<tbody>
		<%
		List<CommentVO> comment = (List<CommentVO>) request.getAttribute("comment");
		for (CommentVO vo : comment) {%>
		<tr>
			<td scope="row"><%=vo.getCseq()%></td>
			<td scope="row"><%=vo.getTitle()%></td>
			<td scope="row"><%=vo.getWriter()%></td>
			<td scope="row"><%=vo.getRegDate()%></td>
		</tr>
		<%}%>
		</tbody>
	</table>

</body>
</html>









