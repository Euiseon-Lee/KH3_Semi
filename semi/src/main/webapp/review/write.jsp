<%@page import="semi.beans.ReviewDto"%>
<%@page import="semi.beans.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
	//ReviewDto reviewDto = new ReviewDto();
	
	
	//작성자 주문 내역 조회 코드 => 주문번호 및 객실타입 출력 목적
	//PayDao payDao = new PayDao();
	//PayDto payDto = payDao.조회명(주문번호)
	
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
	<form action = "write.kh" method ="post">
		<div class="container w850 m10 center">
		
			<div>
				<h1>후기 게시판 글작성</h1>
			</div>
			
			<div>
				<div>주문번호 띄우기</div>
				<div>선택한 객실타입 띄우기 (보여주기용)</div>
			</div>
			
			<div>
				<input type="text" name="reviewTitle" 
					placeholder="제목을 입력해주세요"
					autocomplete="off" required class="form-input fill input-round">	
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
					autocomplete="off" required class="form-input fill input-round" rows="12" oninput="lengthCount();"></textarea>
					<div class="row"><span class="len">0</span>/1000</div>
			</div>

			<div>
				<button type="submit" class="btn btn-primary fill">등록</button>
			</div>
			
			<div>
				<a href="list.jsp" class="link link-btn fill center">목록</a>
			</div>
					
		</div>
	</form>
<jsp:include page="/template/footer.jsp"></jsp:include>