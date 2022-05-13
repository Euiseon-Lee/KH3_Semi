<%@page import="semi.beans.MemberDto"%>
<%@page import="semi.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 메인페이지</title>
</head>
<body>
<%-- 준비 --%>
<%
	String memberId = (String)session.getAttribute("login");
%>    
    
<%-- 처리 --%>
<%
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.selectOneId(memberId);
%>

<%-- 출력 --%>
<div>
<h1>회원 정보</h1>
</div>

<table>
	<tr>
		<th>아이디</th>
		<td><%=memberDto.getMemberId()%></td>
	</tr>
	<tr>
		<th>이름(영문)</th>
		<td><%=memberDto.getMemberFname()%></td>
		<td><%=memberDto.getMemberLname()%></td>
	</tr>
		<tr>
		<th>이름(국문)</th>
		<td><%=memberDto.getMemberName()%></td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td><%=memberDto.getMemberBirth()%></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><%=memberDto.getMemberPhone()%></td>
	</tr>
    <tr>
		<th>이메일</th>
		<td><%=memberDto.getMemberEmail()%></td>
	</tr>
	<tr>
		<th>주소</th>
		<td>
			<%=memberDto.getMemberPostString()%>
			<%=memberDto.getMemberBasicAddressString()%>
			<%=memberDto.getMemberDetailAddressString()%>
		</td>
	</tr>
	<tr>
		<th>가입일</th>
		<td><%=memberDto.getMemberJoindate()%></td>
	</tr>
	<tr>
		<th>최종 접속일</th>
		<td><%=memberDto.getMemberLogindate()%></td>
	</tr>
</table>

<h2><a href="<%=request.getContextPath()%>/pay/list.jsp">결제내역 목록보기</a></h2>
<h2><a href="<%=request.getContextPath()%>/mypage/password.jsp">비밀번호 변경</a></h2>
<h2><a href="<%=request.getContextPath()%>/mypage/information.jsp">개인정보 변경</a></h2>
<h2><a href="<%=request.getContextPath()%>/mypage/exit.jsp">탈퇴하기</a></h2>
</body>
</html>