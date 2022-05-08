<%@page import="semi.beans.MemberDto"%>
<%@page import="semi.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 변경 페이지</title>
</head>
<body>
	<%--session에서 로그인 정보 불러오기 --%>
	<%
	String memberId = (String)session.getAttribute("login");
	%>

	<%
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.selectOneId(memberId);
	%>

<form action="information.kh" method="post">
<div>
	<h1>회원 정보변경</h1>
</div>

<div>
	<label>생년월일</label>
	<span>*</span> 
	<input type="date" name="memberBirth" required value="<%=memberDto.getMemberBirth()%>">
</div>

<div>
	<label>전화번호</label>
	<span>*</span> 
	<input type="tel" name="memberPhone" required value="<%=memberDto.getMemberPhone()%>">
</div>

<div>
	<label>이메일</label>
	<span>*</span> 
	<input type="email" name="memberEmail" value="<%=memberDto.getMemberEmail()%>">	
</div>

<div>
	<label>주소</label>
	<input type="text" name="memberPost" placeholder="우편번호" value="<%=memberDto.getMemberPostString()%>">
	<button>검색</button>
</div>
 <div>
     <input type="text" name="memberBasicAddress" placeholder="기본주소" value="<%=memberDto.getMemberBasicAddressString()%>">
</div>
<div>
     <input type="text" name="memberDetailAddress" placeholder="상세주소" value="<%=memberDto.getMemberDetailAddressString()%>">
</div>

<div>
	<label>주소</label>
	<input type="text" name="memberPost" placeholder="우편번호" value="<%=memberDto.getMemberPostString()%>">
	<button>검색</button>
</div>
 
 <div>
 	<label>비밀번호 확인</label>
 	<span>*</span> 
 	<input type="password" name="memberPw" required>
 </div>
 
 <div>
 	<input type="submit" value="정보 수정">
 </div>
 
</form>


	<% if(request.getParameter("error") != null){ %>
		<h3>비밀번호가 일치하지 않습니다</h3>
	<%} %>



</body>
</html>