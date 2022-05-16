<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header -->
<jsp:include page="/template/header.jsp"></jsp:include>
<%
	String memberId = request.getParameter("memberId");
%>
	<form action="exit.kh" method="post">
	
        <!-- 회원 탈퇴 문구 -->
        <div class="container w600 m50">
        <div class="row center m20">
        <h2 class="title-text">정말 회원을 탈퇴하시겠습니까?</h2>
        <h4 class="middle-text-center">탈퇴를 진행하시기 전에 아래 유의사항을 읽어주세요.</h4>
        </div>
        
        <!-- 탈퇴 유의사항 문구 -->
        <div class="row center m50">
        <h3 class="middle-text-center">유의사항</h3>
        <hr>
        <h4 class="middle-text-left m10" style="color: red;">개인정보보호법에 따라 고객님의 호텔 이용기록, 개인정보 기록이 모두 삭제됩니다.</h4>
        <h4 class="middle-text-left" style="color: red;">탈퇴 신청이 완료되면 즉시 홈페이지 로그인이 제한됩니다.</h4>
        </div>
        
        <hr class="m50">
        
        <!-- 탈퇴를 위한 비밀번호 입력창 -->
        <div class="row  center m10">
            <label style="color:gray">비밀번호 입력</label>
            <span class="star">*</span>
        <input type="password" name="memberPw" class="underline fill" required >
        </div>
         
         <!-- 비밀번호 틀릴 경우 출력할 메세지 -->
         <% if(request.getParameter("error") != null) { %>
		<div class="row center m20">
			<h4 style="color:red;">비밀번호가 일치하지 않습니다</h4>	
		</div>
		<% } %>  		
         	
        <!-- 탈퇴하기 버튼 -->
        <div class="row  center m20">
        <button type="submit" class="btn fill">탈퇴하기</button>
        </div>
        </div>
        
        
        	
    </form>
 <jsp:include page="/template/footer.jsp"></jsp:include>