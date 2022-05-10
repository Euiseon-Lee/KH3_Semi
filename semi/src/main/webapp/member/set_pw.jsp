<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
</head>
<body>

<%
	String memberId = request.getParameter("memberId");
%>

<form action="set_pw.kh" method="post">

<!-- 아이디 가져오기 -->
<input type="hidden" name="memberId" value="<%=memberId%>">

<!-- 비밀번호 재설정 문구 -->
<div>
	<h1>비밀번호를 재설정해주세요.</h1>
</div>

<!-- 새 비밀번호 입력창 -->
<div>
	<label>새 비밀번호</label>
	<span>*</span> 
	<input type="password" name="memberPw" required>
	<span>8자 이상 영문, 숫자, 특수 문자중 3가지 이상 조합</span>
</div>

<!-- 새 비밀번호 확인 -->
<div>
	<label>비밀번호 확인</label>
	<span>*</span> 
	<input type="password" name="memberPw-check" required>
</div>

<!-- 재설정 버튼 -->
<div>
	<input type="submit" value="비밀번호 재설정하기">
</div>

</form>

</body>
</html>