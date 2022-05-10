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
<title>Azure에 방문해주셔서 감사합니다.</title>

<!-- 구글 폰트 CDN -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/layout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/commons.css">
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/test.css"> --%>

</head>
<body>
	
	<main>
	
	     <header>
             <h1>Azure 헤더</h1>
        </header>
	
	<ul>
		<li><a href="<%=request.getContextPath()%>/member/login.jsp">로그인</a></li>
		<li><a href="<%=request.getContextPath()%>/member/logout.kh">로그아웃</a></li>
	</ul>
	<ul>
		<li><a href="#">호텔소개</a></li>
		<li><a href="#">객실소개</a></li>
		<li><a href="#">부대시설</a></li>
		<li><a href="<%=request.getContextPath()%>/qa/list.jsp">Q/A게시판</a></li>
		<li><a href="#">후기게시판</a></li>
	</ul>
	
	
	</main>
</body>
</html>