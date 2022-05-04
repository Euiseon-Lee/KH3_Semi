<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	<label>비공개</label>
    <input type="checkbox" value="Y" name="qaPublic" >
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