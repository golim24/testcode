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
  <script type="non-empty.js"></script>
  <script type="text/javascript">
  function required()
  {
  const empt = document.forms["form1"]["content"].value;
  if (empt == "")
  {
  alert("Please input a Value");
  return false;
  }
  else 
  {
  return true; 
  }
  }
  function required()
  {
  const empt = document.forms["form1"]["succStory"].value;
  if (empt == "")
  {
  alert("Please input a succStory");
  return false;
  }
  else 
  {
  return true; 
  }
  }
  function required()
  {
  const empt = document.forms["form1"]["recoStock"].value;
  if (empt == "")
  {
  alert("Please input a RecoStock");
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
<div class="container">
  <h2>Today Stock Discussion</h2>
  <span class="btn btn-info btn-lg"><%=session.getAttribute("userName") %>(<%=session.getAttribute("userId") %>)님 성공투자 하세요!!</span>
	<a href="getDisBoardList.do" class="btn btn-info btn-lg">
	  <span class="glyphicon glyphicon-th-list"></span> Dis List
	</a>
	<br>
	<br>
<form name="form1" action="insertDisBoard.do" method="post" onsubmit="return required()">
  <div class="form-group mx-sm-3 mb-2">
    <label for="inputPassword2" class="sr-only">Id</label>
    <input type="text" class="form-control" id="inputPassword2" value="<%=session.getAttribute("userId") %>" name="id" readonly="readonly">
  </div>
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">Content</label>
  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="content"></textarea>
</div>
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">SuccStory</label>
  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="succStory"></textarea>
</div>
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">RecoStock</label>
  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="recoStock"></textarea>
</div>
<button type="submit" class="btn btn-primary" name="submit" value="submit">Writing</button>
</form>
</div>

</body>
</html>