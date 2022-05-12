<%@page import="semi.beans.PayDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.PayDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
// 결제 상세 객체 생성
	int payOrderNo = Integer.parseInt(request.getParameter("payOrderNo"));

	PayDao payDao = new PayDao();
	PayDto payDto = payDao.showPayDetail(payOrderNo);
	
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
		<td><%=payDto.getPayPeople()%></td>
	</tr>
	<tr>
		<th>객실타입</th>
		<td><%=payDto.getPayRoomtype()%></td>
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
		<td>
			<a href="<%=request.getContextPath()%>/review/write.jsp">리뷰작성</a>
			<a href="cancel.kh?payOrderNo=<%=payOrderNo%>">삭제</a>
		</td>
	</tr>
</table>
</body>
</html>