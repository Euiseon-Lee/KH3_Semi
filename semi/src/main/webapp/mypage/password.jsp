<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 창</title>
</head>
<body>

<%
	//에러 관련 정보 
	String error = request.getParameter("error");
	boolean case1 = error != null && error.equals("1");
	boolean case2 = error != null && error.equals("2");
%>
 
<h1>비밀번호 변경</h1>

		<form action="password.kh" method="post">
		<table>
			<tr>
				<th>현재 비밀번호</th>
				<td>
					<input type="password" name="currentPw" required>
				</td>
			</tr>
			<tr>
				<th>바꿀 비밀번호</th>
				<td>
					<input type="password" name="changePw" required>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="submit" value="비밀번호 변경하기">
				</td>
			</tr>
		</table>
		</form>
		
		<%if(case1){ %>
		<h3>현재와 같은 비밀번호로 변경할 수 없습니다</h3>
		<%} %>
		
		<%if(case2){ %>
		<h3>비밀번호가 일치하지 않습니다</h3>
		<%} %>

</body>
</html>