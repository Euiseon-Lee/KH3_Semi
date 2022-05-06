<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 페이지</title>
</head>
<body>
	<h3>정말 회원을 탈퇴하시겠습니까?</h3>
	<h5>탈퇴를 진행하시기 전에 아래 유의사항을 읽어주세요.</h5>
	
	<h3>유의사항</h3>
	<hr>
	<h5>개인정보보호법에 따라 고객님의 호텔 이용기록, 개인정보 및 문의 내역 기록도 모두 삭제됩니다.</h5>
	<h5>탈퇴 신청이 완료되면 즉시 홈페이지 로그인이 제한됩니다.</h5>
	
	<hr>
	<h3>비밀번호 입력 후 탈퇴하기</h3>
	<form action="exit.semi" method="post">
	<input type="password" name="memberPw" required>
	
	<input type="submit" value="탈퇴하기">
</form>
</body>
</html>