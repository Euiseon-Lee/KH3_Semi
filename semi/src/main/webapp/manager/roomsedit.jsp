<%@page import="semi.beans.RoomsDto"%>
<%@page import="semi.beans.RoomsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String roomType= request.getParameter("roomType");

	RoomsDao roomsDao = new RoomsDao();
	RoomsDto roomsDto = roomsDao.selectOne(roomType);
%>
<jsp:include page="/template/header.jsp"></jsp:include>

<form action="roomedit.kh" method="post">
<input type="hidden" name="roomType" value="<%=roomsDto.getRoomType() %>">
	<div class="container center w700 m20">
		<h1>룸 가격 수정 페이지</h1>
			<table class="table table-border center">
				<thead>
					<tr>
						<th>룸타입</th>
						<th>성수기 가격</th>
						<th>비성수기 가격</th>
						<th>-</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><%=roomsDto.getRoomType() %></td>
						<td><input type="number" name="peakSeason" value="<%=roomsDto.getPeakSeason() %>" min="0"></td>
						<td><input type="number" name="offSeason" value="<%=roomsDto.getOffSeason() %>"></td>
						<td><button type="submit" class="btn btn-primary">등록</button></td>
					</tr>
				</tbody>
			</table>
	</div>
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>