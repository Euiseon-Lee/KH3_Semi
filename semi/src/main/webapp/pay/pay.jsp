
<%@page import="semi.beans.BookingsDao"%>
<%@page import="semi.beans.BookingsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String memberId = (String)session.getAttribute("login");
	boolean login = memberId != null;
	
	String bookingsMemberId = (String)request.getSession().getAttribute("id");
%>    
    
<% 
	int bookingOrderNo = Integer.parseInt(request.getParameter("bookingOrderNo"));
	BookingsDto bookingsDto = new BookingsDto();
	//bookingsDto = BookingsDao.
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제확인 페이지</title>
</head>
<body>
	<h3>login = <%=login %></h3>
	<h3>memberId = <%=memberId %></h3>

	<h1>예약내역 확인</h1>
	
<table border ="1">
	<tr>
		<th>예약번호</th>
		<td><%=bookingsDto.getBookingsOrderNo() %>번</td>
	</tr>
	<tr>
		<th>고객 아이디</th>
		<td><%=bookingsDto.getBookingsMemberId() %></td>
	</tr>
	<tr>
		<th>객실타입 [객실번호]</th>
		<td><%=bookingsDto.getBookingsRoomtype()%> [<%=bookingsDto.getBookingsRoomNo()%>호]</td>
	</tr>
    <tr>
		<th>체크인</th>
		<td><%=bookingsDto.getBookingsCheckIn()%></td>
	</tr>
	<tr>
		<th>체크아웃</th>
		<td><%=bookingsDto.getBookingsCheckOut()%></td>
	</tr>
	<tr>
		<th>인원</th>
		<td><%=bookingsDto.getBookingsPeople()%>명</td>
	</tr>
	<tr>
		<th>결제될 금액</th>
		<td><%=bookingsDto.getBookingsTotalPrice()%>원</td>
	</tr>
</table>

</body>
</html>