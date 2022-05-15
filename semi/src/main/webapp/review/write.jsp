<%@page import="semi.beans.PayDto"%>
<%@page import="semi.beans.PayDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int payOrderNo = Integer.parseInt(request.getParameter("payOrderNo"));
	PayDto payDto = new PayDto();
	PayDao payDao = new PayDao();
	
	//작성자 주문 내역 조회 코드 => 주문번호 및 객실타입 출력 목적
	payDto = payDao.showPayDetail(payOrderNo);
	
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

<div>
	<form action = "write.kh" method ="post">
		<input type ="hidden" name="payOrderNo" value="<%=payOrderNo %>">

		<div class="container w850 m40 center">
		
			<div class="row center m30">
				<h1>후기 게시판 글작성</h1>
			</div>
			
			<div class="row center m20">
				<div>주문번호: <%=payOrderNo %>번	/	객실타입: <%=payDto.getPayRoomtype()%></div>
			</div>
			
			<div class="row center">
				<label>별점</label>
					<select name = "reviewStar">
						<option value="5">5점</option>
						<option value="4">4점</option>
						<option value="3">3점</option>
						<option value="2">2점</option>
						<option value="1">1점</option>
					</select>
			</div>
			
			<div class="row center">
				<input type="text" name="reviewTitle" 
					placeholder="제목을 입력해주세요"
					autocomplete="off" required class="form-input fill input-round">	
			</div>
			
			<div class="row center">
				<textarea name="reviewContent" rows = "15"
					placeholder="내용을 입력해주세요"
					autocomplete="off" required class="form-input fill input-round" rows="12" oninput="lengthCount();"></textarea>
					<div class="row"><span class="len">0</span>/1000</div>
			</div>

			<div class="row center">
				<button type="submit" class="btn btn-primary fill">등록</button>
			</div>
			
			<div class="row center">
				<a href="<%=request.getContextPath()%>/review/list.jsp" class="link link-btn fill center">목록</a>
			</div>			
		</div>
	</form>
</div>	
<jsp:include page="/template/footer.jsp"></jsp:include>