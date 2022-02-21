<%@page import="com.spring.web.vo.PagingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getBoardJstl.jsp</title>
<style type="text/css">
th{width:100px; background-color: rgb(200,150,200); align:center;}

</style>
</head>
<body>
<h1>Board View - JSTL</h1>
<h3>Login : Hong | <a href="logout.do">LogOut</a></h3>
<hr>
<form action="updateBoard.do" method="post">
<input type="hidden" name="seq" value="${board.seq }">
	<table>
	<tr><th>Seq</th><td>${board.seq}</td></tr>
	<tr>
	<th class="title">Title</th>
	<td><input type="text" name="title" value="${board.title }"></td>
	</tr>
	<tr>
	<th>Writer</th>
	<td><input type="text" name="writer" value="${board.writer }"></td></tr>
	<tr><th>RegDate</th><td>${board.regDate }</td></tr>
	<tr><th>Cnt</th><td>${board.cnt }</td></tr>
	<tr>
	<th>Content</th>
	<td><textarea name="content" cols="30" rows="10">${board.content }</textarea></td>
	</tr>
	<tr><td colspan="2" align="center"><input type="submit" value="수정하기"></td></tr>
	</table>
</form>
<hr>
<a href="insertBoard.jsp">[Write]</a> |
<a href="deleteBoard.do?seq=${board.seq}">[Delete]</a> |
<a href="getBoardList.do">[List]</a>
<hr>

<%
PagingVO paging = (PagingVO)request.getAttribute("pagingVO");

int listCnt = paging.getListCnt();

int curPage = paging.getPage(); // 현재 페이지
int listSize = paging.getListCnt(); // 1page 목록 갯수

int rangeSize = paging.getRangeSize();
int range = paging.getRange();
int startPage = paging.getStartPage(); //2
int endPage = paging.getEndPage(); // 6
boolean prev = paging.isPrev();
boolean next = paging.isNext();
%>
start: <%=startPage %> / end: <%=endPage %> / 현재구간: <%=range %> / 현재페이지: <%=curPage %><br>
<%if(prev) {%>
<a href="getBoardList.do?curPage=<%=startPage-rangeSize%>&range=<%=range-1%>">[이전<%=rangeSize %>개]</a>
<%} %>
<%for(int i=startPage;i<=endPage;i++){ %>
<a href="getBoardList.do?curPage=<%=i%>&range=<%=range%>">[<%=i%>]</a>
<%} %>
<%if(next){ %>
<a href="getBoardList.do?curPage=<%=startPage+rangeSize%>&range=<%=range+1%>">[이후<%=rangeSize %>개]</a>
<%} %>
</center>
<br><br><br><br><br>
</center>
<br><br><br><br><br>

</body>
</html>




