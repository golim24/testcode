<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />

<link href="formcss.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".msg1").hide();
	$(".msg2").hide();
	$("#reg-id").focusout(function() { //id가 reg-id이고 포커스아웃일때 선택 실행함수 작성
		/* ajax   $은 select*/
		$.ajax({  //ajax실행
		url:"idCheck.do",
		type:"post",
		url:"idCheck.do",
		data:{"id":$("#reg-id").val()}, //id가 reg-id의 val을 읽는다.처리 서버로 보낼때 id로 보내겠다
		success: function(result){  //결과가 올경우 실행부
			if(result==1){
				$(".msg2").show();
				$(".msg1").hide();
			}else{
				$(".msg1").show();
				$(".msg2").hide();
			}
		}
		});
	});
});
</script>
<script type="text/javascript">
function checkAll() {
    if (!checkId(form.id.value)) {
        return false;
    } else if (!checkPassword(form.password.value)) {
        return false;
    }else if (!checkName(form.name.value)) {
        return false;
    }else if (!checkFavo(form.favoChar.value)) {
        return false;
    }
    return true;
}
// 공백확인 함수
function checkExistData(value, dataName) {
    if (value == "") {
        alert(dataName + " 입력해주세요!");
        return false;
    }
    return true;
}
function checkId(id) {
    //Id가 입력되었는지 확인하기
    if (!checkExistData(id, "아이디를"))
        return false;

    var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
    if (!idRegExp.test(id)) {
        alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
        form.id.value = "";
        form.id.focus();
        return false;
    }
    return true; //확인이 완료되었을 때
}
function checkPassword(password) {
    //비밀번호가 입력되었는지 확인하기
    if (!checkExistData(password, "비밀번호를"))
        return false;

    var passwordRegExp = /^[a-zA-z0-9]{4,12}$/; //비밀번호 유효성 검사
    if (!passwordRegExp.test(password)) {
        alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
        form.password.value = "";
        form.password.focus();
        return false;
    }
    return true;
}
function checkName(name) {
    if (!checkExistData(name, "이름을"))
        return false;

    var nameRegExp = /^[a-zA-z0-9가-힣]+{2,4}$/;
    if (!nameRegExp.test(name)) {
        alert("별명이 올바르지 않습니다.");
        return false;
    }
    return true; //확인이 완료되었을 때
}
function checkFavo() {
    var favoChar = document.getElementsByName("favoChar");

    //체크된 값이 하나라도 있을경우 바로 true
    for (var i = 0; i < favoChar.length; i++) {
        if (favoChar[i].checked == true) {
            return true;
        }
    }
    alert("케릭터를 체크해주세요!");
    return false;
}
</script>
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">META STOCK</a>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="login.jsp">M.S
							login</a></li>
				</ul>
			</div>
		</div>
	</nav>

<form name="form" action="join.do" method="POST" onsubmit="return checkAll()" class="joinForm">
                                                                                               
      <h2>Join</h2>
      <div class="textForm">
        <input name="id" type="text" class="id" id="reg-id" placeholder="아이디">
        <span class="msg1">멋진 아이디 입니다!!</span>
        <span class="msg2">사용중인 아이디 입니다!!</span>
      </div>
      <div class="textForm">
        <input name="password" type="password" class="pw" placeholder="비밀번호">
      </div>
      <div class="textForm">
        <input name="name" type="text" class="nickname" placeholder="닉네임">
      </div>
      <h2>Char Select</h2>
	<input type="radio" name="favoChar" value="favo1"><div class="insertFavo1"></div>
	<input type="radio" name="favoChar" value="favo2"><div class="insertFavo2"></div>
	<input type="radio" name="favoChar" value="favo3""><div class="insertFavo3"></div>
    <input type="submit" class="btn" value="J O I N"/>
    </form>

</body>
</html>