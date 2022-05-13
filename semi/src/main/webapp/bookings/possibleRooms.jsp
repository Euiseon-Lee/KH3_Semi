<%@page import="semi.beans.RoomsDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.BookingsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//예약 가능한 객실 리스트 조회 구현 코드
	String bookingRoomType = request.getParameter("bookingRoomType"); 
	String bookingCheckIn = request.getParameter("bookingCheckIn"); 
	String bookingCheckOut = request.getParameter("bookingCheckOut"); 
	BookingsDao bookingsDao = new BookingsDao();
	List<RoomsDto> list = bookingsDao.selectPossibleRooms(bookingRoomType, bookingCheckIn, bookingCheckOut);
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
		<form action = "finalBookings.jsp">
		<input type = "hidden" name = "bookingRoomType" value = "<%=bookingRoomType%>">
		<input type = "hidden" name = "bookingCheckIn" value = "<%=bookingCheckIn%>">
		<input type = "hidden" name = "bookingCheckOut" value = "<%=bookingCheckOut%>">
		
		
		<select name = "bookingRoomNo">
			<option value ="">호실</option>
		<%for(RoomsDto roomsDto : list){ %>
		
			<option><%=roomsDto.getRoomNo() %></option>
								
		<%} %>
		</select>
		
		<%if(bookingRoomType.equals("스위트")){ %>
		<select name = "bookingPeople">
		<option value = "">인원 선택</option>
		<option>1명</option>
		<option>2명</option>
		<option>3명</option>		
		<option>4명</option>
		<option>5명</option>
		<option>6명</option>
		<option>7명</option>
		<option>8명</option>
		<option>9명</option>
		<option>10명</option>		
		</select>
		<input type = "submit" value = "입력">
		<h3>스위트룸은 10명까지 예약 가능합니다.(1/10으로 기본값만들기)</h3>
		<%} else { %>
		<select name = "bookingPeople">
		<option value = "">인원 선택</option>
		<option>1명</option>
		<option>2명</option>
		<option>3명</option>
		<option>4명</option>
		</select>
		<input type = "submit" value = "입력">
		<h3><%=bookingRoomType%>룸은 4명까지 예약 가능합니다.(1/4으로 기본값만들기)</h3>
		<%} %>
		
		</form>
</body>
</html>