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
	<div>
		<h1>결제를 취소하시겠습니까?</h1>
	</div>
	
	<div>
		<h2><a href="<%=request.getContextPath()%>/pay/cancel.kh?payOrderNo=<%=payOrderNo%>">예 (결제취소)</a></h2>
		<h2><a href="<%=request.getContextPath()%>/mypage/pay/detail.jsp?payOrderNo=<%=payOrderNo %>">아니오</a></h2>
	</div>
	
	<div>
		<a href="<%=request.getContextPath()%>/mypage/pay/list.jsp">결제 내역 페이지 이동</a>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>