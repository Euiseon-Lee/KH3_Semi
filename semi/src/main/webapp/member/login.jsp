<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>

<body>
<form action="login.kh" method="post">

<!-- 아이디 저장기능 구현 예정 (idSave) -->


<div>
	<h1>로그인하기</h1>
</div>

<hr>

<!-- 아이디 입력 -->
<div>
	<input type="text" name="memberId" required placeholder="아이디" autocomplete="off">
</div>

<!-- 비밀번호 입력 -->
<div>
	<input type="password" name="memberPw" required placeholder="비밀번호">
</div>

<!-- 아이디 기억하기 체크박스 -->
<div>
	<input type="checkbox" name="idSave">
	<span>아이디 저장</span>
</div>

<!-- 로그인 버튼 -->
 <div>
     <input type="submit" value="로그인" >
 </div>
 
 <!-- 아이디/비밀번호 찾기 링크 -->
 <div>
     <a href="find_id.jsp">아이디 찾기</a>
     <a href="find_pw.jsp">비밀번호 찾기</a>
 </div>
 
 </form>
    
    <%--에러표시가 있는 경우 메시지 출력 --%>
	<% if (request.getParameter("error") != null) {%>
		<h3>로그인 정보가 일치하지않습니다</h3>
	<%}%>
	
</body>
</html>