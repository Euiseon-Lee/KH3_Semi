<%@page import="semi.beans.QaDao"%>
<%@page import="semi.beans.QaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int qaNo = Integer.parseInt(request.getParameter("qaNo"));
    int groupNo= Integer.parseInt(request.getParameter("groupNo"));
    QaDao qaDao = new QaDao();
	QaDto qaDto = qaDao.selectOne(qaNo);
    %>
<jsp:include page="/template/header.jsp"></jsp:include>

 <div class="container w500 m50 center">
 <h1>비밀번호를 입력해주세요</h1>
 <form action="checkpw.kh?qaNo=<%=qaNo %>&groupNo=<%=groupNo %>" method="post">
 <input type="password" name="memberPwCheck" class="form-input input-round">
 <button type="submit" class="btn btn-primary">확인</button>
 </form>
 </div>
 <div class="container w500 m50 center">
 	<a href="list.jsp" class="link link-btn center">목록으로</a>
 </div>
<jsp:include page="/template/footer.jsp"></jsp:include>