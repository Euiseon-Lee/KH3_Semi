<%@page import="semi.beans.MemberDto"%>
<%@page import="semi.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header -->
<jsp:include page="/template/header.jsp"></jsp:include>

<%
	//에러 관련 정보 
	String error = request.getParameter("error");
	boolean case1 = error != null && error.equals("1");
	boolean case2 = error != null && error.equals("2");
%>
 
    <form action="password.kh" method="post">
        <div class="container w450 m30">
        <!-- 비밀번호 변경 문구 -->
        <div>
       <h1 class="title-text m30">비밀번호 변경</h1>
       <h4 class="middle-text-center">현재 비밀번호를 입력하신 후 비밀번호를 변경할 수 있습니다.</h4>
       <h4  class="middle-text-center" style="color: red;">비밀번호 변경 후 재 로그인이 필요합니다.</h4>
       </div>
       
       <hr class="m20"> 

       <!-- 현재 비밀번호 입력창  -->
       <div class="row m20">
           <label>현재 비밀번호</label>
           <span class="star">*</span> 
           <input type="password" name="currentPw" class="underline fill" autocomplete="off" required>
       </div>
       
       <!-- 새 비밀번호 입력창  -->
       <div class="row m20">
           <label>새 비밀번호</label>
           <span class="star">*</span> 
           <input type="password" name="changePw" class="underline fill"  placeholder="8자 이상 영문, 숫자, 특수 문자중 3가지 이상 조합" required>
       </div>
       
       <!-- 새 비밀번호 확인 입력창  -->
       <div class="row m20">
           <label>새 비밀번호 확인</label>
           <span class="star">*</span> 
           <input type="password" name="changePw" class="underline fill" required>
       </div>
       
       <!-- 비밀번호 변경 버튼  -->
       <div>
           <input type="submit" value="비밀번호 변경" class="btn fill m10">
       </div>
       </div>
       </form>

	<%if (case1) {%>
		<div class="row center">
		<h3 style="color:red;">현재와 같은 비밀번호로 변경할 수 없습니다</h3>
		</div>
	<%} %>
		
	<%if(case2){ %>
			<div class="row center">
		<h3 style="color:red;">비밀번호가 일치하지 않습니다</h3>
				</div>
	<%} %>

 <jsp:include page="/template/footer.jsp"></jsp:include>