<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
	String memberId = (String)session.getAttribute("login");
	boolean login = memberId != null;
	
	String payMemberId = (String)request.getSession().getAttribute("id");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료창</title>
</head>
<body>

<div>
<h3>결제가 완료되었습니다.</h3>
</div>

<div>
	<h2>감사합니다!</h2>
</div>

<div>
	<a href="<%=request.getContextPath()%>/mypage/pay/list.jsp">결제내역 목록으로 이동</a>
</div>


</body>
</html>