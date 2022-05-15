<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header -->
<jsp:include page="/template/header.jsp"></jsp:include>
<%
	String memberId = request.getParameter("memberId");
%>
  <form action="set_pw.kh" method="post">
        <div class="container w450 m50">
        <!-- 아이디 가져오기 -->
        <input type="hidden" name="memberId" value="<%=memberId%>">
        
        <!-- 비밀번호 재설정 문구 -->
        <div>
            <h1 class="title-text m50">비밀번호를 재설정해주세요.</h1>
        </div>
        
        <!-- 새 비밀번호 입력창 -->
        <div class="row m20">
            <label>새 비밀번호</label>
            <span class="star">*</span> 
            <input type="password" name="memberPw" class="underline fill" required placeholder="8자 이상 영문, 숫자, 특수 문자중 3가지 이상 조합">
        </div>
        
        <!-- 새 비밀번호 확인 -->
        <div class="row m20">
            <label>비밀번호 확인</label>
            <span class="star">*</span> 
            <input type="password" name="memberPw-check" class="underline fill" required>
        </div>
        
        <!-- 재설정 버튼 -->
        <div>
            <input type="submit" value="비밀번호 재설정" class="btn fill m10">
        </div>
    </div>
        </form>

 <jsp:include page="/template/footer.jsp"></jsp:include>