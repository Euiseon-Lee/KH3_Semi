<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//현재 날짜 구하기
	LocalDate today = LocalDate.now();

%>
<!-- header -->
<jsp:include page="/template/header.jsp"></jsp:include>
	
	<h1>원하시는 객실 타입, 체크in-out날짜를 입력해주세요</h1>
	<form action = "possibleRooms.jsp" method = "get">
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
		<input type = "date" name = "bookingCheckIn" required min = "<%=today%>" placeholder = "0000-00-00">		 
	</div>
	
	<div>
		<label>체크아웃</label>
		<input type = "date" name = "bookingCheckOut" required min = "<%=today%>">		 
	</div>
	<div>
		<input type ="submit" value = "다음">
	</div>
	</form>
	<h1>0000-00-00으로해보기</h1>
	<h1>객실타입을 선택하면 객실소개에있는 객실이미지와소개글 가져오기</h1>
</body>
</html>