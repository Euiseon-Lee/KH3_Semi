
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


<jsp:include page="/template/header.jsp"></jsp:include>
<head>
	<style>
	div, span, label, p, header, footer,  
section, article, aside, nav, a , ul, ol, li {
    border:none;
}
	</style>
</head>
		<div class ="container w850 m40">
			<div class = "row center">
				<h1>BOOKING</h1>
			</div>
			 <div class = "row center m30">
           <span id="han1" style="font-size:17px">01객실타입 선택</span>&nbsp;&nbsp;
           <span id="han" style="font-size:17px">02호실,인원 선택</span>&nbsp;&nbsp;
           <span id="han1" style="font-size:17px">03예약정보 확인</span>
       		</div>
       		<div class ="row center m30">
		<form action = "finalBookings.jsp">
		<input type = "hidden" name = "bookingRoomType" value = "<%=bookingRoomType%>">
		<input type = "hidden" name = "bookingCheckIn" value = "<%=bookingCheckIn%>">
		<input type = "hidden" name = "bookingCheckOut" value = "<%=bookingCheckOut%>">
		
		
		<select name = "bookingRoomNo" class = "han2">
			<option value ="">호실 선택</option>
		<%for(RoomsDto roomsDto : list){ %>
		
			<option><%=roomsDto.getRoomNo() %></option>
								
		<%} %>
		</select>&nbsp;&nbsp;&nbsp;
		
		<%if(bookingRoomType.equals("스위트")){ %>
		<select name = "bookingPeople" class = "han2">
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
		</select>&nbsp;&nbsp;&nbsp;
		<input type = "submit" value = "입력" class = "han-button">
		<%} else { %>
		<select name = "bookingPeople" class = "han2">
		<option value = "">인원 선택</option>
		<option>1명</option>
		<option>2명</option>
		<option>3명</option>
		<option>4명</option>
		</select>&nbsp;&nbsp;&nbsp;
		<input type = "submit" value = "입력" class = "han-button">
		<%} %>
		
		</form>
		    <div class="row center m50">
         
            	<img src = "<%=request.getContextPath() %>/image/hansoek1.png" width = "700px">
           
        </div>
       		</div>
	</div>
<jsp:include page="/template/footer.jsp"></jsp:include>
