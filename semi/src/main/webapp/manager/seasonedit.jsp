<%@page import="semi.beans.SeasonDto"%>
<%@page import="semi.beans.SeasonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<%
	int seasonNo = Integer.parseInt(request.getParameter("seasonNo"));
	
	SeasonDao seasonDao = new SeasonDao();
	SeasonDto seasonDto = seasonDao.selectOne(seasonNo);
%>

<form action="edit.kh" method="post">
	<input type="hidden" name="seasonNo" value="<%=seasonDto.getSeasonNo() %>">
	<div class="container center w700 m20">
	<h1>시즌 기간 수정 페이지</h1>
		<table class="table table-border center">
			<thead>
				<tr>
					<th>시즌명</th>
					<th>시즌 시작일</th>
					<th>시즌 마감일</th>
					<th>-</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=seasonDto.getSeasonType() %></td>
					<td><input type="date" name="seasonStart" value="<%=seasonDto.getSeasonStart() %>"></td>
					<td><input type="date" name="seasonEnd" value="<%=seasonDto.getSeasonEnd() %>"></td>
					<td><button type="submit" class="btn btn-primary">등록</button></td>
				</tr>
			</tbody>
		</table>
		</div>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>