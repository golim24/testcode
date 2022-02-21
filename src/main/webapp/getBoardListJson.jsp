<%@page import="com.spring.web.vo.DisBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getBoardList.jsp</title>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script>

        $(function () {

        	getJson();
           
            function getJson() {

                //const param = {id:'hong',pw:'1111'};

                $.ajax({
                    type:'POST',
                    url:'getMapJson.do',
                    //dataType:'json',
                    //data:param,
                    success: function (data) {
                    	//console.log(data)
                    	var arras = []
                    	var arr = [];
                    	for(i of data){
                    		arr.push(i['symbol'],i['name']);
                    		arras.push(arr)
                    	}
                    		console.log(arras)
                    },
                    error: function (request, status, error) {
                        console.log(request, status,error);
                    }
                });
            }
        });        
    </script>
</head>
<body>

	<h1>Board List</h1><hr>
	<table id="list">	
	
	</table>
	
</body>
</html>