<%--호텔 소개 메뉴 만드는 페이지 --%>
<%@page import="semi.beans.HotelIntroduceDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.HotelIntroduceDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//호텔소개 목록 가져오기
	HotelIntroduceDao hotelIntroduceDao = new HotelIntroduceDao();
	List<HotelIntroduceDto> list = hotelIntroduceDao.selectList();
	

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
	<%-- for each 써서 쓰는법 --%>
	<%for(HotelIntroduceDto hotelIntroduceDto : list){ %>
		<h3>
		<a href = "detail.jsp?hotelIntroduceNo=<%=hotelIntroduceDto.getHotelIntroduceNo()%>">
		<%=hotelIntroduceDto.getHotelIntroduceHead() %>
		</a>
		</h3>
	<%} %>
		
		<%--  for each 안쓰고 하나하나 붙어서 메뉴바 만든거 
		<h3>소개</h3>
		<h3>
		<a href = "detail.jsp?hotelIntroduceNo=1">호텔 소개</a>
		</h3>
		<h3>
		<a href = "detail.jsp?hotelIntroduceNo=2">호텔 정보</a>
		</h3>
		<h3>
		<a href = "detail.jsp?hotelIntroduceNo=3">층별 안내도</a>
		</h3>
		<h3>
		<a href = "detail.jsp?hotelIntroduceNo=4">주변 관광지</a>		
		</h3>
		<h3>
		<a href = "detail.jsp?hotelIntroduceNo=5">오시는 길</a>		</h3>
		 --%>
	
	
	
	</div>
</body>
</html>