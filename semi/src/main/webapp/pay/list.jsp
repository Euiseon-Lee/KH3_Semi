<%@page import="semi.beans.PayDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.PayDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
   <%
// 결제내역 목록 가져오기
	PayDao payDao = new PayDao();
	List<PayDto> list = payDao.selectList();
	%>
	 	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제내역 목록 페이지</title>
</head>
<body>
<h1>결제 내역</h1>
	<table>
		<thead>
			<tr>
				<th>객실번호</th>
				<th>객실타입</th>
				<th>침대타입</th>
				<th>체크인</th>
				<th>체크아웃</th>
			</tr>
		</thead>
		<tbody>
			<%for(PayDto payDto: list){ %>
				<td><%=payDto.getPayOrderNo() %></td>
			<%} %>
		</tbody>
	</table>
</body>
</html>
