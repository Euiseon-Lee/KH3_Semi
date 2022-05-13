<%@page import="java.text.SimpleDateFormat"%>
<%@page import="semi.beans.BookingsDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.BookingsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
		String memberId = (String)request.getSession().getAttribute("login");
		//예약목록 메소드 불러오기	
		BookingsDao bookingsDao = new BookingsDao();
		List<BookingsDto> list = bookingsDao.selectList("testuser");
		
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1 align = "center">내 예약 내역</h1>
		
		<table border = "1" width = "600" height = "100" align = "center">
		
			<thead>
				<tr>
					<th>체크인</th>
					<th>체크아웃</th>
					<th>객실 타입</th>
					<th>객실 번호</th>
					<th>인원수</th>
					<th>결제</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				
				<%for(BookingsDto bookingsDto: list){ %>
				<tr>
					<td><%=bookingsDto.getBookingCheckin().substring(0, 10) %></td>
					<td><%=bookingsDto.getBookingCheckout().substring(0, 10) %></td>
					<td><%=bookingsDto.getBookingRoomType() %></td>
					<td><%=bookingsDto.getBookingRoomNo() %></td>
					<td><%=bookingsDto.getBookingPeople() %></td>
					<td><a href = "<%=request.getContextPath()%>/pay/pay.jsp?bookingOrderNo=<%=bookingsDto.getBookingOrderNo() %>"><button>결제</button></a></td>
					<td><a href = "<%=request.getContextPath() %>/bookings/delete.kh?bookingOrderNo=<%=bookingsDto.getBookingOrderNo() %>"><button>예약 취소</button></a></td>
					</tr>
			<%} %>
			</tbody>	
				
		</table>
		<h3>테스트용으로 아이디 testuser로 넣어놈(수정해야함)</h3>
		<h3>예약취소는 확인창 띄워줄까?</h3>
</body>
</html>