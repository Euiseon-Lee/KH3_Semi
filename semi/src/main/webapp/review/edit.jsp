<%@page import="semi.beans.ReviewDto"%>
<%@page import="semi.beans.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 준비 --%>    
<% 
	int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
	ReviewDto reviewDto = new ReviewDto();
%>

<%-- 처리 --%>
<%
	ReviewDao reviewDao = new ReviewDao();
	reviewDto = reviewDao.showDetail(reviewNo);
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
<title>후기 게시판 글수정(디자인 전)</title>
</head>
<body>

<form action="edit.kh" method="post">
	<input type="hidden" name="reviewNo" value="<%=reviewDto.getReviewNo() %>">
	
	<div>
		<div>게시글 수정</div>
		
		<div>
			<label>제목</label>
			<input type="text" name="reviewTitle" autocomplete="off" required value = "<%=reviewDto.getReviewTitle()%>">
		</div>
				
		<div>
			<label>별점</label>
			<%
			int star = reviewDto.getReviewStar();
			if(star == 5){ %>
				<select name = "reviewStar">
					<option value="5" selected>5점</option>
					<option value="4">4점</option>
					<option value="3">3점</option>
					<option value="2">2점</option>
					<option value="1">1점</option>
				</select>
			<%} else if(star == 4){ %>
				<select name = "reviewStar">
					<option value="5">5점</option>
					<option value="4" selected>4점</option>
					<option value="3">3점</option>
					<option value="2">2점</option>
					<option value="1">1점</option>
				</select>
			<%} else if(star == 3){ %>
				<select name = "reviewStar">
					<option value="5">5점</option>
					<option value="4">4점</option>
					<option value="3" selected>3점</option>
					<option value="2">2점</option>
					<option value="1">1점</option>
				</select>
			<%} else if(star == 2){ %>
				<select name = "reviewStar">
					<option value="5">5점</option>
					<option value="4">4점</option>
					<option value="3">3점</option>
					<option value="2" selected>2점</option>
					<option value="1">1점</option>
				</select>
			<%} else if(star == 1){ %>
				<select name ="reviewStar">
					<option value="5">5점</option>
					<option value="4">4점</option>
					<option value="3">3점</option>
					<option value="2">2점</option>
					<option value="1" selected>1점</option>
				</select>	
			<%} %>
		</div>
		
		<div>
			<label>내용</label>
			<textarea name="reviewContent" autocomplete="off" required><%=reviewDto.getReviewContent()%></textarea>
		</div>

		<div>
			<button type="submit">수정</button>
		</div>
		
		<div>
		</div>
		
		<div>
			<a href="list.jsp" class="link link-btn fill">글목록</a>
		</div>
		
	</div>
</form>

</body>
</html>