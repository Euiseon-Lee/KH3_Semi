<%@page import="semi.beans.RoomIntroduceDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.RoomIntroduceDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//객실소개 목록 가져오기
	RoomIntroduceDao roomIntroduceDao = new RoomIntroduceDao();
	List<RoomIntroduceDto> list = roomIntroduceDao.selectList();
	

%>







<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
	<%-- for each 써서 메뉴바 쓰는법 --%>
		<h3>객실</h3>
	<%for(RoomIntroduceDto roomIntroduceDto : list){ %>
		<h3>
		<a href = "detail.jsp?roomIntroduceNo=<%=roomIntroduceDto.getRoomIntroduceNo()%>">
		<%=roomIntroduceDto.getRoomIntroduceHead() %>
		</a>
		</h3>
		
	<%} %>
		<h3>전체 객실보기?</h3>
	
	
	</div>
</body>
</html>