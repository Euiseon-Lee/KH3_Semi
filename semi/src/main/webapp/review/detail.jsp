<%@page import="semi.beans.MemberDto"%>
<%@page import="semi.beans.MemberDao"%>
<%@page import="semi.beans.ReviewDto"%>
<%@page import="semi.beans.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));

	//조회수 증가 코드
	ReviewDao reviewDao = new ReviewDao();
	reviewDao.plusReadcount(reviewNo);
	ReviewDto reviewDto = reviewDao.showDetail(reviewNo);
	
	
	//작성자 정보 조회 코드
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.selectOneId(reviewDto.getReviewMemberId());
	
	
	//작성자 주문 내역 조회 코드 => 객실타입 출력

	
	//세션이용해서 내 글인지 판단하는 코드 => 구현 예정
			
			
	//댓글 목록 조회 코드 => 구현 예정		

%>    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기게시판 상세페이지 (디자인 전)</title>
</head>
<body>

	<h1><%=reviewDto.getReviewNo()%>번 게시글</h1>
	
	<table border = "1">	<!-- 추후 디자인에서 제거할것 -->
	
		<!-- 글제목, 작성자, 작성일시 및 조회수 출력 -->
		<tr>
			<td>
				<h1><%=reviewDto.getReviewTitle() %></h1>
			</td>
		</tr>
	
		<tr>
			<td>
				<%=reviewDto.getReviewMemberId() %>
				<%-- (<%=memberDto.getMemberGrade()%>) memberDto 갱신 필요--%>
			</td>
		</tr>

		<tr>
			<td>
				<%=reviewDto.getReviewWritedate() %>
				조회수 <%=reviewDto.getReviewReadcount() %>
			</td>
		</tr>
		
		
		<!-- 여기부터는 방 타입, 별점 및 글내용 출력 -->
		<tr>
			<td>객실타입 [<%= %>]</td>
		</tr>
		
		<tr>
			<td>별점 <%=reviewDto.getReviewStar() %>점</td>
		</tr>
		
		
		<tr>
			<td>
				<pre><%=reviewDto.getReviewContent() %></pre>
			</td>
		</tr>						


		<!-- 기능 버튼 출력 -->
		<tr>
			<td>
				<a href="list.jsp">글목록</a>
				<a href="write.jsp">글작성</a>


				<!-- 작성자 본인 또는 관리자면 수정 및 삭제 버튼 출력되도록 수정필요 !-->
				<a href="edit.jsp?reviewNo=<%=reviewNo%>">글수정</a>
				<a href="delete.kh?reviewNo=<%=reviewNo%>">글삭제</a>
			</td>
		</tr>
		
		
		<!-- 댓글 작성 영역: 추후 작성 예정 -->
		<tr>
			<td>댓글 작성창 뿅</td>
		</tr>		
		
		<!-- 댓글 목록 영역: 추후 작성 예정 -->
		<tr>
			<td>댓글 목록 뿅</td>
		</tr>				
	</table>




</body>
</html>