<%@page import="semi.beans.QaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	QaDto qaDto = new QaDto();

	String qaPublic = request.getParameter("qaPublic");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="write.kh" method="post">
<%if(request.getParameter("superNo") != null){ %>   
<input type="hidden" name="superNo" value="<%=request.getParameter("superNo")%>">
<%} %>
<div>
	<h1>Q/A작성</h1>
</div>
<div>
	<label>제목</label>
	<input type="text" name="qaTitle">
</div>
<div>
	<%if(qaPublic == "Y"){//비공개 게시글일 경우 답글도 비공개 %>
	<label>비공개
    <input type="checkbox" value="Y" name="qaPublic" checked>
    </label>
    <%} else{%>
    <label>비공개
    <input type="checkbox" value="Y" name="qaPublic">
    </label>
    <%} %>
</div>
<div>
	<label>내용</label>
	<textarea name="qaContent"></textarea>
</div>
<div>
	<button type="submit">등록</button>
</div>
<div>
	<a href="list.jsp">목록</a>
</div>
</form>
</body>
</html>