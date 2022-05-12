<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<% 
	String bookingRoomType = request.getParameter("bookingRoomType"); 
	String bookingCheckIn = request.getParameter("bookingCheckIn"); 
	String bookingCheckOut = request.getParameter("bookingCheckOut"); 
	int bookingPeople = Integer.parseInt(request.getParameter("bookingPeople"));
	int bookingRoomNo = Integer.parseInt(request.getParameter("bookingRoomNo"));
	
	
	%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div align = "center">
		<h1>예약 정보 확인</h1>
		<form action = "add.kh" method = "post">
		<input type = "hidden" name = "bookingRoomType" value = "<%=bookingRoomType %>">
		<input type = "hidden" name = "bookingCheckIn" value = "<%=bookingCheckIn%>">
		<input type = "hidden" name = "bookingCheckOut" value = "<%=bookingCheckOut %>">
		<input type = "hidden" name = "bookingPeople" value = "<%=bookingPeople %>">
		<input type = "hidden" name = "bookingRoomNo" value = "<%=bookingRoomNo %>">
		
		<table border = "1" width = "600" height = "100" align = "center">
		
			<thead>
				<tr>
					<th>체크인</th>
					<th>체크아웃</th>
					<th>객실 타입</th>
					<th>객실 번호</th>
					<th>인원수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=bookingCheckIn %></td>
					<td><%=bookingCheckOut %></td>
					<td><%=bookingRoomType %></td>
					<td><%=bookingRoomNo %></td>
					<td><%=bookingPeople %></td>
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