<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인 상태 확인 코드
	
	String memberId = (String)session.getAttribute("login");

	boolean login = memberId != null;
	
	//관리자 검사
	String auth = (String)session.getAttribute("auth");
	boolean admin = auth != null && auth.equals("관리자");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세미 프로젝트</title>
</head>
<body>
	<ul>
		<li><a href="<%=request.getContextPath()%>/member/login.jsp">로그인</a></li>
		<li><a href="<%=request.getContextPath()%>/member/logout.kh">로그아웃</a></li>
	</ul>
	<ul>
		<li><a href="#">호텔소개</a></li>
		<li><a href="#">객실소개</a></li>
		<li><a href="#">부대시설</a></li>
		<li><a href="<%=request.getContextPath()%>/qa/list.jsp">Q/A게시판</a></li>
		<li><a href="<%=request.getContextPath()%>/review/list.jsp">후기게시판목록</a></li>
	</ul>
</body>
</html>