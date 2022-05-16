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
		<h2 class="warning m30">회원가입에 실패하셨습니다😅</h2>
	</div>
	
	<div class="row center">
		<h3 class="rejoin m30">다시 회원가입 하시겠습니까?</h3>
	</div>
	
	<div class="row center m50">
		<h3>
			<a href="<%=request.getContextPath()%>/member/join.jsp" class="link link-btn">회원가입</a>
		</h3>
	</div>
</div>


<jsp:include page="/template/footer.jsp"></jsp:include>