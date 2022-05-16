<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SITE MAP</title>

<jsp:include page="/template/header.jsp"></jsp:include>

    <!-- 구글 폰트 CDN -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
<!-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/test.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/layout.css"> -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/commons.css"> 

<style>
	ul.sitemap,
	ul.sitemap ul{ 
		list-style:none;
		
		padding:0; 
		margin:0;
        height:100px;
	}
	ul sitemap::after { 
		content:"";
		display:block;
		clear:both;
	}
	ul.sitemap > li { 
		float:left;
        height:300px;
		width:300px;
    }
	ul.sitemap ul { 
		width:100%;
	}	
    ul.sitemap {  
        font-size: 24px;
    }  
	ul.sitemap ul{
		font-size:16px;
	}
    ul.sitemap > li a {
        text-decoration:underline;
    }
    ul.sitemap > li > ul a {
        text-decoration: none;
    }
    ul.sitemap li {
        padding: 0.5em;
        text-align: center;
     }
    ul.sitemap li a {
        color:rgb(36,76,119);
    }
</style>

</head>
<body>
	<ul class="container m60">
	<ul class="row left m40 ">
	<div class="m30">
		<h1>사이트맵</h1>
	</div>	
	<ul class="sitemap">
		<li>
            <div class="m30">
			<a href="#">회원정보</a>
            </div>
			<ul>
				<li><a href="/semi/member/join.jsp">회원가입</a>
				<li><a href="/semi/member/login.jsp">로그인</a>
				<li><a href="/semi/member/find_id.jsp">ID찾기</a>
				<li><a href="/semi/member/find_pw.jsp">PW찾기</a>
			</ul>
		</li>
		<li>
            <div class="m30">
			<a href="#">호텔소개</a>
            </div>
			<ul>
				<li><a href="/semi/hotelIntroduce/hotelintro.jsp">호텔소개</a>
				<li><a href="/semi/hotelIntroduce/hotelinfo.jsp">호텔정보</a>
				<li><a href="/semi/hotelIntroduce/floorguide.jsp">층별안내도</a>
				<li><a href="/semi/hotelIntroduce/attraction.jsp">주변관광지</a>
				<li><a href="/semi/hotelIntroduce/away.jsp">오시는길</a>
			</ul>
		</li>
		<li>
            <div class="m30">
			<a href="#">객실소개</a>
            </div>
			<ul>
				<li><a href="/semi/Roomcollection/Standard.jsp">Standard</a>
				<li><a href="/semi/Roomcollection/deluxe.jsp">Deluxe</a>
				<li><a href="/semi/Roomcollection/premier.jsp">Premier</a>
				<li><a href="/semi/Roomcollection/Suite.jsp">Suite</a>
			</ul>
		</li>
		<li>
            <div class="m30">
			<a href="#">부대시설</a>
            </div>
			<ul>
				<li><a href="/semi/amenities/pool.jsp">POOL</a>
				<li><a href="/semi/amenities/fitness.jsp">피트니스</a>
				<li><a href="/semi/amenities/restaurant.jsp">레스토랑</a>
			</ul>
		</li>
		<li>
            <div class="m30">
			<a href="#">고객문의</a>
            </div>
			<ul>
				<li><a href="/semi/qa/list.jsp">Q/A 게시판</a>
				<li><a href="/semi/qa/write.jsp">Q/A 작성</a>
			</ul>
		</li>
		<li>
            <div class="m30">
			<a href="#">이용후기</a>
            </div>
			<ul>
				<li><a href="/semi/review/list.jsp">후기 게시판</a>
			</ul>
		</li>	
		<li>
            <div class="m30">
			<a href="#">예약</a>
            </div>
			<ul>
				<li><a href="/semi/bookings/add.jsp">예약하기</a>
				<li><a href="/semi/mypage/pay/list.jsp">결제목록</a>
			</ul>
		</li>	
	</ul>
	
</body>
</html>
<jsp:include page="/template/footer.jsp"></jsp:include>