<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header -->
<jsp:include page="/template/header.jsp"></jsp:include>


  <style>
    /*roomInfo.jsp*/
.roomListj {
	width: 230px;
	height: 300px;
	position: relative;
	top: 50%;
	left: 1%;
	float: left;
	margin: 2%;
	background: rgb(39, 76, 119);
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
	color: white;
}

.tablej th {
	height: 10%;
	font-size: xx-large;
	border-bottom: 4px solid white;
	border-width: 60%;
	font-weight: bolder;
}

.tablej td {
	margin: 2% auto;
	height: 2%;
	font-size: large;
	font-weight: 900;
	color: white;
}

.tablej a:link {
	color: blue;
	text-decoration: none; /*밑줄 제거*/
}

.tablej a:visited {
	color: white;
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
	color: black;
	font-weight: 900;
	font-size: 14px;
	
}


    .azure_intro{
    position: relative;
    top: 33px;
    left: 47px;

    }
    
      h1.azure_intro:after {
      content: "";
      display: block;
      width: 1000px;
      border-bottom: 3px solid black;
      margin: 30px 0px;
      position: relative;
      left: 290px;
    }
    
    
    .Hotel_intro_all{
      position: relative;
      top: 41px;
      left: 50px;
      font-family: "Noto Sans KR";
      
    }
 
    .intro_first{
      font-size: 20px;
      margin: 10px;
      color: grey;
      padding: 10px;
    }

   .hotel_info{
       padding: 10px;
       position: relative;
       width: 1000px;
       font-size: 20px;
       right: -2px
       
   }

    .hotelintro_img{
    position: relative;
    width: 909px;
    left: 209px;
    padding: 73px;
    top: -45px;
    }


    

  </style>
</head>

<body>
	<div class="roomListj">
		<table class="tablej">
			<tr>
				<th>호텔소개</th>
			</tr>
			<tr>
				<td><a href="#">호텔소개</a></td>
			</tr>
			<tr>
				<td><a href="#">호텔정보</a></td>
			</tr>
			<tr>
				<td><a href="#">층별안내도</a></td>
			</tr>
			<tr>
				<td><a href="#">주변관광지</a></td>
			</tr>
			<tr>
				<td><a href="#">오시는길</a></td>
			</tr>
		</table>
	</div>
	

  <h1 class="azure_intro">
    Azure 호텔 정보
  </h1>


  <div class="Hotel_intro_all">
  <div class="intro_first"> 탁 트인 태평양을 바라보며 밝고 화사한 파스텔 톤의 인테리어로
      꾸며진 Azure 호텔은 세계 유명작가들의 <br>
      예술작품과 아열대정원, 그리고 싱그러운 미소와 정성 어린 서비스가 어우러진 고급 호텔입니다.  
  </div>
  

 <table class="hotel_info" >
    <div class ="hotel_info_des">
    <tr>
        <td style = "color: white; background-color: rgb(39, 76, 119);" >개관일</td>
        <td>1990년 7월 1일(중측동 개관 : 1998.7.1)</td>
    </tr>
    <tr>
        <td style = "color: white; background-color: rgb(39, 76, 119);">주소</td>
        <td>제주특별자치도 서귀포시 중문관광로 72번길 75</td>
    </tr>
    <tr>
        <td style = "color: white; background-color: rgb(39, 76, 119);">대표전화</td>
        <td>064-735-5114, 팩스 : 064-735-5414</td>
    </tr>
    <tr>
        <td style = "color: white; background-color: rgb(39, 76, 119);">홈페이지</td>
        <td>주소 넣어주세요</td>
    </tr>
    <tr>
        <td style = "color: white; background-color: rgb(39, 76, 119);">부지면적</td>
        <td>26.404평(87, 283㎡), 연건평 16,912평(56,126㎡), 건축면적 4,617평(15,294㎡)</td>
    </tr>
    <tr>
        <td style = "color: white; background-color: rgb(39, 76, 119);" >객실수</td>
        <td>89실</td>
    </tr>
    <tr>
        <td style = "color: white; background-color: rgb(39, 76, 119);">레스토랑</td>
        <td>더 파크뷰(올 데이 다이닝)</td>
    </tr>
    <tr>
        <td style = "color: white; background-color: rgb(39, 76, 119);">부대시설</td>
        <td>수영장, 헬스장, 레스토랑</td>
    </tr>
    <tr>
        <td style = "color: white; background-color: rgb(39, 76, 119);">건축</td>
        <td>외관설계 미국WATG사, 시공 : 삼성종합건설</td>
    </tr>
    <tr>
        <td style = "color: white; background-color: rgb(39, 76, 119);">인테리어</td>
        <td>프랑스 OGAWA & FERRE社</td>
    </tr>
    <tr>
        <td style = "color: white; background-color: rgb(39, 76, 119);">조경설계</td>
        <td>미국 BELT COLLINS社, 시공 : 삼성 에버랜드</td>
    </tr>
    <tr>
        <td style = "color: white; background-color: rgb(39, 76, 119);">교통안내</td>
        <td>제주국제공항으로부터 약 70~90분 소요되며 공항 리무진버스(600번), 택시 등 이용</td>
    </tr>
    <tr>
        <td style = "color: white; background-color: rgb(39, 76, 119);">주변명소</td>
        <td>	여미지 식물원, 테디베어박물관, 주상절리, 천지연 폭포, 천제연 폭포, 제주 컨벤션 센터(ICC JeJu)</td>
    </tr>
    <tr>
        <td style = "color: white; background-color: rgb(39, 76, 119);">제휴호텔</td>
        <td>일본 오꾸라 호텔, 인도 Taj호텔 제휴</td>
    </tr>
</div>
 </table>

  <div class = hotelintro_img>
    <div> <img src= "<%=request.getContextPath()%>/image/info.jpg" width= "100%" height= "100%"></div>
  </div>

</body>



 <!-- footer -->
<jsp:include page="/template/footer.jsp"></jsp:include>