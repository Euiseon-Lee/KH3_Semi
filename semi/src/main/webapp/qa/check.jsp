<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h1>비밀번호를 입력해주세요</h1>
 <form action="checkpw.kh" method="post">
 <input type="password" name="memberPwCheck">
 <button type="submit">확인</button>
 </form>
 <div>
 	<a href="list.jsp">목록</a>
 </div>
</body>
</html>