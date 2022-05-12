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
	
		
		<select name = "bookingRoomNo">
		<%for(RoomsDto roomsDto : list){ %>
		
			<option><%=roomsDto.getRoomNo() %></option>
								
		<%} %>
		</select>
		
		<input type = "number" name = "bookingPeople">
		
	
	<h3>(추가)스위트일때는 6~10명만 스탠다드일때는 2~4명만 가능하게 만들기 </h3>
		</form>
</body>
</html>