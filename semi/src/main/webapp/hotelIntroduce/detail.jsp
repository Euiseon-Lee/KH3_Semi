<%@page import="semi.beans.HotelIntroduceDao"%>
<%@page import="semi.beans.HotelIntroduceDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//호텔 소개 상세 페이지 객체 생성
	int hotelIntroduceNo = Integer.parseInt(request.getParameter("hotelIntroduceNo"));
	
	HotelIntroduceDao hotelIntroducedao = new HotelIntroduceDao();
	HotelIntroduceDto hotelIntroduceDto = hotelIntroducedao.selectOne(hotelIntroduceNo); 
	
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 제목 내용 수정하기 틀 만듬 --%>
	<h1>제목 : <%=hotelIntroduceDto.getHotelIntroduceHead()%></h1>
	<h1>내용 : <%=hotelIntroduceDto.getHotelIntroduceContent() %></h1>
	
	<a href = "<%=request.getContextPath()%>/hotelIntroduce/edit.jsp?hotelIntroduceNo=<%= hotelIntroduceNo%>">수정하기</a>

</body>
</html>