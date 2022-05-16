<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header -->
<jsp:include page="/template/header.jsp"></jsp:include>




<!-- 비밀번호 변경완료 문구-->
<div class="container w550 m50">
<div>
    <h2  class="title-text m10">비밀번호 변경이 완료되었습니다</h2>
    <h4  class="middle-text-center">변경된 비밀번호로 로그인해주세요.</h4>
    </div>
    
    <!-- 로그인 페이지 이동 -->
    <div class="row center m40">
    <a href="login.jsp" class="link link-btn">로그인 하러가기</a>
     <!-- 메인 페이지 이동 -->
    <a href="<%=request.getContextPath()%>" class="link link-btn">메인으로 이동</a>
    </div>
</div>

 <jsp:include page="/template/footer.jsp"></jsp:include>