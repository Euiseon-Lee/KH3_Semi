<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container w850 m10 center">
	<div class="row center">
		<h2 class="title-text m50">결제취소가 완료되었습니다.</h2>
	</div>
	
	<div class="row center">
		<h3 class="title-text m30">이용해주셔서 감사합니다!</h3>
	</div>
	
	<div class="row center m50">
		<h1>
			<a href="<%=request.getContextPath()%>/bookings/add.jsp" class="link link-btn">새로운 예약하러 가기</a>
		</h1>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>