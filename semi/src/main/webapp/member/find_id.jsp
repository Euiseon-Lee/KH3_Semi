<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>

<div>
	<h1>아이디를 잊으셨나요?</h1>
	<h5>가입하신 정보를 입력하면 아이디를 확인할 수 있습니다.</h5>
</div>

<form action="find_id.kh" method="post">
<!-- 이름(영문) 입력창 -->
<div>
	<input type="text" name="memberFname" required placeholder="영문이름(이름) 입력">
	<input type="text" name="memberLname" required placeholder="영문이름(성) 입력">
</div>

<!--이메일 입력창 -->
<div>
	<input type="email" name="memberEmail" required placeholder="이메일 입력">
</div>

<!--아이디찾기 버튼 -->
<div>
	<button type="submit">아이디 찾기</button>
</div>

</form>
	   <!-- 에러표시 메시지 출력 -->
	    <%if(request.getParameter("error") != null){ %>
			<h3>아이디가 존재하지 않습니다</h3>
		<%} %>
</body>
</html>