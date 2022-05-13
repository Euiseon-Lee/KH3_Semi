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
    <script type="text/javascript">
            function lengthCount(){
                //준비
                var textarea = document.querySelector("textarea[name=reviewContent]");
                var span = document.querySelector(".len");

                //처리
                var text = textarea.value;
                var count = text.length;

                while(count>1000){
                    textarea.value = textarea.value.substring(0, count-1);
                    count --;
                }
                //출력
                span.textContent = count;
              
            }
        </script>
<jsp:include page="/template/header.jsp"></jsp:include>

<form action="edit.kh" method="post">
	<input type="hidden" name="reviewNo" value="<%=reviewDto.getReviewNo() %>">
	
	<div class="container w850 m10 center">
		<div>게시글 수정</div>
		
		<div class="row">
			<label>제목</label>
			<input type="text" class="form-input fill input-round" name="reviewTitle" autocomplete="off" required value = <%=reviewDto.getReviewTitle()%>>
		</div>
				
		<div class="row">
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
		
		<div class="row">
			<label>내용</label>
			<textarea name="reviewContent" class="textarea form-input fill input-round" rows="12" autocomplete="off" required oninput="lengthCount();"><%=reviewDto.getReviewContent()%></textarea>
			<div class="row"><span class="len">0</span>/1000</div>
		</div>

		<div class="row">
			<button type="submit" class="btn btn-primary fill">수정</button>
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