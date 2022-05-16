<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header -->
<jsp:include page="/template/header.jsp"></jsp:include>


<%
	String memberId = request.getParameter("memberId");
	String memberFname = request.getParameter("memberFname");
	String memberLname = request.getParameter("memberLname");
%>


    <div class="container w350">
<!-- 아이디 확인문구 -->
<div>
    <div class="row center m60">
	<h2 class="title-text m40"> 아이디를 확인해주세요</h2>

	 <h3 class="middle-text-left"> <%=memberFname%><%=memberLname%>고객님의 아이디는 <%=memberId%>입니다.
    </div>
</div>

<!-- 로그인페이지 이동 -->
<div class="row center m40">
	<a href="login.jsp" class="link link-btn">로그인 하러가기</a>
    <!-- 메인페이지 이동 -->
    <a href="<%=request.getContextPath()%>" class="link link-btn">메인 페이지로 이동</a>
</div>

</div>

<jsp:include page="/template/footer.jsp"></jsp:include>