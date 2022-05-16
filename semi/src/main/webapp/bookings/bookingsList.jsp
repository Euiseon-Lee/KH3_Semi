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
		List<BookingsDto> list = bookingsDao.selectList(memberId);
		
	
	%>
<jsp:include page="/template/header.jsp"></jsp:include>
	<style>
	 .han2-button{
        height: 30px;
        width: 50px;
        background-color: rgb(39, 76, 119);
		color:white;
}
    .han2-button:hover{
        background-color: rgb(39, 76, 119);
        color: white;
    }
	</style>
	<div class ="container w850 m40">
		<div class = "row center">
		<h1>내 예약 내역</h1>
		</div>
		
		<table class="table table-underline table-hover m30">
		
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
					<td><a href = "<%=request.getContextPath()%>/pay/pay.jsp?bookingOrderNo=<%=bookingsDto.getBookingOrderNo() %>"><button class = "han2-button">결제</button></a></td>
					<td><a href = "<%=request.getContextPath() %>/bookings/delete.kh?bookingOrderNo=<%=bookingsDto.getBookingOrderNo() %>"><button>예약 취소</button></a></td>
					</tr>
			<%} %>
			</tbody>	
				
		</table>
	</div>
<jsp:include page="/template/footer.jsp"></jsp:include>
