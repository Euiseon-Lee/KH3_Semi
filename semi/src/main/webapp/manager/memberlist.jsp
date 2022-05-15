<%@page import="semi.beans.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<%
	MemberDao memberDao = new MemberDao();

	List<MemberDto> list = memberDao.selectList();
%>
<div class="container center">
	<table class="table table-border center w800 m20">
		<thead>
			<tr>
				<th>회원아이디</th>
				<th>비밀번호</th>
				<th>생년월일</th>
				<th>회원이름(국문)</th>
				<th>firstName(영문)</th>
				<th>LastName(영문)</th>
				<th>연락처</th>
				<th>이메일</th>
				<th>주소</th>
				<th>가입일</th>
				<th>최종 접속일</th>
			</tr>
		</thead>
		<tbody>
			<%for(MemberDto memberDto : list){ %>
			<tr>
				<td><%=memberDto.getMemberId() %></td>
				<td><%=memberDto.getMemberPw() %></td>
				<td><%=memberDto.getMemberBirth() %></td>
				<td><%=memberDto.getMemberName() %></td>
				<td><%=memberDto.getMemberFname()%></td>
				<td><%=memberDto.getMemberLname()%></td>
				<td><%=memberDto.getMemberPhone()%></td>
				<td><%=memberDto.getMemberEmail()%></td>
				<td>
					<%=memberDto.getMemberPostString()%>
					<%=memberDto.getMemberBasicAddressString()%>
					<%=memberDto.getMemberDetailAddressString()%>
				</td>
				<td><%=memberDto.getMemberJoindate()%></td>
				<td><%=memberDto.getMemberLogindate()%></td>
			</tr>
			<%} %>
		</tbody>
	</table>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>