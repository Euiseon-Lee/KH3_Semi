<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//현재 날짜 구하기
	LocalDate today = LocalDate.now();
	
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

	 <div class="container w850 m40">
       <div class = "row center">
           <h1>BOOKING</h1>
       </div>
       <div class = "row center m30">
           <span id="han" style="font-size:17px">01객실타입 선택</span>&nbsp;&nbsp;
           <span id="han1" style="font-size:17px">02호실,인원 선택</span>&nbsp;&nbsp;
           <span id="han1" style="font-size:17px">03예약정보 확인</span>
       </div>
       <div class = "row center m30">
        <form action = "possibleRooms.jsp" method = "get">
            <span>
                <select name = "bookingRoomType" class = "han2">
                    <option value = "">객실타입을 선택해주세요.</option>
                    <option>스탠다드</option>
                    <option>디럭스</option>
                    <option>프리미어</option>
                    <option>스위트</option>
                </select>
            </span>&nbsp;&nbsp;&nbsp;
            
            <span>
                <input type = "date" class ="han2" name = "bookingCheckIn" required min = "<%=today%>" value = "<%=today%>">		 
            </span>&nbsp;&nbsp;&nbsp;
            
            <span>
                <input type = "date" class ="han2" name = "bookingCheckOut" required min = "<%=today%>" value = "<%=today%>">		 
            </span>&nbsp;
            <span>
                <input type ="submit" value = "다음" class ="han-button">
            </span>
            </form>
             <div class="row center m50">
         
            	<img src = "<%=request.getContextPath() %>/image/hansoek1.png" width = "700px">
           
        </div>
       </div>
    </div>
<jsp:include page="/template/footer.jsp"></jsp:include>
