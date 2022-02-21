<%@page import="com.spring.web.vo.PagingVO"%>
<%@page import="com.spring.web.vo.DisBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<%
List<DisBoardVO> DisBoardList = (List)request.getAttribute("DisBoardList");
%>

<div class="container">
  <h2>Today Stock Discussion</h2>
  <span class="btn btn-info btn-lg"><%=session.getAttribute("userName") %>(<%=session.getAttribute("userId") %>)님 성공투자 하세요!!</span>
        <a href="getStBoardList.do" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-th-list"></span> Main Page
        </a>
      </p>  
  
  <p>토론방 입니다.성공사례 추천주등 올려 주시면 됩니다</p>
  
  <form action="getDisBoardList.do" method="post">
  <select name="searchType" class="btn btn-default btn-sm">
	<option value="Content" selected>Content</option>
	<option value="SuccStory">SuccStory</option>
	<option value="RecoStock">RecoStock</option>
  </select>
  <input type="text" name="searchKeyword">
  <input type="submit" value="Search" class="btn btn-default btn-sm">
  </form>
                         
  <table class="table table-hover">
    <thead>
      <tr>
        <th><p class="glyphicon glyphicon-pushpin"> No</p></th>
        <th><p class="glyphicon glyphicon-user"> Id</p></th>
        <th><p class="glyphicon glyphicon-send"> Content</p></th>
        <th><p class="glyphicon glyphicon-piggy-bank"> SuccStory</p></th>
        <th><p class="glyphicon glyphicon-thumbs-up"> RecoStock</p></th>
        <th><p class="glyphicon glyphicon-sunglasses"> Cnt</p></th>        
        <th><p class="glyphicon glyphicon-pencil"> Comment</p></th>        
      </tr>
    </thead>
    
	<%for(DisBoardVO board : DisBoardList){ %>
    <tbody>
      <tr>
        <td><%=board.getSeq() %></td>
        <td><%=board.getId() %></td>
        <td><%=board.getContent() %></td>
        <td><%=board.getSuccStory() %></td>
        <td><%=board.getRecoStock() %></td>
        <td><%=board.getCnt() %></td>
        <td><code><%=board.getReplyCnt() %><a href="getDisBoard.do?seq=<%=board.getSeq()%>">ea / Read.Write</a></code></td>
      </tr>

    </tbody>
    <%} %>
  </table>
<a href="insertDisBoard.jsp" class="btn btn-info btn-lg">
<span class="glyphicon glyphicon-bullhorn"></span> Writing 
</a>
</div>
<%
PagingVO paging = (PagingVO)request.getAttribute("pagingVo");

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

<center>
<%if(prev) {%>
<a href="getDisBoardList.do?curPage=<%=startPage-rangeSize%>&range=<%=range-1%>"><kbd>[이전<%=rangeSize %>개]</kbd></a>
<%} %>
<%for(int i=startPage;i<=endPage;i++){ %>
<a href="getDisBoardList.do?curPage=<%=i%>&range=<%=range%>"><kbd>[<%=i%>]</kbd></a>
<%} %>
<%if(next){ %>
<a href="getDisBoardList.do?curPage=<%=startPage+rangeSize%>&range=<%=range+1%>"><kbd>[이후<%=rangeSize %>개]</kbd></a>
<%} %>
<h4><mark>현재페이지: <%=curPage %>PAGE</mark></h4>
</center>


</body>
</html>