<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//로그인 상태 확인 코드
	String memberId = (String) session.getAttribute("login");
	boolean login = memberId != null;
	
	//관리자 확인 코드
	String auth =(String)session.getAttribute("auth");
	boolean admin = auth != null && auth.equals("관리자");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세미 프로젝트</title>
</head>
<body>
<main>
	<header>
		<img src="logo">
		<!-- 상위 메뉴 -->
		<%if(login) {%>
		<ul>
			<li><a href="<%=request.getContextPath()%>/member/logout.kh">로그아웃</a></li>
			<li><a href="<%=request.getContextPath()%>/mypage/mypage.jsp">마이페이지</a></li>
		</ul>
		<%}else{ %>
		<ul>
			<li><a href="<%=request.getContextPath()%>/member/login.jsp">로그인</a></li>
			<li><a href="<%=request.getContextPath()%>/member/join.jsp">회원가입</a></li>
		</ul>
		<%} %>
		<!-- 관리자페이지 만들경우 링크 추가  -->
		<%if(admin){ %>
		<%} %>
	</header>
	
	<!-- 메뉴 -->
	<nav>
	<ul>
		<li><a href="<%=request.getContextPath()%>/hotelIntroduce/list.jsp">호텔소개</a></li>
		<li><a href="<%=request.getContextPath()%>/roomIntroduce/list.jsp">객실소개</a></li>
		<li><a href="#">부대시설</a></li>
		<li><a href="<%=request.getContextPath()%>/qa/list.jsp">Q/A</a></li>
		<li><a href="<%=request.getContextPath()%>/review/list.jsp">후기</a></li>
		<li><a href="<%=request.getContextPath()%>/booking/add.jsp">예약</a></li>
	</ul>
	</nav>
<section>
<article>