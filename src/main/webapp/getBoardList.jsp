<%@page import="com.spring.web.vo.PagingVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getBoardList.jsp</title>
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
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="alert alert-info" role="alert">
	<h3>
		<%=session.getAttribute("userName")%>님 즐거운 시간 되세요 <img
			src="images/${sessionScope.userFavo}.jpg"
			style="width: 48px; height: 48px;"> | <a href="logout.do">LogOut</a>
	</h3>
</div>
<div class="alert alert-success" role="alert">
  <h3>먹방로드 LIST</h3>
</div>

	<!-- Search -->
	<form method="post">
		<select name="searchType" calss="searchType">
			<option value="local">Local</option>
			<option value="kind">Kind</option>
			<option value="content">Content</option>
		</select> 
		<input type="text" name="searchKeyword" calss="searchKeyword"> 
		<input type="button" value="글검색" onclick="getJsonSearch()">
	</form>
	<hr>
	<table id="list" class="type09">

	</table>
	<h3>
	<p id="paging"></p>
	</h3>
	<h3>
	<a id="atag"> </a>
	</h3>
	<hr>
	<h3>	
	<a href="insertBoard.jsp">[글쓰기]</a>
	</h3>
	<script>

        //$(function () {

        	getJson();
        	getPaging();
           
            function getJson(page) {

                const param = {curPage:page};
                
                //alert(page);

                $.ajax({
                    type:'GET',
                    url:'getBoardListJson.do',
                    dataType:'json',
                    data:param,
                    success: function (data) {                 	
                    	let blist = "<thead><tr><th scope='cols'>SEQ</th><th scope='cols'>LOCAL</th><th scope='cols'>KIND</th><th scope='cols'>FAVOCHAR</th><th scope='cols'>CONTENT</th><th scope='cols'>DIRECT</th></tr></thead>";
                    	for(i of data){
                    		blist += "<tbody><tr><td scope='row'>" + i["seq"] + "</td><td scope='row'><a href='getBoard.do?seq=" + i["seq"] + "'>" + i["local"] + "</a></td><td scope='row'>"+ i["kind"] + "</td><td scope='row'>"+ i["favoChar"] + 
                    		"</td><td scope='row'>"+ i["content"] + "댓글[" + i["replyCnt"] + "]</td><td scope='row'>"+ i["direct"] + "</td></tr></tbody>";
                    	}
                    	$('#list').html(blist);
                    },
                    error: function (request, status, error) {
                        console.log(request, status,error);
                    }
                });
            }
            function getJsonSearch(){
                
                $.ajax({
                    type:'post',
                    url:'getBoardListJson.do',
                    dataType:'json',
                    data:$('form').serialize(),
                    success: function (data) {
                    	//console.log(data);
                    	let searchList = "<tr><th>SEQ</th><th>LOCAL</th><th>KIND</th><th>FAVOCHAR</th><th>CONTENT</th><th>DIRECT</th></tr>";
                    	for(i of data){
                    		console.log(i);
                    		searchList += "<tr><td>" + i["seq"] + "</td><td><a href='getBoard.do?seq=" + i["seq"] + "'>" + i["local"] + "</a></td><td>"+ i["kind"] + "</td><td>"+ i["favoChar"];  
                    		searchList += "</td><td>"+ i["content"] + "댓글[" + i["replyCnt"] + "]</td><td>"+ i["direct"] + "</td></tr>";
                    	}
                    	$('#list').html(searchList);
                    },
                    error: function (request, status, error) {
                        console.log(request, status,error);
                    }
                });
            }
            function getPaging() {

                //const param = {id:'hong',pw:'1111'};

                $.ajax({
                    type:'GET',
                    url:'getBoardPaging.do',
                    dataType:'json',
                    //data:param,
                    success: function (data) {
                    	console.log(data);
                    	blist = "<p>start: [" + data["startPage"] + 
                    		"] end: [" + data["endPage"] +"] 현재구간: [" + data["range"] +
                    		"] 현재페이지: [" + data["page"] +"]</p>";


                    	if(data["prev"]) {
                    	atag ="<a href='javascript:getJson(" + (data["startPage"]-data["rangeSize"]) + "&range=" + (data["range"]-1) + ")'>[이전" + data["rangeSize"] + "개]</a>"
                    	};
                    	
                    	for(var i=data["startPage"];i<=data["endPage"];i++){
                    		let goUrl = "<a href='javascript:getJson("+i+","+data["range"]+")'>["+ i +"]</a>"
                    		atag += goUrl;
                    	};
                    	
                    	
                    	if(data["next"]){
                    	"<a href='javascript:getJson(" + (data["startPage"]+data["rangeSize"]) + "&range=" + (data["range"]+1) + ")'>[이후" + data["rangeSize"] + "개]</a>"
                    	};
                    		
                    		
                    	$('#paging').html(blist);
                    	$('#atag').html(atag);
                    },
                    error: function (request, status, error) {
                        console.log(request, status,error);
                    }
                });
            }
        //});        
    </script>
</body>
</html>