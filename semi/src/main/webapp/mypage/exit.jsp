<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 페이지</title>
</head>
<body>
	
	<form action="exit.kh" method="post">
	
	<!-- 회원 탈퇴 문구 -->
	<div>
	<h3>정말 회원을 탈퇴하시겠습니까?</h3>
	<h5>탈퇴를 진행하시기 전에 아래 유의사항을 읽어주세요.</h5>
	</div>
	
	<!-- 탈퇴 유의사항 문구 -->
	<div>
	<h3>유의사항</h3>
	<hr>
	<h5>개인정보보호법에 따라 고객님의 호텔 이용기록, 개인정보 및 문의 내역 기록도 모두 삭제됩니다.</h5>
	<h5>탈퇴 신청이 완료되면 즉시 홈페이지 로그인이 제한됩니다.</h5>
	</div>
	
	<hr>
	
	<!-- 탈퇴를 위한 비밀번호 입력창 -->
	<div>
	<input type="password" name="memberPw" required placeholder="비밀번호 입력">
	</div>
	
	<!-- 탈퇴하기 버튼 -->
	<div>
	<input type="submit" value="탈퇴하기">
	</div>
	
</form>
</body>
</html>