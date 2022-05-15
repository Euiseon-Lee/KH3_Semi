<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<% 
	String bookingRoomType = request.getParameter("bookingRoomType"); 
	String bookingCheckIn = request.getParameter("bookingCheckIn"); 
	String bookingCheckOut = request.getParameter("bookingCheckOut"); 
	int bookingPeople;
	if(request.getParameter("bookingPeople").equals("10명")){
	bookingPeople = Integer.parseInt(request.getParameter("bookingPeople").substring(0, 2));
	}else{
	bookingPeople = Integer.parseInt(request.getParameter("bookingPeople").substring(0, 1));
	}
	
	int bookingRoomNo = Integer.parseInt(request.getParameter("bookingRoomNo"));
	
	//String -> Date 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	//체크인-아웃 날짜를 date로 변환해서 뽑음
	Date checkIn = new Date(sdf.parse(bookingCheckIn).getTime());
	Date checkOut = new Date(sdf.parse(bookingCheckOut).getTime());
	//머무는 일자를 구하는 코드
	long roomDay = ((checkOut.getTime()-checkIn.getTime())/1000)/(24*60*60);


	%>

<% 
   //로그인 상태 확인 코드
   String memberId = (String) session.getAttribute("login");
   boolean login = memberId != null;
   
   //관리자 확인 코드
   String auth =(String)session.getAttribute("auth");
   boolean admin = auth != null && auth.equals("관리자");
   
   //Q/A 비밀번호 세션
   String password = (String)session.getAttribute("password");
   //Q/A 아이디 세션
   String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세미 프로젝트</title>

<!-- 구글 폰트 CDN -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/test.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/layout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/commons.css">

<!--swiper-->
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<!-- 뒤로가기 안되게 하는 기능 -->
<script type="text/javascript">
 			window.history.forward();
 	function noBack(){window.history.forward();}
</script>


</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">

<!-- 메인시작 -->

        <!--header 영역-->
            <header>
                <a href="<%=request.getContextPath()%>"> <!--헤더 로고 클릭 시 메인으로 이동-->
                    <img src="<%=request.getContextPath()%>/image/logo_003.png" width="300" height="100">
                </a>
  
        <!--header link(회원가입/로그인) 영역
            1. 비회원 : 회원가입, 로그인
            2. 회원 : 로그인, 로그아웃
            3. 관리자 : 관리자, 로그아웃
        -->
      <!-- 상위 메뉴 -->
      <%if(login) {%>
         <div>
                <a href="<%=request.getContextPath()%>/member/logout.kh" class="link link-header link3">로그아웃</a>
            </div>
         <div>
                <a href="<%=request.getContextPath()%>/mypage/mypage.jsp" class="link link-header link2">마이페이지</a>
            </div>
      <%}else{ %>
         <div>
                <a href="<%=request.getContextPath()%>/member/login.jsp" class="link link-header link2">로그인</a>
            </div>
            <div>
                <a href="<%=request.getContextPath()%>/member/join.jsp" class="link link-header link3">회원가입</a>
            </div>
      <%} %>
      <!-- 관리자페이지 만들경우 링크 추가  -->
      <%if(admin){ %>
         <div>
                <a href="<%=request.getContextPath()%>/member/logout.kh" class="link link-header link3">로그아웃</a>
            </div>
            <div>
                <a href="<%=request.getContextPath()%>##" class="link link-header link2">관리자</a>
            </div>
      <%} %>
   </header>
   
   <!-- 메뉴 영역 --> <!--메뉴 위치 및 링크 수정 예정-->
            <nav>
                <!-- 디자인이 이루어지도록 ul로 메뉴를 구현 -->
                <ul class="menu">
                    <li>
                        <a href="<%=request.getContextPath()%>/hotelIntroduce/list.jsp">호텔소개</a>
                        <ul>
                            <li><a href="<%=request.getContextPath()%>/hotelIntroduce/list.jsp"detail.jsp?hotelIntroduceNo=1">호텔소개</a></li>
                            <li><a href="<%=request.getContextPath()%>/hotelIntroduce/list.jsp"detail.jsp?hotelIntroduceNo=2">호텔정보</a></li>
                            <li><a href="<%=request.getContextPath()%>/hotelIntroduce/list.jsp"detail.jsp?hotelIntroduceNo=3">층별안내도</a></li>
                            <li><a href="<%=request.getContextPath()%>/hotelIntroduce/list.jsp"detail.jsp?hotelIntroduceNo=4">주변관광지</a></li>
                            <li><a href="<%=request.getContextPath()%>/hotelIntroduce/list.jsp"detail.jsp?hotelIntroduceNo=5">오시는길</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/roomIntroduce/list.jsp">객실소개</a>
                    </li>  
                    <li>
                        <a href="#">부대시설</a>
                        <ul>
                            <li><a href="<%=request.getContextPath()%>#">수영장</a></li>  
                            <li><a href="<%=request.getContextPath()%>#">헬스센터</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/qa/list.jsp">문의하기</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/review/list.jsp">이용후기</a>
                    </li>
                    <li class="reserve">
                        <a href="<%=request.getContextPath()%>/bookings/add.jsp">예약하기</a>
                        <ul>
                            <li><a href="<%=request.getContextPath()%>/pay/list.jsp">결제목록</a></li>
                          </ul>
                    </li>
                </ul> 
            </nav>
<section>
<style>
	div, span, label, p, header, footer,  
section, article, aside, nav, a , ul, ol, li {
    border:none;
}
	</style>
<!--  뒤로가기 안되게 해주는 자바스크립트 기능(유진님과 body떄문에 헤더관련으로 얘기해봐야함--> 
<!--
<script type="text/javascript">
 			window.history.forward();
 	function noBack(){window.history.forward();}
</script>



<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
-->



		<div class = "container w850 m40">
		<div class = "row center">		
		<h1>BOOKING</h1>
		</div>
		 <div class = "row center m30">
           <span id="han1" style="font-size:17px">01객실타입 선택</span>&nbsp;&nbsp;
           <span id="han1" style="font-size:17px">02호실,인원 선택</span>&nbsp;&nbsp;
           <span id="han" style="font-size:17px">03예약정보 확인</span>
       </div>
		<form action = "add.kh" method = "post">
		<input type = "hidden" name = "bookingRoomType" value = "<%=bookingRoomType %>">
		<input type = "hidden" name = "bookingCheckIn" value = "<%=bookingCheckIn%>">
		<input type = "hidden" name = "bookingCheckOut" value = "<%=bookingCheckOut %>">
		<input type = "hidden" name = "bookingPeople" value = "<%=bookingPeople %>">
		<input type = "hidden" name = "bookingRoomNo" value = "<%=bookingRoomNo %>">
		
		<table class="table table-underline table-hover">
		
			<thead>
				<tr>
					<th colspan="2" height =>체크인
					~ 체크아웃
					</th>
					<th>객실 타입</th>
					<th>객실 번호</th>
					<th>인원</th>
				</tr>
			</thead>
			<tbody  align = "center">
				<tr>
					<td colspan = "2" align = "center"><%=bookingCheckIn %> ~
					<%=bookingCheckOut %> (<%=roomDay %>박/ <%=roomDay+1 %>일)
					</td>
					<td><%=bookingRoomType %>룸</td>
					<td><%=bookingRoomNo %>호</td>
					<td><%=bookingPeople %>명</td>
				</tr>
			</tbody>	
				
		</table>
				<div class = "row center m50">
				<h2 align = "center">
				<input type = "submit" value = "예약 등록" class ="han-button">
				</h2>
				</div>
			
			
				</form>
		</div>

<jsp:include page="/template/footer.jsp"></jsp:include>
