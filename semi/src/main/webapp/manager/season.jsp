<%@page import="java.util.List"%>
<%@page import="semi.beans.SeasonDto"%>
<%@page import="semi.beans.SeasonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<%
	SeasonDao seasonDao = new SeasonDao();
	List<SeasonDto> list = seasonDao.selectList();
%>
<div class="container center">
	<table class="table table-border center w700 m20 table-hover">
		<thead>
			<tr>
				<th>시즌명</th>
				<th>시즌 시작일</th>
				<th>시즌 마감일</th>
				<th>-<th>
			</tr>
		</thead>
		<tbody>
		<%for(SeasonDto seasonDto : list){ %>
			<tr>
				<td><%=seasonDto.getSeasonType() %></td> 
				<td><%=seasonDto.getSeasonStartString() %></td> 
				<td><%=seasonDto.getSeasonEndString() %></td>
				<td><a class="link link-btn" href="seasonedit.jsp?seasonNo=<%=seasonDto.getSeasonNo() %>">수정</a>
			</tr>
			<%} %>
		</tbody>
	</table>
	</div>
	
<jsp:include page="/template/footer.jsp"></jsp:include>