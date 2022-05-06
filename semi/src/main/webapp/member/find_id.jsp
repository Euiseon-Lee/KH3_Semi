<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>아이디 찾기</h1>
<form action="find_id.semi" method="post">
<table>
	<tr>
		<th>이름(영문)</th>
		<td>
			<input type="text" name="memberFname" required placeholder="First Name(이름)">
			<input type="text" name="memberLname" required placeholder="Last Name(성)">
		</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>
			<input type="email" name="memberEmail" required>
		</td>
	</tr>
	<tr>
		<td>
			<button type="submit">아이디 찾기</button>
		</td>
	</tr>
</table>
</form>
	   <!-- 에러표시 메시지 출력 -->
	    <%if(request.getParameter("error") != null){ %>
			<h3>정보가 일치하는 아이디가 존재하지 않습니다</h3>
		<%} %>
</body>
</html>