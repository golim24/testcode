<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/error/error.jsp</title>
</head>
<body>
<center>
	<h1>Spring MVC Error Page</h1>
	<hr>
	Error Msg : ${exception.message } 
</center>
</body>
</html>