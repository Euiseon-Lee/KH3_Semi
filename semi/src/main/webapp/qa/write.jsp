<%@page import="semi.beans.QaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	QaDto qaDto = new QaDto();

	String qaPublic = request.getParameter("qaPublic");

%>

<jsp:include page="/template/header.jsp"></jsp:include>

<form action="write.kh" method="post">
<%if(request.getParameter("superNo") != null){ %>   
<input type="hidden" name="superNo" value="<%=request.getParameter("superNo")%>">
<%} %>
<div class="container w850 m10 center">
	<h1>Q/A작성</h1>
<div class="row">
	<label>제목</label>
	<input type="text" name="qaTitle" class="form-input fill input-round">
</div>
<div class="row">
	<%if(qaPublic == "Y"){//비공개 게시글일 경우 답글도 비공개 %>
	<label>비공개
    <input type="checkbox" value="Y" name="qaPublic" checked>
    </label>
    <%} else{%>
    <label>비공개
    <input type="checkbox" value="Y" name="qaPublic">
    </label>
    <%} %>
</div>
<div class="row">
	<label>내용</label>
	<textarea name="qaContent" class="form-input fill input-round" rows="12"></textarea>
</div>
<div class="row">
	<button type="submit" class="btn btn-primary fill">등록</button>
</div>
<div>
	<a href="list.jsp" class="link link-btn fill center">목록</a>
</div>
</div>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>