<%@page import="semi.beans.RoomIntroduceDto"%>
<%@page import="semi.beans.RoomIntroduceDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 게시글 제목,내용 수정 가능하게 만듬 --%>
<%
	//호텔 번호 생성
	int roomIntroduceNo = Integer.parseInt(request.getParameter("roomIntroduceNo"));
	
	//호텔 객체 가져오기
	RoomIntroduceDao roomIntroduceDao = new RoomIntroduceDao();
	RoomIntroduceDto roomIntroduceDto = roomIntroduceDao.selectOne(roomIntroduceNo);
	

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
			<input type = "hidden" name = "roomIntroduceNo" value = "<%=roomIntroduceDto.getRoomIntroduceNo() %>">
			<input type = "hidden" name = "roomIntroduceWriter" value = "<%=roomIntroduceDto.getRoomIntroduceWriter() %>">
			<div>
				<label>제목</label>
				<input type = "text" name = "roomIntroduceHead" autocomplete = "off" required value = "<%=roomIntroduceDto.getRoomIntroduceHead() %>">
			</div>
			<div>
				<label>내용</label>
				<textarea name = "roomIntroduceContent" autocomplete = "off" required cols = "50px" rows = "10px"><%=roomIntroduceDto.getRoomIntroduceContent() %></textarea>
				
			</div>
			<div>
				<input type = "submit" value = "수정">
			</div>
	</form>
	</div>
</body>
</html>