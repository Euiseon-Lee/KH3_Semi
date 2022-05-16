<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>   
  
  <head>
  	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>jQuery</title>

    <!-- 구글 폰트 CDN -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->

	<!-- Kakao map CDN -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5b59532f9de9643dcefe3ee839f19d96"></script>
    <script type="text/javascript">
        $(function(){

			// 지도가 표시될 영역을 선택한다
			var container = document.querySelector(".map");

			// 지도의 옵션을 설정한다
			// - center : 지도의 중심 좌표(위도/경도)
			// - level : 지도 표시 수준
			var options = {
				center: new kakao.maps.LatLng(33.2474221,126.408173), // 위도경도 넣어서 위치 바꿀 수 있다 
				level: 3
			};

            

			// 지도를 생성한다
			var map = new kakao.maps.Map(container, options);
		});
    </script>
  	
  
  </head> 
  
 
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
    
   .img_one {
   position: relative;
   top: 100px;
   left: 100px;
   width: auto; height: auto;
   max-width: 100px;
   max-height: 100px;
   } 
    
    .map{
    position: relative;
    top: 20px;
    left: 48px;
    padding: 100px;
    padding: 127px;
    margin: 39px;
    }
   	
   	.comingto{
   	font-family: 'Noto Sans KR';
    position: relative;
    top: -4px;
    left: 340px;
    font-size: 15px;
    font-weight: bold;
    margin: 49px;
   	
   	}
    </style>
    
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
    오시는 길 
  </h1>
  
 
 <div class ="map" style="width:500px;height:400px;"></div>
 
 <div class = comingto>
 Azure 주소: 제주특별자치도 서귀포시 중문관광로 72번길 75
 </div>
 
 </body>
<jsp:include page="/template/footer.jsp"></jsp:include>