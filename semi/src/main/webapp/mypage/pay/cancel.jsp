<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	String memberId = (String)session.getAttribute("login");
	boolean login = memberId != null;
	
	String payMemberId = (String)request.getSession().getAttribute("id");
	
	int payOrderNo = Integer.parseInt(request.getParameter("payOrderNo"));
%>

    
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container w850 m10 center">
	<div class="title-text m40">
		<h1>결제를 취소하시겠습니까?</h1>
	</div>
	
	<div class="row center">
		<h2 class="m40"><a href="<%=request.getContextPath()%>/pay/cancel.kh?payOrderNo=<%=payOrderNo%>" class="link link:hover">예 (결제취소)</a></h2>
		<h2 class="m40"><a href="<%=request.getContextPath()%>/mypage/pay/detail.jsp?payOrderNo=<%=payOrderNo %>" class="link link-btn">아니오 (상세페이지로 이동)</a></h2>
	</div>
	
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>