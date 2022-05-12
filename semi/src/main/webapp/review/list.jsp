<%@page import="semi.beans.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<%
	//검색을 위한 type, keyword 설정
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	
	
	//페이징 파라미터 구현
	int p;
	try{
		p= Integer.parseInt(request.getParameter("p"));
		if(p <= 0) throw new Exception();
	}
	catch(Exception e){
		p = 1;
	}
	
	int s;
	try{
		s = Integer.parseInt(request.getParameter("s"));
		if(s <= 0) throw new Exception();
	}
	catch(Exception e){
		s = 10;
	}
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
    
    <!-- 숫자(페이지네이션) 링크 -->
    <%
    	int count;
    	if(search){//검색 결과 수 
    		count = reviewDao.countByPaging(type, keyword);
    	}
    	else{//목록 결과 수
    		count = reviewDao.countByPaging();
    	}
    	
    	//블록 크기
    	int lastPage = (count + s - 1) / s;
    	
    	//페이지 당 게시글 수
    	int blockSize = 10;
    	
    	int endBlock = (p + blockSize - 1) / blockSize * blockSize;
    	int startBlock = endBlock - (blockSize - 1);
    	
    	if(endBlock > lastPage){
    		endBlock = lastPage;
    	}
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
			<a href ="write.jsp">글 작성</a>	<!-- 추후 주문내역 상세페이지에 붙일 예정 -->
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
			<a href = "<%=request.getContextPath()%>/index.jsp" >인덱스화면으로 돌아가기</a>
		</div>	

		<div>
			<!--  페이지네이션 구현 완료 -->
			<%if(p > 1){ %> 	<!-- 첫번째 페이지가 아닌 경우 -->
				<%if(search){ %>
					<a href="list.jsp?p=1&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&laquo;</a>
				<%} else { %>
					<a href="list.jsp?p=1&s=<%=s%>">&laquo;</a>
				<%} %>
			<%} %>
			
			<%if(startBlock > 1){ %> <!-- 첫번째 블록 구간이 아닌 경우 -->
				<%if(search){ %>
					<a href="list.jsp?p=<%=startBlock-1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&lt;</a>
				<%} else { %>
					<a href="list.jsp?p=<%=startBlock-1%>&s=<%=s%>">&lt;</a>
				<%} %>
			<%} %>
			
			<!-- 숫자 링크 영역 -->
			<%for(int i=startBlock; i <= endBlock; i++){ %>
				<%if(search){ %>
					<%if(i == p){ %>
					<a class="active" href="list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>	
					<%} else { %>
					<a href="list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>
					<%} %>
				<%} else { %>
					<%if(i == p){ %>
					<a class="active" href="list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>	
					<%} else { %>
					<a href="list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
					<%} %>
				<%} %>
			<%} %>
			
			<!-- 다음 버튼 영역 -->
			<%if(endBlock < lastPage){ %>
				<%if(search){ %>
					<a href="list.jsp?p=<%=endBlock+1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&gt;</a>
				<%} else { %>
					<a href="list.jsp?p=<%=endBlock+1%>&s=<%=s%>">&gt;</a>
				<%} %>
			<%} %>
		
			<%if(p < lastPage){ %>
				<%if(search){ %>
					<a href="list.jsp?p=<%=lastPage%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&raquo;</a>
				<%} else { %>
					<a href="list.jsp?p=<%=lastPage%>&s=<%=s%>">&raquo;</a>
				<%} %>
			<%} %>
			
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