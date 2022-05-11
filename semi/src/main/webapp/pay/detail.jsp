<%@page import="semi.beans.PayDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.PayDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
// 결제 상세 객체 생성
	int payOrderNo = Integer.parseInt(request.getParameter("payOrderNo"));

	PayDao payDao = new PayDao();
	PayDto payDto = payDao.showDetail(payOrderNo);
	
	%>   
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 상세 페이지</title>
</head>
<body>

<table>
	<tr>
		<th>주문번호</th>
		<td><%=payDto.getPayOrderNo() %>
	</tr>
	<tr>
		<th>객실번호</th>
		<td><%=payDto.getPayRoomNo()%></td>
	</tr>
		<tr>
		<th>인원</th>
		<td><%=payDto.getPayPeopleNum()%></td>
	</tr>
	<tr>
		<th>객실타입</th>
		<td><%=payDto.getPayRoomType()%></td>
	</tr>
	<tr>
		<th>침대타입</th>
		<td><%=payDto.getPayBedType()%></td>
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
		<th>침대 추가개수</th>
		<td><%=payDto.getPayExtraBedNum()%></td>
	</tr>
	<tr>
		<th>개인풀 이용인원</th>
		<td><%=payDto.getPayPoolPeopleNum()%></td>
	</tr>
    <tr>
		<th>개인풀 이용날짜</th>
		<td><%=payDto.getPayPoolUseDate()%></td>
	</tr>
	<tr>
		<th>레스토랑 이용인원</th>
		<td><%=payDto.getPayRestPeopleNum()%></td>
	</tr>
		<tr>
		<th>레스토랑 이용날짜</th>
		<td><%=payDto.getPayRestUseDate()%></td>
	</tr>
		<tr>
		<th>레스토랑 식사유형</th>
		<td><%=payDto.getPayRestMealType()%></td>
	</tr>
	<tr>
		<td>
			<a href="<%=request.getContextPath()%>/review/write.jsp">리뷰작성</a>
			<a href="cancel.kh?payOrderNo=<%=payOrderNo%>">삭제</a>
		</td>
	</tr>
</table>
</body>
</html>