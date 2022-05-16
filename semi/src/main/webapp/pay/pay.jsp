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
    
<jsp:include page="/template/header.jsp"></jsp:include>

<style>
    .link-btn-euiseon{
    	text-decoration: none;
		border: 2px solid;
        padding: 0.5em;
        display: inline-block;

        background-color: white;
        color: rgb(39, 76, 119);
        
        height: 40px;
        width: 180px;
        font-weight: bold;
	}
    .link-btn-euiseon:hover{
        background-color: rgb(39, 76, 119);
        color: white;
    }
    

}
</style>

<div class="container w850 m10 center">

	<div class="row center m50">
		<h1 class="title-text">예약내역 확인</h1>	
	</div>

	
	<div class="row center m30">
		<table class="table table-underline table-hover">
			<tr>
				<th width="40%" class="middle-text-center" style="font-weight: bold">예약번호</th>
				<td style=" color: rgb(39, 76, 119)"><%=bookingsDto.getBookingOrderNo() %>번</td>
			</tr>
			<tr>
				<th width="40%" class="middle-text-center" style="font-weight: bold">고객 아이디</th>
				<td style=" color: rgb(39, 76, 119)"><%=bookingsDto.getBookingMemberId() %></td>
			</tr>
			<tr>
				<th width="40%" class="middle-text-center" style="font-weight: bold">객실타입 [객실번호]</th>
				<td style=" color: rgb(39, 76, 119)"><%=bookingsDto.getBookingRoomType()%> [<%=bookingsDto.getBookingRoomNo()%>호]</td>
			</tr>
		    <tr>
				<th width="40%" class="middle-text-center" style="font-weight: bold">체크인</th>
				<td style=" color: rgb(39, 76, 119)"><%=bookingsDto.getBookingCheckin()%></td>
			</tr>
			<tr>
				<th width="40%" class="middle-text-center" style="font-weight: bold">체크아웃</th>
				<td style=" color: rgb(39, 76, 119)"><%=bookingsDto.getBookingCheckout()%></td>
			</tr>
			<tr>
				<th width="40%" class="middle-text-center" style="font-weight: bold">인원</th>
				<td style=" color: rgb(39, 76, 119)"><%=bookingsDto.getBookingPeople()%>명</td>
			</tr>
			<tr>
				<th width="40%" class="middle-text-center" style="font-weight: bold">결제될 금액</th>
				<td style=" color: rgb(39, 76, 119)"><%=payTotalPrice %>원</td>
			</tr>	
		</table>
	</div>	
	<div>
		<a href = "<%=request.getContextPath()%>/pay/add.kh?bookingOrderNo=<%=bookingOrderNo %>&payTotalPrice=<%=payTotalPrice%>" class="link-btn-euiseon link-btn-euiseon:hover">
			결제하기
		</a>
	</div>
</div>		

<jsp:include page="/template/footer.jsp"></jsp:include>