<%@page import="semi.beans.MemberDto"%>
<%@page import="semi.beans.MemberDao"%>
<%@page import="semi.beans.QaDto"%>
<%@page import="semi.beans.QaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int qaNo = Integer.parseInt(request.getParameter("qaNo"));
	int groupNo = Integer.parseInt(request.getParameter("groupNo"));
	QaDao qaDao = new QaDao();
	

	qaDao.plusReadcount(qaNo);//조회수 증가
	QaDto qaDto = qaDao.selectOne(qaNo);
	
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.selectOneId(qaDto.getQaWriter());
%>

<%
	//관리자인지
	String memberGrade = (String)session.getAttribute("auth");
	boolean isAdmin = memberGrade != null && memberGrade.equals("관리자");
	
	String memberId = (String)session.getAttribute("login");
	boolean isLogin = memberId != null;
	
	
	//세션이용해서 내 글인지 판단하는 코드 => 구현 완료
	boolean isOwner = memberId != null && memberId.equals(qaDto.getQaWriter());
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<div class="container w850 m10 center">
		<table class="table table-underline">
			<tr>
				<td>
			<div align="left">
					<h2>제목 : <%=qaDto.getQaTitle() %></h2>
			</div>
				</td>
			</tr>
			<tr>
				<td>
			<div align="right">
			<%if(qaDto.getQaWriter() == null){ %>
				탈퇴한 회원
			<%} else{%>
					작성자 <%=qaDto.getQaWriter() %>
					(<%=memberDto.getMemberGrade() %>)
					<%} %>
			</div>
				</td>
			</tr>
			<tr>
				<td>
				<div align="right">
					작성일 <%=qaDto.getQaWritedate() %>
				</div>
				</td>
			</tr>
			<tr>
				<td>
				<div align="right">
					조회수 <%=qaDto.getQaReadcount() %>
				</div>
				</td>
			</tr>
		</table>
		<table class="table">
			<tr height="250">
				<td>
				<div align="left">
					<%=qaDto.getQaContent() %>
				</div>
				<td>
			</tr>
		</table>

			
			<div class="right">
			<a  class="link link-btn" href="<%=request.getContextPath()%>/qa/write.jsp">글쓰기</a>
			<%if(isAdmin){ %>
				<a class="link link-btn" href="<%=request.getContextPath()%>/qa/write.jsp?superNo=<%=qaNo%>">답글</a>
			<%} %>
			<%if(isOwner){ %>
				<a class="link link-btn" href="<%=request.getContextPath()%>/qa/edit.jsp?qaNo=<%=qaNo%>&groupNo=<%=groupNo%>">수정</a>
				<a class="link link-btn" href="<%=request.getContextPath()%>/qa/delete.kh?qaNo=<%=qaNo%>">삭제</a>
			<%} %>
			<a class="link link-btn" href="<%=request.getContextPath()%>/qa/list.jsp">목록</a>
			</div>
	

	</div>
<jsp:include page="/template/footer.jsp"></jsp:include>