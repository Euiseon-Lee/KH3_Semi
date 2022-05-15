<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header -->
<jsp:include page="/template/header.jsp"></jsp:include>
	
	<!-- 탈퇴 완료 문구  -->
    <div class="container w550 m50">
        <div class="row center m60">
        <h2 class="title-text m10">그동안 호텔 Azure를 이용해주셔서 감사합니다.</h2>
        <h2 class="title-text m10">더 좋은 서비스로 찾아뵙겠습니다.</h2>
        <br>
        <h1 class="cneter m10">💙</h1>
        </div>
        
        <!-- 메인 이동 링크 -->
        <div class="row center m40">
        <a href="<%=request.getContextPath()%>" class="link link-btn">메인으로 이동</a>
        </div>
    </div>
        
	

 <jsp:include page="/template/footer.jsp"></jsp:include>    