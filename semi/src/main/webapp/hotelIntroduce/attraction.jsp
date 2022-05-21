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
	color: white;
	text-decoration: none; /*밑줄 제거*/
}

.tablej a:visited {
	color: white;
	text-decoration: none;
}

.tablej a:hover { /*객실 hover 처리 */
	color: black;
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
    
    .attraction_imgorder{
    position: relative;
    top: -238px;
    left: 350px;
    width: 790px;
    
    </style>
   </head>  
    
 <body>
	<div class="roomListj">
		<table class="tablej">
			<tr>
				<th>호텔소개</th>
			</tr>
			<tr>
				<td><a href="<%=request.getContextPath()%>/hotelIntroduce/hotelintro.jsp">호텔소개</a></td>
			</tr>
			<tr>
				<td><a href="<%=request.getContextPath()%>/hotelIntroduce/hotelinfo.jsp">호텔정보</a></td>
			</tr>
			<tr>
				<td><a href="<%=request.getContextPath()%>/hotelIntroduce/floorguide.jsp">층별안내도</a></td>
			</tr>
			<tr>
				<td><a href="<%=request.getContextPath()%>/hotelIntroduce/attraction.jsp">주변관광지</a></td>
			</tr>
			<tr>
				<td><a href="<%=request.getContextPath()%>/hotelIntroduce/away.jsp">오시는길</a></td>
			</tr>
		</table>
	</div>
	

  <h1 class="azure_intro">
    주변 관광지
  </h1>
  
  <div class = "attraction_imgorder">
    <div> <img src= "<%=request.getContextPath()%>/image/Firstimg.png" width= "100%" height= "100%"></div>
    <div> <img src= "<%=request.getContextPath()%>/image/secondimg.png"width= "100%"  height= "100%"></div>
  	<div> <img src= "<%=request.getContextPath()%>/image/thirdimg.png"width= "100%"  height= "100%"></div>
  </div>
 

 
 </body>
<jsp:include page="/template/footer.jsp"></jsp:include>