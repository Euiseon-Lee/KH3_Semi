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
	

	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 상세 페이지</title>
</head>
<body>
	<!-- 확인용 세션 찍기 -->
	<h3>login = <%=login %></h3>
	<h3>memberId = <%=memberId %></h3>

	<h1>결제내역 상세페이지</h1>
	
<table border ="1">
	<tr>
		<th>주문번호 [결제 상태]</th>
		<td><%=payDto.getPayOrderNo() %>번 [<%=status %>]</td>
	</tr>
	<tr>
		<th>고객 아이디</th>
		<td><%=payDto.getPayMemberId() %></td>
	</tr>
	<tr>
		<th>객실타입 [객실번호]</th>
		<td><%=payDto.getPayRoomtype()%> [<%=payDto.getPayRoomNo()%>호]</td>
	</tr>
    <tr>
		<th>체크인</th>
		<td><%=payDto.getPayCheckIn()%></td>
	</tr>
	<tr>
		<th>체크아웃</th>
		<td><%=payDto.getPayCheckOut()%></td>
	</tr>
	<tr>
		<th>인원</th>
		<td><%=payDto.getPayPeople()%>명</td>
	</tr>
	<tr>
		<th>결제 금액</th>
		<td><%=payDto.getPayTotalPrice()%>원</td>
	</tr>
	<tr>
		<th>결제 일자</th>
		<td><%=payDto.getPayDate()%></td>
	</tr>
	<tr>
		<td colspan = "2">
			<%if(paymentCheck){ %>
				<a href="<%=request.getContextPath()%>/cancel.kh?payOrderNo=<%=payOrderNo%>">결제취소</a>
			<%} else if (reviewCheck) {%>
				<a href="<%=request.getContextPath()%>/review.write.jsp">리뷰작성</a>
			<%} %>
		</td>
	</tr>
</table>
</body>
</html>