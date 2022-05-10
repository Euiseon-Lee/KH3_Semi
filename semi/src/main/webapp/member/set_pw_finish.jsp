<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정 완료</title>
</head>
<body>

<!-- 비밀번호 변경완료 문구-->
<div>
<h2>비밀번호 변경이 완료되었습니다</h2>
<h5>변경된 비밀번호로 로그인해주세요.</h5>
</div>

<!-- 로그인 페이지 이동 -->
<div>
<a href="login.jsp">로그인 하러가기</a>
</div>

<!-- 메인 페이지 이동 -->
<div>
<a href="<%=request.getContextPath()%>">메인으로 이동</a>
</div>

</body>
</html>