<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<% 
	String bookingRoomType = request.getParameter("bookingRoomType"); 
	String bookingCheckIn = request.getParameter("bookingCheckIn"); 
	String bookingCheckOut = request.getParameter("bookingCheckOut"); 
	int bookingPeople;
	if(request.getParameter("bookingPeople").equals("10명")){
	bookingPeople = Integer.parseInt(request.getParameter("bookingPeople").substring(0, 2));
	}else{
	bookingPeople = Integer.parseInt(request.getParameter("bookingPeople").substring(0, 1));
	}
	
	int bookingRoomNo = Integer.parseInt(request.getParameter("bookingRoomNo"));
	
	//String -> Date 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	//체크인-아웃 날짜를 date로 변환해서 뽑음
	Date checkIn = new Date(sdf.parse(bookingCheckIn).getTime());
	Date checkOut = new Date(sdf.parse(bookingCheckOut).getTime());
	//머무는 일자를 구하는 코드
	long roomDay = ((checkOut.getTime()-checkIn.getTime())/1000)/(24*60*60);


	%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<!-- 뒤로가기 안되게 해주는 자바스크립트 기능(유진님과 body떄문에 헤더관련으로 얘기해봐야함 
<script type="text/javascript">
 			window.history.forward();
 	function noBack(){window.history.forward();}
</script>

<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
-->
<body>
	
		<div align = "center">
		<h1>예약 정보 확인</h1>
		<form action = "add.kh" method = "post">
		<input type = "hidden" name = "bookingRoomType" value = "<%=bookingRoomType %>">
		<input type = "hidden" name = "bookingCheckIn" value = "<%=bookingCheckIn%>">
		<input type = "hidden" name = "bookingCheckOut" value = "<%=bookingCheckOut %>">
		<input type = "hidden" name = "bookingPeople" value = "<%=bookingPeople %>">
		<input type = "hidden" name = "bookingRoomNo" value = "<%=bookingRoomNo %>">
		
		<table border = "1" width = "700" height = "100" align = "center">
		
			<thead>
				<tr>
					<th colspan="2" height =>체크인
					~ 체크아웃
					</th>
					<th>객실 타입</th>
					<th>객실 번호</th>
					<th>인원</th>
				</tr>
			</thead>
			<tbody  align = "center">
				<tr>
					<td colspan = "2" align = "center"><%=bookingCheckIn %> ~
					<%=bookingCheckOut %> (<%=roomDay-1 %>박/ <%=roomDay %>일)
					</td>
					<td><%=bookingRoomType %>룸</td>
					<td><%=bookingRoomNo %>호</td>
					<td><%=bookingPeople %>명</td>
				</tr>
			</tbody>	
				
		</table>
				
				<h2 align = "center">
				<input type = "submit" value = "예약 등록">
				</h2>
			
			
				</form>
		</div>

</body>
</html>