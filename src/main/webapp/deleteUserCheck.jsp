<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeleteUser</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<h3>${sessionScope.userName }/(${sessionScope.userId })님 탈퇴 하시려면 password 확인이 필요 합니다</h3>
    <form action="deleteUserCherk.do" method="post" class="loginForm">
      <div class="idForm">
        <input type="text" class="id" name="id" value="${sessionScope.userId }">
      </div>
      <div class="passForm">
        <input type="password" class="pw" name="password">
      </div>
      <button type="button" class="btn" onclick="deleteUserCheck()">
        DELETE
      </button>
    </form>

<script>

function deleteUserCheck(){
    
    $.ajax({
        type:'post',
        url:'deleteUserCherk.do',
        dataType:'json',
        data:$('form').serialize(),
        success: function (data) {
        console.log(data);
		if(data==0){
			alert("비밀번호가 틀렸습니다")
		}else{
			alert("삭제 하겠습니다")
			location.href="deleteUser.do?id=${sessionScope.userId}";
		}
        },
        error: function (request, status, error) {
            console.log(request, status,error);
        }
    });
}

</script>

</body>
</html>