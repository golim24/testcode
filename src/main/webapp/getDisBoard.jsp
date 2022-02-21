<%@page import="java.util.List"%>
<%@page import="com.spring.web.vo.CommentVO"%>
<%@page import="com.spring.web.vo.DisBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <script type="text/javascript">
  function required()
  {
  const empt = document.forms["form1"]["title"].value;
  if (empt == "")
  {
  alert("Please input Comment");
  return false;
  }
  else 
  {
  return true; 
  }
  }
  </script>

</head>
<body>

<%
DisBoardVO DisBoard = (DisBoardVO)request.getAttribute("DisBoard");
List<CommentVO> commentList = (List<CommentVO>)request.getAttribute("commentList");
%>

<div class="container">
  <h2>Today Stock Discussion</h2>
  <span class="btn btn-info btn-lg"><%=session.getAttribute("userName") %>(<%=session.getAttribute("userId") %>)님 성공투자 하세요!!</span>
	<a href="getDisBoardList.do" class="btn btn-info btn-lg">
	  <span class="glyphicon glyphicon-th-list"></span> Dis List
	</a>
	<br>
	<br>
  <table class="table table-hover">
    <thead>
      <tr class="alert alert-danger">
        <th><p class="glyphicon glyphicon-send"> Content</p></th>
        <th><p class="glyphicon glyphicon-piggy-bank"> SuccStory</p></th>
        <th><p class="glyphicon glyphicon-thumbs-up"> RecoStock</p></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><%=DisBoard.getContent() %></td>
        <td><%=DisBoard.getSuccStory() %></td>
        <td><%=DisBoard.getRecoStock() %></td>
      </tr>

    </tbody>
  </table>
</div>
<div class="container">
  <h4><kbd>Comment List</kbd></h4>
  <table class="table table-hover">
    <thead>
      <tr>
        <th><p class="glyphicon glyphicon-pencil"> Writer</p></th>
        <th><p class="glyphicon glyphicon-envelope"> Comment</p></th>
        <th><p class="glyphicon glyphicon-calendar"> Date</p></th>
      </tr>
    </thead>
    <tbody>
    <%for(CommentVO comment : commentList) {%>
      <tr>
        <td><%=comment.getWriter() %></td>
        <td><%=comment.getTitle() %></td>
        <td><%=comment.getRegDate() %></td>
      </tr>
	<%} %>
    </tbody>
  </table>
</div>

<form name="form1" action="insertComment.do" method="post" onsubmit="return required()">
<div class="container">
  <h2>Input Comment</h2>
  <p>욕설 비방을 삼가주세요</p>
  <div class="form-group mx-sm-3 mb-2">
    <label for="inputPassword2" class="sr-only">Writer</label>
    <input type="text" class="form-control" id="inputPassword2" value="<%=session.getAttribute("userName") %>" name="writer" readonly="readonly">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">Comment</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="title"></textarea>
  </div>
  <input type="hidden" name="bseq" value="<%=DisBoard.getSeq()%>">
  <button type="submit" class="btn btn-primary" name="submit" value="submit">Writing</button>
</div>

</form>
</body>
</html>