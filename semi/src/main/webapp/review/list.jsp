<%@page import="semi.beans.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//검색을 위한 type, keyword 설정
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	
	
	//페이징 파라미터 구현 예정
%>


<%
	//검색용 설정
	boolean search = type != null && keyword != null;
	ReviewDao reviewDao = new ReviewDao();
	List<ReviewDto> list;
	if(search){
 		list = reviewDao.showList(type, keyword);	//페이징 이후 수정 필요
	}
	else {
 		list = reviewDao.showList();	//페이징 이후 수정 필요

	}
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
<title>후기게시판 글목록 및 검색 (디자인 전)</title>
</head>
<body>
	<div>
		<div>
			<h1>후기게시판 글목록</h1>
		</div>
		
		<div>
			<a href ="write.jsp">글 작성</a>
		</div>
		
		<div>
			<table border="1">		<!-- 디자인 파트에서 수정 필요 -->
				<thead>
					<tr>
						<th>글 번호</th>
						<th>글 제목</th>
						<th>별점</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				
				<tbody>
					<%for(ReviewDto reviewDto : list){ %>
					<tr>
						<td><%=reviewDto.getReviewNo() %></td>	<!-- 글번호 출력 칸 -->
						
						<td>	<!-- 글제목 링크 및 제목 출력 칸 -->
							<a href="detail.jsp?reviewNo=<%=reviewDto.getReviewNo()%>">
								<%=reviewDto.getReviewTitle() %>
							</a>
								<!-- 댓글 수 출력 -->
							<%if(reviewDto.getReviewReplycount() > 0){ %>
							[<%=reviewDto.getReviewReplycount()%>]
							<%} %>
						</td>
						
						
						<td><%=reviewDto.getReviewStar() %></td>
						<td><%=reviewDto.getReviewMemberId() %></td>
						<td><%=reviewDto.getReviewWritedate() %></td>
						<td><%=reviewDto.getReviewReadcount() %></td>
					</tr>
					<%} %>	
				</tbody>
			</table>
		</div>	

		<div>
			<!--  페이지네이션 구현 예정 -->
		</div>
		
		<div>	<!-- 검색창 구현 -->
			<form action="showList.jsp" method="get">
				<select name="type">
					<option value="review_title">제목</option>
					<option value="review_content">내용</option>
					<option value="review_member_id">작성자</option>
				</select>
				
				<input type="search" name="keyword" placeholder="검색어를 입력해주세요" required>
				<button type="submit">검색</button>
			</form>
		</div>
	
	</div>

</body>
</html>