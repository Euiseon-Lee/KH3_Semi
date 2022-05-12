<%@page import="semi.beans.PayDto"%>
<%@page import="semi.beans.PayDao"%>
<%@page import="semi.beans.ReviewDto"%>
<%@page import="semi.beans.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
	ReviewDto reviewDto = new ReviewDto();
	
	
	//작성자 주문 내역 조회 코드 => 주문번호 및 객실타입 출력 목적
	//PayDao payDao = new PayDao();
	//PayDto payDto = payDao.showPayDetail(reviewNo);
	
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
<title>후기 게시판 글작성(디자인 전)</title>
</head>
<body>
	<form action = "write.kh" method ="post">
		<div>
		
			<div>
				<h1>후기 게시판 글작성(디자인 전)</h1>
			</div>
			
			<div>
				<div>주문번호: <%=reviewNo %></div>
				<div>객실타입:</div>
			</div>
			
			<div>
				<input type="text" name="reviewTitle" 
					placeholder="제목을 입력해주세요"
					autocomplete="off" required>	
			</div>
			
			<div>
				<label>별점</label>
					<select name = "reviewStar">
						<option value="5">5점</option>
						<option value="4">4점</option>
						<option value="3">3점</option>
						<option value="2">2점</option>
						<option value="1">1점</option>
					</select>
			</div>
			
			<div>
				<textarea name="reviewContent" rows = "15"
					placeholder="내용을 입력해주세요"
					autocomplete="off" required></textarea>
			</div>

			<div>
				<button type="submit">등록</button>
			</div>
			
			<div>
				<a href="<%=request.getContextPath()%>/review/list.jsp">목록</a>
			</div>
					
		</div>
	</form>

</body>
</html>