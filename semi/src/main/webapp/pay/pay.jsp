
<%@page import="semi.beans.SeasonDao"%>
<%@page import="semi.beans.BookingsDao"%>
<%@page import="semi.beans.BookingsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String memberId = (String)session.getAttribute("login");
	boolean login = memberId != null;
	
	String bookingMemberId = (String)request.getSession().getAttribute("id");
%>    
    
<%
	//준비
	//예약번호를 기반으로 방 번호 뽑기
	int bookingOrderNo = Integer.parseInt(request.getParameter("bookingOrderNo"));

	BookingsDto bookingsDto = new BookingsDto();
	BookingsDao bookingsDao = new BookingsDao();
	bookingsDto = bookingsDao.showDetail(bookingOrderNo);
	int bookingRoomNo = bookingsDto.getBookingRoomNo();
	
	
	//체크인&체크아웃날짜 기반으로 성수기/비성수기 찾기
	SeasonDao seasonDao = new SeasonDao();
	String checkinSeasonType = seasonDao.CheckinSeasonType(bookingOrderNo);
	String checkoutSeasonType = seasonDao.CheckoutSeasonType(bookingOrderNo);
	
	
	//1일 금액 산정 = 체크인 또는 체크아웃 중 하나라도 성수기에 포함되면
	//해당 객실의 성수기 가격을 받는다
	int price;
	if (checkinSeasonType == "peak" || checkoutSeasonType == "peak") {
		price = seasonDao.PeakSeasonPrice(bookingRoomNo);
	}
	else {
		price = seasonDao.OffSeasonPrice(bookingRoomNo);
	}
	
	
	//총 이용하는 날짜 알아내기
	int stayPeriod = seasonDao.stayPeriod(bookingOrderNo);
	
	
	//총 금액처리
	int payTotalPrice = price * stayPeriod;
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
			<td><%=bookingsDto.getBookingOrderNo() %>번</td>
		</tr>
		<tr>
			<th>고객 아이디</th>
			<td><%=bookingsDto.getBookingMemberId() %></td>
		</tr>
		<tr>
			<th>객실타입 [객실번호]</th>
			<td><%=bookingsDto.getBookingRoomType()%> [<%=bookingsDto.getBookingRoomNo()%>호]</td>
		</tr>
	    <tr>
			<th>체크인</th>
			<td><%=bookingsDto.getBookingCheckin()%></td>
		</tr>
		<tr>
			<th>체크아웃</th>
			<td><%=bookingsDto.getBookingCheckout()%></td>
		</tr>
		<tr>
			<th>인원</th>
			<td><%=bookingsDto.getBookingPeople()%>명</td>
		</tr>
		<tr>
			<th>결제될 금액</th>
			<td><%=payTotalPrice %>원</td>
		</tr>
		
	</table>
	
		<div>
			<a href = "<%=request.getContextPath()%>/pay/add.kh?bookingOrderNo=<%=bookingOrderNo %>&payTotalPrice=<%=payTotalPrice%>">결제하기</a>
		</div>

</body>
</html>