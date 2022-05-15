<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container w850 m10 center">
	<div class="row center">
		<h3>결제취소가 완료되었습니다.</h3>
	</div>
	
	<div class="row center">
		<h2>이용해주셔서 감사합니다!</h2>
	</div>
	
	<div class="row center">
		<a href="<%=request.getContextPath()%>/mypage/pay/list.jsp">결제내역 목록으로 이동</a>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>