<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<head>
	<title> Hotel Intro</title>
  
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
      font-size: 30px;
      margin: 10px;
    }

    .intro_second{
      font-size: 30px;
      margin: 10px;
    }
    
    .first_content{
      font-size: large;
     

    }
    
    .second_content{
      font-size: large;
      
    }

    .hotelintro_img{
    position: relative;
    top: -231px;
    left: 971px;
    text-align: center;
    width: 374px;
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
				<td><a href="hotelintro.jsp">호텔소개</a></td>
			</tr>
			<tr>
				<td><a href="hotelinfo.jsp">호텔정보</a></td>
			</tr>
			<tr>
				<td><a href="floorguide.jsp">층별안내도</a></td>
			</tr>
			<tr>
				<td><a href="attraction.jsp">주변관광지</a></td>
			</tr>
			<tr>
				<td><a href="away">오시는길</a></td>
			</tr>
		</table>
	</div>
	

  <h1 class="azure_intro">
    Azure 호텔 소개 
  </h1>



  <div class="Hotel_intro_all">
  <div class="intro_first"> An exclusive Getaway </div>
    <h6 class = "first_content"> 휴양지에서의 품격있는 호텔 문화를 정착하기 위해 연중<br>
      문화 및 엔터테인먼트 프로그램을 상설해 고객들에게 제공하고 있는 <br>
      Azure호텔은 레저 전문 직원인 G.A.O(Guest Activity Organizer), <br>
      문라라이트 스위밍 등 다양한 프로그램을 운영하여 <br>
      사계절 체재형 리조트로서의 트렌드를 이끌어 가고 있습니다. <br>
      누구나 한 번쯤 꿈꾸는 품격있고 화려한 일상 탈출을 경험하실 수 있습니다<br>
    </h6>
  
  

  <div class="intro_second"> A Leading Global Property </div>
    <h6 class= "second_content">세계자연문화유산인 제주의 아름다운 풍광을 담은 호텔로써 <br>
      그 명성을 쌓아가고 있는 Azure호텔은 품격과 문화가 있는 휴식지로서 <br>
      수많은 다양한 이벤트를 성공적으로 치러왔습니다. <br>
      이국적인 분위기와 수준 높은 시설을 선보이며 높은 서비스를 제공하고 있습니다. <br>
    </h6>

  </div>
	
  <div class = hotelintro_img>
    <div> <img src= "<%=request.getContextPath()%>/image/hotelintro1.jpg" width= "100%" height= "100%"></div>
    <div> <img src= "<%=request.getContextPath()%>/image/hotelintros.jpg"width= "100%"  height= "100%"></div>
  
  </div>


</body>



<jsp:include page="/template/footer.jsp"></jsp:include>