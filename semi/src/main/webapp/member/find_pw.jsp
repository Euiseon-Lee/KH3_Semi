<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>


<form action="find_pw.kh" method="post">

<!-- 비밀번호 확인문구 -->
<div>
	<h1>비밀번호를 잊으셨나요?</h1>
	<h5>가입하신 정보를 입력하면 비밀번호를 재설정할 수 있습니다.</h5>
</div>

<!-- 아이디 입력창 -->
<div>
	<input type="text" name="memberId" required placeholder="아이디 입력" >
</div>

<!-- 이름(영문) 입력창 -->
<div>
	<input type="text" name="memberFname" required placeholder="영문이름(이름) 입력">
	<input type="text" name="memberLname" required placeholder="영문이름(성) 입력">
</div>

<!-- 이메일 입력창 -->
<div>
	<input type="text" name="memberEmail" required placeholder="이메일 입력" >
</div>

<!-- 핸드폰 입력창 -->
<div>
	<input type="tel" name="memberPhone" required placeholder="전화번호 입력" >
</div>

<!-- 비밀번호 재설정 버튼 -->
<div>
	<button type="submit">비밀번호 재설정</button>
</div>

</form>
	    	 <!-- 에러표시 메시지 출력 -->
	  	    <%if(request.getParameter("error") != null){ %>
			<h3>일치하는 데이터가 존재하지 않습니다</h3>
			<%} %>
</body>
</html>