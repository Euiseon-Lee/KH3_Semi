
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
       right: 10px;
   }

   .map{
    position: relative;
    top: -32px;
    left: 47px;
    margin: 92px;
   }


	
  </style>

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
          var container = document.querySelector('.map');

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
    오시는 길 
  </h1>

<div class="map" style="width:500px;height:400px;"></div>



</body>
 <!-- footer -->
<jsp:include page="/template/footer.jsp"></jsp:include>
