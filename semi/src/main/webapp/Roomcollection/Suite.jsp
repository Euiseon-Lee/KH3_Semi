<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="/template/header.jsp"></jsp:include>

<head>

<style>
html, body {
	margin: 0;
	width: 100%;
	height: 100%;
	font-family: 'Noto Sans KR', sans-serif;
}

모든 폴더의 header에 적용
    .headerj {
	height: 8%;
	text-align: center;
	font-size: 22px;
}

.headerj tr th {
	width: 13%;
}

.headerj a:link {
	text-align: center;
	color: black;
	text-decoration: none;
}

.headerj a:visited {
	color: black;
	text-decoration: none;
}

.headerj a:hover {
	color: black;
	text-decoration: none;
}

footer {
	bottom: 0;
	width: 100%;
}

/*roomInfo.jsp*/
.roomListj {
	width: 230px;
	height: 300px;
	position: relative;
	top: 50%;
	left: 1%;
	float: left;
	margin: 2%;
	background: mintcream;
	border: 1px solid grey;
}

.tablej {
	margin: 1% auto;
	width: 90%;
	height: 100%;
	text-align: left;
	padding-left: 1%;
	border-collapse: separate;
	border-spacing: 0 20px;
}

.tablej th {
	height: 10%;
	font-size: xx-large;
	border-bottom: 4px solid black;
	border-width: 60%;
	font-weight: bolder;
}

.tablej td {
	margin: 2% auto;
	height: 2%;
	font-size: large;
	font-weight: 900;
	color: black;
}

.tablej a:link {
	color: blue;
	text-decoration: none; /*밑줄 제거*/
}

.tablej a:visited {
	color: black;
	text-decoration: none;
}

.tablej a:hover { /*객실 hover 처리 */
	color: blue;
	text-decoration: none;
}

.selectj { /*글씨 눌렀을때 hover 배경 */
	background-color: none;
}

.nextj {
	right: 30px;
	position: absolute;
	border: none;
	background-color: black;
	color: black;;
	font-weight: 900;
	font-size: 14px;
	
}

.roomImgj {
	width: 62%;
	height: 400px;
	position: relative;
	bottom: -29px;
	left: 26%;
}

.Imgj {
	width: 100%;
	height: 100%;
	position: absolute;
	border-top: 5px solid black;
}

.Imgj>img {
	width: 100%;
	height: 100%;
	float: left;
}



.contentInfoj {
	float: left;
	width: 377px;
	height: 600px;
	position: relative;
	top: 3px;
	left: 330px;
	margin-bottom: 300px;
	font-size: large;
}

.roomContentj {
	position: absolute;
	width: 408px;
	height: 17%;
	top: 49px;
	left: 59px;
}

.infoContentj {
	position: relative;
    width: 487px;
    left: 10px;
    font-size: small;
    line-height: 18px;
    top: 102px;
    background: mintcream;
    border: 1px solid black;
    
}
}

.use_room{
	border: 1px solid black;
	background: mintcream;
	height: 10px; 
	
	
}

}
#amenityContentj {
	position: absolute;
	top: 61%;
	width: 100%;
	height: 30%;
	font-size: small;
	line-height: 23px;
}

.hotelInfoj {
	width: 436px;
	height: 430px;
	position: relative;
	bottom: -111px;
	left: 152%;
	background-color: mintcream;
	box-shadow: 1px 2px 1px #000;
	border: 1px solid grey;
}

.hotelTablej {
	top: 29px;
	width: 92%;
	height: 10px;
	position: absolute;
	margin-left: 4px;
	font-family: 'Noto Sans KR', sans-serif;
}

.hotelTablej li {
	font-size: small;
}

#reserveBtnj {
	float: none;
	height: 100%;
	width: 10%;
}

.rooms__button {
	top: 42px;
	height: 3rem;
	width: 97px;
	padding: 13px;
	font-size: 17px;
	font-weight: bold;
	background: azure;
	border: 1px solid black;
	box-shadow: 1px 2px 2px #000;
	cursor: pointer;
	outline: none;
	transition: all 0.12s ease-in-out;
	text-align: center;
	position: absolute;
	left: 100p;
	left: 910px;
}

}
.rooms__button:hover {
	background-color: white;
}

.rooms__button:active {
	background-color: gray;
	box-shadow: 1px 3px 4px #000;
	transform: translate(3px);
}

.rooms__button1 {
	top: 42px;
	height: 3rem;
	width: 100px;
	padding: 13px;
	font-size: 17px;
	font-weight: bold;
	background: azure;
	border: 1px solid black;
	box-shadow: 1px 2px 2px #000;
	cursor: pointer;
	outline: none;
	transition: all 0.12s ease-in-out;
	text-align: center;
	position: absolute;
	left: 100p;
	left: 785px;
}

}
.rooms__button1:hover {
	background-color: white;
}

.rooms__button1:active {
	background-color: gray;
	box-shadow: 1px 3px 4px #000;
	transform: translate(3px);
}

.rooms__button2 {
	top: 42px;
	height: 3rem;
	width: 187px;
	padding: 14px;
	font-size: 17px;
	font-weight: bold;
	background: azure;
	border: 1px solid black;
	box-shadow: 1px 2px 2px #000;
	cursor: pointer;
	outline: none;
	transition: all 0.12s ease-in-out;
	text-align: center;
	position: absolute;
	left: 100p;
	left: 574px;
}

}
.rooms__button2:hover {
	background-color: white;
}

.rooms__button2:active {
	background-color: gray;
	box-shadow: 1px 3px 4px #000;
	transform: translate(3px);
}

.standard_des {
	width: 472px;
	height: 127%;
	position: absolute;
	top: 183px;
	left: 10px;
	color: black;
	background: mintcream;
	border: 1px solid black;
	font-family: 'Noto Sans KR', sans-serif;
}


.roomcentent1 {
	
	background: mintcream;
	margin: 10px;
	padding: 10px;
	border: 1px solid black;
	font-family: 'Noto Sans KR', sans-serif;
}

 .select_all{
 	border: none;
    position: relative;
    top: -404px;
    left: 64px;
    width: 945px;
    height: 857px;
  


</style>


   

</head>


<body>

	<div class="roomListj"> 
		<table class="tablej">
			<tr>
				<th>객실</th>
			</tr>
			<tr>
				<td><a href="Standard.jsp">Standard</a></td>
			</tr>
			<tr>
				<td><a href="deluxe.jsp">Deluxe</a></td>
			</tr>
			<tr>
				<td><a href="premier.jsp">Premier</a></td>
			</tr>
			<tr>
				<td><a href="Suite.jsp">Suite</a></td>
			</tr>
		</table>
	</div>
	
		<div class="roomImgj">
			<div class="Imgj">
				<img src="<%=request.getContextPath()%>/image/suite.jpg">
			
				
			</div>
		</div >
		
		<div class="contentInfoj">
			<div class="roomContentj">
				<h1 style="color:black;">&nbsp;Suite</h1><br>
				<div class ="roomcentent1"> &nbsp;&nbsp; - 남부 프랑스의 휴양 리조트를 연상시키는 스위트룸 <br>
				&nbsp;&nbsp;&nbsp; <br> &nbsp;&nbsp; - 여유있는 침실과 안락한 거실로 구성되어 편안한 휴식을 만끽할 수 있습니다 
				</div>
				
				<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class = "standard_des"> <br> &nbsp;&nbsp; 편안한 느낌의 휴양 리조트 인테리어
				<div><br>&nbsp;&nbsp; - 가장 높은 층에서 푸른 바다와 산 전망을 즐길 수 있습니다 &nbsp;&nbsp;&nbsp;&nbsp;침실과 거실, 욕실이 분리되어 있으며 침실과 거실 사이는 고급스러운 루버도어 장식이 되어 있습니다. </div>
				</div>
		
					
				<div class="infoContentj">
					
					<br><br>
					<div class = "use_room">
					<td>객실이용</td>
					<ul> 
					<li>유·무선 인터넷(wi-fi)</li>
					<li>위성 TV 무료 – 32개 채널</li>
					<li>220V 또는 110V 전원</li>
					</ul>
					
					
					<td>부대시설</td>
					<ul>
					<li> 피트니스 클럽, 실내외 수영장 무료 이용</li>
					<li> 사우나 이용 시 유료</li>
					<li> 키즈클럽 시설 이용 무료</li>
					<li> 유아 물품 대여 서비스 (무료) (사전예약 필요)</li>
					</ul>
					
					<td>룸서비스</td>
					<ul>
					<li> 한식: 아침 07:30~10:00, 점심 12:00~14:30, 저녁 18:00~21:30 </li>
					<li> 일식: 저녁 18:00~21:30</li>
					<li> 양식 및 음료: 24시간</li>
					<li> (룸서비스 메뉴는 객실 내에 준비되어 있습니다.)</li>
					</ul>
					</div>
					
				</div>
				
	
		</div >
		
		<div class="hotelInfoj">
			<table class="hotelTablej">
				<tr>
					<td text-align="center"><h2>Hotel Info</h2></td>
				</tr>
				<tr>
					<td>
						<br><h4>조식/석식 이용 안내</h4>
						<ul>
							<li> 조식: (뷔페): 07:30 ~ 10:30</li>
							<li> 석식: (뷔페): 16:30 ~ 19:30</li>
						</ul>
					</td>
				</tr>
				
				<tr>
					<td>
						<h4>체크인 / 체크아웃 시간</h4>
						<ul>
							<li>체크인: 오후 2시 이후</li>
							<li>체크아웃: 11시</li>
						</ul>
					</td>
				</tr>
				
				<tr>
					<td>
						<h4> 정책 안내</h4>
						<ul>
							<li>예약 취소/변경 및 No-Show 안내</li>
							<li>숙박 예정일 7일 전: 위약금 없음</li>
							<li>숙박 예정일 6일 전 ~ 1일 전(18시까지 취소 및
   변경 시): 최초 1박 요금의 20%</li>
							<li>숙박 예정일 1일 전(18시 이후 취소 및 변경, 
   No-Show 시): 최초 1박 요금의 80%</li>
						</ul>
					</td>
				
			</table>
		</div >
		
		<div class="rooms__button">예약하기 </div>
		<div class="rooms__button1">문의하기 </div>
		<div class="rooms__button2">객실 어매니티 보기</div>
	

</div>

   
</body>

 <!-- footer -->
<jsp:include page="/template/footer.jsp"></jsp:include>