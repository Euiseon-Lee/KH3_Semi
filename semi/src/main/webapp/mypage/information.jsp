<%@page import="semi.beans.MemberDto"%>
<%@page import="semi.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 변경 페이지</title>
</head>
<body>
	<%--session에서 로그인 정보 불러오기 --%>
	<%
	String memberId = (String) session.getAttribute("login");
	%>

	<%
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.selectOneId(memberId);
	%>

<form action="information.kh" method="post">
<table>
	<tr>
		<th>생년월일</th>
		<td>
			<input type="date" name="memberBirth" required value="<%=memberDto.getMemberBirth()%>">
		</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>
			<input type="tel" name="memberPhone" required value="<%=memberDto.getMemberPhone()%>">
		</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>
			<input type="email" name="memberEmail" value="<%=memberDto.getMemberEmail()%>">
		</td>	
	</tr>
	<tr>
		<th>주소</th>
		<td>
			<input type="text" name="memberPost" placeholder="우편번호" value="<%=memberDto.getMemberPostString()%>">
			<button>검색</button>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="memberBasicAddress" placeholder="기본주소" value="<%=memberDto.getMemberBasicAddressString()%>">
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="memberDetailAddress" placeholder="상세주소" value="<%=memberDto.getMemberDetailAddressString()%>">
		</td>
	</tr>
	<tr>
		<th>비밀번호 확인</th>
		<td>
			<input type="password" name="memberPw" required>
		</td>
	</tr>
	<tr>
		<td>
			<input type="submit" value="정보 변경하기">
		</td>
	</tr>
</table>
</form>

	<% if(request.getParameter("error") != null){ %>
		<h3>비밀번호가 일치하지 않습니다</h3>
	<%} %>
</body>
</html>