<%@page import="semi.beans.RoomsDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.RoomsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<%
	RoomsDao roomsDao = new RoomsDao();
	List<RoomsDto> list = roomsDao.selectList();
%>
<div class="container center">
	<table class="table table-border center w700 m20">
		<thead>
			<tr>
				<th>룸 타입</th>
				<th>성수기 가격</th>
				<th>비성수기 가격</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<%for(RoomsDto roomsDto : list){ %>
			<tr>
				<td><%=roomsDto.getRoomType() %></td>
				<td><%=roomsDto.getPeakSeason() %></td>
				<td><%=roomsDto.getOffSeason() %></td>
				<td><a class="link link-btn" href="roomsedit.jsp?roomType=<%=roomsDto.getRoomType() %>">수정</a></td>
			</tr>
			<%} %>
		</tbody>
	</table>
</div>


<jsp:include page="/template/footer.jsp"></jsp:include>