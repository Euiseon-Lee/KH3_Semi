<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
	String memberId = (String)session.getAttribute("login");
	boolean login = memberId != null;
	
	String payMemberId = (String)request.getSession().getAttribute("id");
%>    


<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container w850 m10 center">
	<div class="row center m50">
		<h2 class="title-text m30">결제가 완료되었습니다.</h2>
	</div>
	
	<div class="row center">
		<h3 class="title-text m30">이용해주셔서 감사합니다!</h3>
	</div>
	
	<div class="row center m50">
		<h3>
			<a href="<%=request.getContextPath()%>/mypage/pay/list.jsp" class="link link-btn">결제내역 목록으로 이동</a>
		</h3>
	</div>
</div>


<jsp:include page="/template/footer.jsp"></jsp:include>