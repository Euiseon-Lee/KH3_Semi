<%@page import="semi.beans.HotelIntroduceDto"%>
<%@page import="semi.beans.HotelIntroduceDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 게시글 제목,내용 수정 가능하게 만듬 --%>
<%
	//호텔 번호 생성
	int hotelIntroduceNo = Integer.parseInt(request.getParameter("hotelIntroduceNo"));
	
	//호텔 객체 가져오기
	HotelIntroduceDao hotelIntroduceDao = new HotelIntroduceDao();
	HotelIntroduceDto hotelIntroduceDto = hotelIntroduceDao.selectOne(hotelIntroduceNo);
	

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
	<form action = "edit.kh" method = "post">
			<input type = "hidden" name = "hotelIntroduceNo" value = "<%=hotelIntroduceDto.getHotelIntroduceNo() %>">
			<input type = "hidden" name = "hotelIntroduceWriter" value = "<%=hotelIntroduceDto.getHotelIntroduceWriter() %>">
			<div>
				<label>제목</label>
				<input type = "text" name = "hotelIntroduceHead" autocomplete = "off" required value = "<%=hotelIntroduceDto.getHotelIntroduceHead() %>">
			</div>
			<div>
				<label>내용</label>
				<textarea name = "hotelIntroduceContent" autocomplete = "off" required cols = "50px" rows = "10px"><%=hotelIntroduceDto.getHotelIntroduceContent() %></textarea>
				
			</div>
			<div>
				<input type = "submit" value = "수정">
			</div>
	</form>
	</div>
</body>
</html>