<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String memberId = request.getParameter("memberId");
	String memberName = request.getParameter("memberName");
%>
<body>
<h2> 아이디를 확인해주세요</h2>
<h3> <%=memberName%>고객님의 아이디는 <%=memberId%> 입니다</h3>

<h2><a href="login.jsp">로그인 하러가기</a></h2>

<!-- context 메인페이지 이동 필요 -->
<h2><a href="<%=request.getContextPath()%>">메인 페이지로 이동</a></h2>

</body>
</html>