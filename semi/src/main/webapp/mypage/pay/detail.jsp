<%@page import="semi.beans.PayDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.PayDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
 	//결제페이지 특성상 특정 아이디가 결제내역만이 나와야한다
	//어떻게 특정할것인가? payMemberId를 검색하는 조회구문이 필요하다
	//조회구문에서 사용할 String PayMemberId 부터 만들자
	//어디서 회원정보를 가져올까? = 세션에서 가져오자
	String memberId = (String)session.getAttribute("login");
	boolean login = memberId != null;
	
	String payMemberId = (String)request.getSession().getAttribute("id");
	%>
	
    <%
	//결제 상세 객체 생성
	int payOrderNo = Integer.parseInt(request.getParameter("payOrderNo"));

	PayDao payDao = new PayDao();
	PayDto payDto = payDao.showPayDetail(payOrderNo);
	
	//paymentCheck 불러오기 => 결제 취소가 가능한지 확인하는 메서드 호출
	boolean paymentCheck = payDao.paymentCheck(payMemberId, payOrderNo);
	
	//reviewCheck 불러오기 => 리뷰 작성이 가능한지 확인하는 메서드 호출
	boolean reviewCheck = payDao.reviewCheck(payMemberId, payOrderNo);
	%>
	
	<%
	boolean isPaid = payDto != null;
	String status;
	if(isPaid){
		status = "결제 완료";
	}
	else{
		status = "결제 취소";
	}
	%>
	

	
<jsp:include page="/template/header.jsp"></jsp:include>

<style>
    .link-euiseon{
        text-decoration: none;
        font-weight: bold;
        color: rgb(71, 71, 71);
    }
</style>

<div class="container w850 m10 center">

	<div class="row center m40">
		<h1 class="title-text">결제내역 상세페이지</h1>
	</div>
	
	
	<div class="row center">
		<table class="table table-underline table-hover">
			<tr>
				<th width="40%" class="middle-text-center" style="font-weight: bold">주문번호 [결제 상태]</th>
				<td style=" color: rgb(39, 76, 119)"><%=payDto.getPayOrderNo() %>번 [<%=status %>]</td>
			</tr>
			<tr>
				<th width="40%" class="middle-text-center" style="font-weight: bold">고객 아이디</th>
				<td style=" color: rgb(39, 76, 119)"><%=payDto.getPayMemberId() %></td>
			</tr>
			<tr>
				<th width="40%" class="middle-text-center" style="font-weight: bold">객실타입 [객실번호]</th>
				<td style=" color: rgb(39, 76, 119)"><%=payDto.getPayRoomtype()%> [<%=payDto.getPayRoomNo()%>호]</td>
			</tr>
		    <tr>
				<th width="40%" class="middle-text-center" style="font-weight: bold">체크인</th>
				<td style=" color: rgb(39, 76, 119)"><%=payDto.getPayCheckIn()%></td>
			</tr>
			<tr>
				<th width="40%" class="middle-text-center" style="font-weight: bold">체크아웃</th>
				<td style=" color: rgb(39, 76, 119)"><%=payDto.getPayCheckOut()%></td>
			</tr>
			<tr>
				<th width="40%" class="middle-text-center" style="font-weight: bold">인원</th>
				<td style=" color: rgb(39, 76, 119)"><%=payDto.getPayPeople()%>명</td>
			</tr>
			<tr>
				<th width="40%" class="middle-text-center" style="font-weight: bold">결제 금액</th>
				<td style=" color: rgb(39, 76, 119)"><%=payDto.getPayTotalPrice()%>원</td>
			</tr>
			<tr>
				<th width="40%" class="middle-text-center" style="font-weight: bold">결제 일자</th>
				<td style=" color: rgb(39, 76, 119)"><%=payDto.getPayDate()%></td>
			</tr>
			<tr>
				<td style=" color: rgb(39, 76, 119)">
					<a href="<%=request.getContextPath()%>/mypage/pay/list.jsp" class="link-euiseon">&lt;&lt; 목록으로 돌아가기</a>
				</td>
				
				<td style=" color: rgb(39, 76, 119)">
					<%if(paymentCheck){ %>
						<a href="<%=request.getContextPath()%>/mypage/pay/cancel.jsp?payOrderNo=<%=payOrderNo%>" class="link link-btn">결제취소</a>
					<%} else if (reviewCheck) {%>
						<a href="<%=request.getContextPath()%>/review/write.jsp?payOrderNo=<%=payOrderNo%>" class="link link-btn">리뷰작성</a>
					<%} else {%>
						<a href="#" class="link-euiseon">❤❤ 현재 투숙 중입니다 ❤❤</a>
					<%} %>
				</td>
			</tr>
		</table>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>