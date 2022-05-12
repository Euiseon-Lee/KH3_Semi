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
		<%for(RoomsDto roomsDto : list){ %>
		
			<option><%=roomsDto.getRoomNo() %></option>
								
		<%} %>
		</select>
		
		<%if(bookingRoomType.equals("스위트")){ %>
		<input type = "number"  name = "bookingPeople" min="1" max="10" required>
		<input type = "submit" value = "입력">
		<h3>스위트룸은 10명까지 가능합니다.</h3>
		<%} else { %>
	 	<input type = "number"  name = "bookingPeople" min="1" max="4" required>
		<input type = "submit" value = "입력">
		<h3>스탠다드룸은 4명까지 가능합니다.</h3>
		<%} %>
		
		</form>
</body>
</html>