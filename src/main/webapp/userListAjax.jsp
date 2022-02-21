<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>userListAjax</title>
<style type="text/css">
	th {width: 100px; background-color: rgb(200, 150, 200); align:center;}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	let id = $("#id").val();
	
	$('#search').on('click',function () {
		var id = $('#id').val();
		if(id == ''){
			alert('id를 넣어주세요');
			$('#id').focus();
		}else{
			getJson(id);
		}
		return false;
	});

	function getJson(id) {
		const data = {id:id}
		$.ajax({
			type:'GET',
			url: 'getUser.do?id=${id}',
			dataType: 'json',
			data: data,
			success: function(data) {
				var html = "<tr><th>ID</th><th>PW</th></tr>";
				$.each(data, function (index, val) {
                    console.log( val);
                    //console.log(val["id"], val["pw"]);
                    if(val['id'] == false){
                    	html += '<tr align="center">';
                    	html += '<td colspan="5">Data Not Found!!</td>';
                    	html += '</tr>';
                    }else{
	                    html += '<tr align="center">';
	                    html += ('<td>' + val["id"] + '</td>');
	                    html += ('<td>' + val["password"] + "</td>");
	                    html += '</tr>';
                    }
                });
                $('#content').html(html);				
			},
			error: function (req, status, error) {
				consol.log(req, status, error);
			}
			
		});
	}
});
</script>
</head>
<body>
<%


%>
<h1>User List - AJAX</h1>
<hr>
<table>
<tr><th>Search</th><td colspan="4">
<form action="userListAjax.jsp" method="get">
<input type="text" name="id" id="id">
<input type="button" id="search" value="Search">

</form>
</td></tr>
</table>
<table id="content"></table>
</body>
</html>