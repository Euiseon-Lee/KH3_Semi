<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>

<body>
<form action="login.semi" method="post">
	<h1>로그인</h1>
	<table>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="memberId" required>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="memberPw" required>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<input type="submit" value="로그인">
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<a href="find_id.jsp">아이디/비밀번호 찾기</a>
			</td>
		</tr>
	</table>
 </form>
    
    <%--에러표시가 있는 경우 메시지 출력 --%>
	<% if (request.getParameter("error") != null) {%>
		<h3>로그인 정보가 일치하지않습니다</h3>
	<%}%>
	
</body>
</html>