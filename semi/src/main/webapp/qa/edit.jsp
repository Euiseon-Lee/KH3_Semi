<%@page import="semi.beans.QaDto"%>
<%@page import="semi.beans.QaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int qaNo = Integer.parseInt(request.getParameter("qaNo"));
	
		QaDao qaDao = new QaDao();
		QaDto qaDto = qaDao.selectOne(qaNo);
	%>
	<form action="edit.kh" method="post">
		<input type="hidden" name="qaNo" value="<%= qaDto.getQaNo() %>">
		
			<div>
				<h1>게시글 수정</h1>
					<div>
						<label>제목</label>
						<input type="text" name="qaTitle" value="<%=qaDto.getQaTitle() %>">
					</div>
					<div>
						<label>비공개
						<%if(qaDto.getQaPublic() != null){ %>
  	  					<input type="checkbox"  name="qaPublic" checked>
  	  					<%} else{%>
  	  					<input type="checkbox" value="Y" name="qaPublic">
  	  					<%} %>
  	  					</label>
					</div>
					<div> 
						<label>내용</label>
						<textarea name="qaContent"><%=qaDto.getQaContent() %></textarea>
					</div>
					<div>
						<button type="submit">등록</button>
					</div>
					<div>
						<a href="list.jsp">목록</a>
					</div> 
			</div>
	</form>
</body>
</html>