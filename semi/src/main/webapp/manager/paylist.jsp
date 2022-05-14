<%@page import="semi.beans.PayDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.PayDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PayDao payDao = new PayDao();
	List<PayDto> list = payDao.totalPayList();
%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container center">
	<table class="table table-border center w800 m20">
		<thead>
			<tr>
				<th>결제번호</th>
				<th>아이디</th>
				<th>인원 수</th>
				<th>룸 타입</th>
				<th>체크인</th>
				<th>체크아웃</th>
				<th>결제일</th>
				<th>금액</th>
			</tr>
		</thead>
		<tbody>
			<%for(PayDto payDto : list){ %>
			<tr>
				<td><%=payDto.getPayOrderNo() %></td>
				<td><%=payDto.getPayMemberId() %></td>
				<td><%=payDto.getPayPeople() %></td>
				<td><%=payDto.getPayRoomtype() %></td>
				<td><%=payDto.getPayCheckIn() %></td>
				<td><%=payDto.getPayCheckOut() %></td>
				<td><%=payDto.getPayDate() %></td>
				<td><%=payDto.getPayTotalPrice() %></td>
			</tr>
			<%} %>
		</tbody>
	</table>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>