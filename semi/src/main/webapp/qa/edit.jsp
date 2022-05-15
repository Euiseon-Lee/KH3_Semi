<%@page import="semi.beans.QaDto"%>
<%@page import="semi.beans.QaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

	<%
		int qaNo = Integer.parseInt(request.getParameter("qaNo"));
		int groupNo = Integer.parseInt(request.getParameter("groupNo"));
	
		QaDao qaDao = new QaDao();
		QaDto qaDto = qaDao.selectOne(qaNo);
	%>
	<form action="edit.kh" method="post">
		<input type="hidden" name="qaNo" value="<%= qaDto.getQaNo() %>">
		<input type="hidden" name="groupNo" value="<%=qaDto.getGroupNo() %>">
			<div class="container w850 m10 center">
				<h1>게시글 수정</h1>
					<div class="row">
						<label>제목</label>
						<input type="text" name="qaTitle" class="form-input fill input-round" value="<%=qaDto.getQaTitle() %>">
					</div>
					<div class="row">
						<%if(qaDto.getQaPublic() != null){ %>
  	  					<input type="checkbox"  name="qaPublic" checked>
  	  					<label>비공개</label>
  	  					<%} else{%>
  	  					<input type="checkbox" value="Y" name="qaPublic">
  	  					<label>비공개</label>
  	  					<%} %>
  	  					
					</div>
					<div class="row"> 
						<label>내용</label>
						<textarea class="textarea form-input fill input-round"name="qaContent" rows="12"><%=qaDto.getQaContent() %></textarea>
					</div>
					<div class="row">
						<button type="submit" class="btn btn-primary fill">등록</button>
					</div>
					<div>
						<a href="list.jsp" class="link link-btn center fill">목록</a>
					</div> 
			</div>
	</form>
