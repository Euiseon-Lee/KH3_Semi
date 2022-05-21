<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	margin: 0.5% auto;
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
      width: 900px;
      border-bottom: 3px solid black;
      margin: 30px 0px;
      position: relative;
      left: 270px;
    }


    .hotelintro_img{
    position: relative;
    top: -230px;
    left: 330px;
    text-align: center;
    width: 487px;
    }
  
   
  </style>
	<div class="roomListj">
		<table class="tablej">
			<tr>
				<th>부대시설</th>
			</tr>
			<tr>
				<td><a href="<%=request.getContextPath()%>/amenities/pool.jsp">POOL</a></td>
			</tr>
			<tr>
				<td><a href="<%=request.getContextPath()%>/amenities/fitness.jsp">FITNESS</a></td>
			</tr>
			<tr>
				<td><a href="<%=request.getContextPath()%>/amenities/restaurant.jsp">RESTAURANT</a></td>
			</tr>
		</table>
	</div>
	<h1 class="azure_intro">
    [ POOL ]
  </h1>
  <br>
  <div class = "container w900 m30">
  	<div class ="row">
  	<img src = "<%=request.getContextPath()%>/image/infinity1.png" width ="100%">
  	<br><br><br> <img src = "<%=request.getContextPath()%>/image/infinity2.png" width ="100%">
  	<br><br><br><br><img src = "<%=request.getContextPath()%>/image/infinity3.png" width ="100%">
  	</div>
  	<div class ="row">
  	<img src = "<%=request.getContextPath()%>/image/private1.png" width ="100%">
  	<br><br><br> <img src = "<%=request.getContextPath()%>/image/private2.png" width ="100%">
  	<br><br><br><br><img src = "<%=request.getContextPath()%>/image/private3.png" width ="100%">
  	</div>
  	
   </div>
  
  
<jsp:include page="/template/footer.jsp"></jsp:include>
