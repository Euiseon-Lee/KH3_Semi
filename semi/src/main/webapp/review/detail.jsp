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
	
	
	//작성자 정보 조회 코드 추후 수정 필요 => 아이디는 세션에서 가져올 것
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.selectOneId("testmanager");
	
	
	//작성자 주문 내역 조회 코드 => 객실타입 출력
	//PayDao payDao = new PayDao();
	//PayDto payDto = payDao.select???
	
	//세션이용해서 내 글인지 판단하는 코드 => 구현 예정
	
				
	//댓글 목록 조회 코드 => 구현 예정		

%>    
    
<%
	//필터 만들면 삭제할 인코딩 코드
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=utf-8");
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
				<%=memberDto.getMemberId() %>
				(<%=memberDto.getMemberGrade()%>)
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
			<td>객실타입 [payDto.getPayRoomtype()]</td>
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


				<!-- 작성자 본인 또는 관리자면 수정 및 삭제 버튼 출력되도록 수정필요 !-->
				<a href="edit.jsp?reviewNo=<%=reviewNo%>">글수정</a>
				<a href="delete.kh?reviewNo=<%=reviewNo%>">글삭제</a>
			</td>
		</tr>
		
		
		<!-- 댓글 작성 영역: 추후 작성 예정 -->
		<tr>
			<td align = "right">
			<%--if(관리자만 보이게할까? 아니면 다른사람도 보이지만 쓸수는없게할까?){ --%>
			<form action = "reply_insert.kh" method = "post">
				<input type = "hidden" name= "replyTarget" value = "<%=reviewDto.getReviewNo()%>"> 
				<textarea name = "replyContent" rows ="4" cols = "70"></textarea><br>
				<input type = "submit" value = "댓글 작성">
			</form>
			<%--}else{ --%>
				<!-- 
					<textarea rows = "4" cols = "70" disabled placeholder = "로그인 안했잖아 임마"></textarea>
					<input type = "submit" value = "댓글 작성" disabled>
 				 -->
			<%--} --%>
			</td>
		</tr>		
		
		<!-- 댓글 목록 영역: 추후 작성 예정 -->
		<tr>
			<td>댓글 목록 뿅</td>
		</tr>				
	</table>




</body>
</html>