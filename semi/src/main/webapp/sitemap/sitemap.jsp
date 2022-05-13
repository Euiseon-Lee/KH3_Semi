<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이트맵</title>

<jsp:include page="/template/header.jsp"></jsp:include>

    <!-- 구글 폰트 CDN -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/layout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/commons.css"> 
</head>
<body>
	<div class="container w850 m40">
	<div class="row center m30 ">
		<h1>사이트맵</h1>
	</div>
	
	<ul class="sitemap">
		<li>
			<a href="#">회원정보</a>
			<ul>
				<li><a href="/semi/member/join.jsp">회원가입</a>
				<li><a href="/semi/member/join.jsp">로그인</a>
				<li><a href="/semi/member/join.jsp">ID찾기</a>
				<li><a href="/semi/member/join.jsp">PW찾기</a>
			</ul>
		</li>
		<li>
			<a href="#">호텔소개</a>
			<ul>
				<li><a href="/semi/member/join.jsp">호텔소개</a>
				<li><a href="/semi/member/join.jsp">호텔정보</a>
				<li><a href="/semi/member/join.jsp">층별안내도</a>
				<li><a href="/semi/member/join.jsp">주변관광지</a>
				<li><a href="/semi/member/join.jsp">오시는길</a>
			</ul>
		</li>
		<li>
			<a href="#">객실소개</a>
			<ul>
				<li><a href="/semi/member/join.jsp">객실사진</a>
				<li><a href="/semi/member/join.jsp">?</a>
			</ul>
		</li>
		<li>
			<a href="#">부대시설</a>
			<ul>
				<li><a href="/semi/member/join.jsp">인피니티 풀</a>
				<li><a href="/semi/member/join.jsp">헬스센터</a>
			</ul>
		</li>
		<li>
			<a href="#">고객문의</a>
			<ul>
				<li><a href="/semi/member/join.jsp">Q/A 게시판</a>
				<li><a href="/semi/member/join.jsp">Q/A 작성</a>
			</ul>
		</li>
		<li>
			<a href="#">이용후기</a>
			<ul>
				<li><a href="/semi/member/join.jsp">후기 게시판</a>
				<li><a href="/semi/member/join.jsp">후기 작성</a>
			</ul>
		</li>	
		<li>
			<a href="#">예약</a>
			<ul>
				<li><a href="/semi/member/join.jsp">예약하기</a>
				<li><a href="/semi/member/join.jsp">결제목록</a>
			</ul>
		</li>	
	</ul>
</body>
</html>
<jsp:include page="/template/footer.jsp"></jsp:include>