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

	
	$("#reg-id").focusout(function() { //id가 reg-id 선택 실행함수 작성
		/* ajax   $은 select*/
		$.ajax({
		url:'getBoardJson.do',
		data:{"seq":$("#reg-id").val()}, //id가 reg-id의 val을 읽는다.처리 서버로 보낼때 seq로 보내겠다
	    method:'get',
		dataType:'json',
		success: function(board){
			var board1 = JSON.stringify(board);
			consol.log(board1)
			alert(board1);
			var html = "<tr><th>ID</th><th>PW</th><th>NAME</th><th>EMAIL</th><th>ROLE</th></tr>";//결과가 올경우 실행부
/* 			$.each(data, function (index, val) {
                //console.log(val["id"], val["pw"]);
                console.log(board);
                if(val['seq'] == false){
                	html += '<tr align="center">';
                	html += '<td colspan="5">Data Not Found!!</td>';
                	html += '</tr>';
                }else{
                    html += '<tr align="center">';
                    html += ('<td>' + val["seq"] + '</td>');
                    html += ('<td>' + val["local"] + "</td>");
                    html += ('<td>' + val["kind"] + "</td>");
                    html += ('<td>' + val["favoChar"] + "</td>");
                    html += ('<td>' + val["content"] + "</td>");
                    html += '</tr>';
                }
            }); */
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
<form method="get" class="joinForm">
                                                                                               
      <h2>Join</h2>
      <div class="textForm">
        <input name="seq" type="text" class="id" id="reg-id" placeholder="아이디">
      </div>
    <input type="submit" class="btn" value="J O I N"/>
    </form>
<table id="content"></table>
</body>
</html>