<%@page import="semi.beans.QaDao"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.QaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
    %>
    
    <%
    	boolean search = type != null && keyword != null;
    	QaDao qaDao = new QaDao();
    	List<QaDto> list;
    	if(search){
    		list = qaDao.selectList(type, keyword);
    	}
    	else{
    		list = qaDao.selectList();
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>Q/A 게시판</h1>
	</div>
	
	<div>
		<a href="#">글작성</a>
	</div>
	
	<div>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th width="40%">제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<%for(QaDto qaDto : list){ %>
				<tr>
					<td><%=qaDto.getQaNo() %></td>
					<td><a href="detail.jsp?qaNo=<%=qaDto.getQaNo()%>"><%=qaDto.getQaTitle() %></a></td>
					<td><%=qaDto.getQaWriter() %></td>
					<td><%=qaDto.getQaWritedate() %></td>
					<td><%=qaDto.getQaReadcount() %></td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</body>
</html>