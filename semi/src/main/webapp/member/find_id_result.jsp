<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기 완료</title>
</head>
<%
	String memberId = request.getParameter("memberId");
	String memberFname = request.getParameter("memberFname");
	String memberLname = request.getParameter("memberLname");
%>
<body>

<!-- 아이디 확인문구 -->
<div>
	<h2> 아이디를 확인해주세요</h2>
	<h5> <%=memberFname%><%=memberLname%>고객님의 아이디는 <%=memberId%> 입니다</h5>
</div>

<!-- 로그인페이지 이동 -->
<div>
	<a href="login.jsp">로그인 하러가기</a>
</div>

<!-- 메인페이지 이동 -->
<div>
	<a href="<%=request.getContextPath()%>">메인 페이지로 이동</a>
</div>

</body>
</html>