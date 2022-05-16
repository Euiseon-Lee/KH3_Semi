<%@page import="semi.beans.RoomIntroduceDto"%>
<%@page import="semi.beans.RoomIntroduceDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//객실 소개 상세 페이지 객체 생성
	int roomIntroduceNo = Integer.parseInt(request.getParameter("roomIntroduceNo"));
	
	RoomIntroduceDao roomIntroducedao = new RoomIntroduceDao();
	RoomIntroduceDto roomIntroduceDto = roomIntroducedao.selectOne(roomIntroduceNo); 
	
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 제목 내용 수정하기 틀 만듬 --%>
	<h1>제목 : <%=roomIntroduceDto.getRoomIntroduceHead()%></h1>
	<h1>내용 : <%=roomIntroduceDto.getRoomIntroduceContent() %></h1>

	<a href="edit.jsp?roomIntroduceNo=<%= roomIntroduceNo%>">수정하기</a>

</body>
</html>