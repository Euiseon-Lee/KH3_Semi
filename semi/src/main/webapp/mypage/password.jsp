<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 페이지</title>
</head>
<body>

<%
	//에러 관련 정보 
	String error = request.getParameter("error");
	boolean case1 = error != null && error.equals("1");
	boolean case2 = error != null && error.equals("2");
%>
 
 <form action="password.kh" method="post">
 <!-- 비밀번호 변경 문구 -->
 <div>
<h1>비밀번호 변경</h1>
<h5>현재 비밀번호를 입력하신 후 비밀번호를 변경할 수 있습니다.</h5>
<h5>비밀번호 변경 후 재 로그인이 필요합니다.</h5>
</div>

<!-- 현재 비밀번호 입력창  -->
<div>
	<label>현재 비밀번호</label>
	<span>*</span> 
	<input type="password" name="currentPw" required>
</div>

<!-- 새 비밀번호 입력창  -->
<div>
	<label>새 비밀번호</label>
	<span>*</span> 
	<input type="password" name="changePw" required>
	<span>8자 이상 영문, 숫자, 특수 문자중 3가지 이상 조합</span>
</div>

<!-- 새 비밀번호 확인 입력창  -->
<div>
	<label>새 비밀번호 확인</label>
	<span>*</span> 
	<input type="password" name="changePw" required>
</div>

<!-- 비밀번호 변경 버튼  -->
<div>
	<input type="submit" value="비밀번호 변경">
</div>
</form>

	<%if (case1) {%>
		<h3>현재와 같은 비밀번호로 변경할 수 없습니다</h3>
	<%} %>
		
	<%if(case2){ %>
		<h3>비밀번호가 일치하지 않습니다</h3>
	<%} %>

</body>
</html>