<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
<link href="formcss.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function() {
	
	$("#seq").focusout(function() { //id가 id 선택 실행함수 작성
		/* ajax   $은 select*/
		$.ajax({
		url:'getBoardJson.do',
	    method:'post',
		dataType:'json',
		data= {"seq":$("#seq").val()},
		success: function(board){ //결과가 올경우 실행부
			console.log(board);
			var board1 = JSON.stringify(board);
			console.log(board1);
			var html = "<tr><th>ID</th><th>PW</th></tr>";
			html += '<tr align="center">';
            html += ('<td>' + val["seq"] + '</td>');
            html += ('<td>' + val["local"] + "</td>");
            html += '</tr>';
		$('#content').html(html);			
		},
		error:function(xhr){
			alert("실패 하였습니다.");
		}
		});
	});
});
</script>
</head>
<body>
<form method="post" class="joinForm">
                                                                                               
      <h2>Join</h2>
      <div class="textForm">
        <input name="seq" type="text" class="id" id="seq" placeholder="아이디">
      </div>
    <input type="submit" class="btn" value="J O I N"/>
    </form>
<table id="content"></table>
</body>
</html>




