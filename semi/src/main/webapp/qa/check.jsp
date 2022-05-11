<%@page import="semi.beans.QaDao"%>
<%@page import="semi.beans.QaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int qaNo = Integer.parseInt(request.getParameter("qaNo"));
    int groupNo= Integer.parseInt(request.getParameter("groupNo"));
    QaDao qaDao = new QaDao(); 
	QaDto qaDto = qaDao.selectOne(qaNo);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h1>비밀번호를 입력해주세요</h1>
 <form action="checkpw.kh?qaNo=<%=qaNo %>&groupNo=<%=groupNo %>" method="post">
 <input type="password" name="memberPwCheck">
 <button type="submit">확인</button>
 </form>
 <div>
 	<a href="list.jsp">목록</a>
 </div>
</body>
</html>