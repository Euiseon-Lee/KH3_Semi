<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header -->
<jsp:include page="/template/header.jsp"></jsp:include>


<sesion>
<form action="login.kh" method="post">

<!-- 아이디 저장기능 구현 예정 (idSave) -->
<div class="container w300 m50">
<div class="row center m40">
	<h1 class="title-text">로그인</h1>
</div>
 

<!-- 아이디 입력 -->
<div class="row center m20">  
<div>
	<input type="text" name="memberId" required placeholder="아이디" class="underline fill" autocomplete="off">
</div>
</div>

<!-- 비밀번호 입력 -->
<div class="row center m20">  
	<input type="password" name="memberPw" required  class="underline fill" placeholder="비밀번호">
</div>

<!-- 아이디 기억하기 체크박스 -->
<div class="row left m20">  
	<input type="checkbox" name="idSave" class="input">
	<span>아이디 저장</span>
</div>

<!-- 로그인 버튼 -->
 <div class="row center m20">
     <input type="submit" value="로그인" class="btn fill">
 </div>
 
 <!-- 아이디/비밀번호 찾기 링크 -->
 <div class="row center m10">
 <div class="flex-container">
 <div class="display-right">
     <a href="find_id.jsp" class="link " >아이디 찾기</a>
</div>
&nbsp;&nbsp;&nbsp;&nbsp;
 <div class="display-right">
     <a href="find_pw.jsp" class="link " >비밀번호 찾기</a>
 </div>
</div>
</div>
 	<%-- 에러 표시가 있는 경우 메세지를 출력 --%>
 	<%--alter로 변경예정 --%>
		<% if(request.getParameter("error") != null) { %>
		<div class="row center m20">
			<h4 style="color:red;">로그인 정보가 일치하지 않습니다</h4>	
		</div>
		<% } %>        
    </div>
 </form>
 </sesion>
    
	
 <jsp:include page="/template/footer.jsp"></jsp:include>