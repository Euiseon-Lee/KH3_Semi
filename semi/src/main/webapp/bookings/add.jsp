<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 정보 받는 jsp(타입,체크인아웃)</title>
</head>  
<body>
	<h1>원하시는 객실 타입, 체크in-out날짜를 입력해주세요</h1>
	<form action = "add.kh">
	<div>
		<label>객실 타입</label>
		<select name = "bookingRoomType">
			<option>스탠다드</option>
			<option>디럭스</option>
			<option>프리미어</option>
			<option>스위트</option>
		</select>
	</div>
	
	<div>
			<label>체크인</label>
		<input type = "date" name = "bookingCheckIn">		 
	</div>
	
	<div>
		<label>체크아웃</label>
		<input type = "date" name = "bookingCheckOut">		 
	</div>
	<div>
		<input type ="submit" value = "다음">
	</div>
	</form>
	<h3>지난 날짜는 입력안되게 하는 기능 해야한다</h3>
</body>
</html>