<%@page import="semi.beans.MemberDto"%>
<%@page import="semi.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header -->
<jsp:include page="/template/header.jsp"></jsp:include>
	<%--session에서 로그인 정보 불러오기 --%>
	<%
	String memberId = (String)session.getAttribute("login");
	%>

	<%
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.selectOneId(memberId);    
	%>

      <form action="information.kh" method="post">
        <div class="container w800 m40 ">  
            <div class="row center m30">
            <h1 class="title-text">회원 정보변경</h1>
        </div>
        
        <hr>

        <div class="row m20">
            <div class="row">
            <label class="middle-text-center">생년월일</label>
            </div>
            <input type="text" name="memberBirth" placeholder="YYYY-MM-DD" autocomplete="off" class="underline fill" value="<%=memberDto.getMemberBirth()%>">
        </div>
        
        <div class="row m20">
            <div class="row">
            <label class="middle-text-center" >연락처</label>
            </div>
            <input type="tel" name="memberPhone" class="underline fill" autocomplete="off" value="<%=memberDto.getMemberPhone()%>">
        </div>
        
        <div class="row m20">
            <div class="row">
            <label class="middle-text-center" >이메일</label>
            </div>
            <input type="email" name="memberEmail" class="underline fill" autocomplete="off" value="<%=memberDto.getMemberEmail()%>">	
        </div>
        
        <div class="row m20">
            <div class="row">
            <label class="middle-text-center">주소</label>
            <input type="button" value="주소 찾기">
            <br>
            <input type="text" name="memberPost"size="6" maxlength="6" class="underline"  autocomplete="off" placeholder="우편번호" value="<%=memberDto.getMemberPostString()%>">
        </div>
        <div class="row m20">
             <input type="text" name="memberBasicAddress" class="underline fill" autocomplete="off" placeholder="기본주소" value="<%=memberDto.getMemberBasicAddressString()%>">
        </div>
        <div class="row m20">
             <input type="text" name="memberDetailAddress" class="underline fill" autocomplete="off" placeholder="상세주소" value="<%=memberDto.getMemberDetailAddressString()%>">
        </div>
        
         
        <div class="row m20">
            <div class="row">
             <label class="middle-text-center" >비밀번호 확인</label>
             <span  class="star">*</span> 
             </div>
             <input type="password" name="memberPw" class="underline fill" required>
         </div>
         
         <div class="row center m20">
             <button type="submit" class="btn" >정보 수정</button>
         </div>
        </div>
        	<% if(request.getParameter("error") != null){ %>
		<h3>비밀번호가 일치하지 않습니다</h3>
	<%} %>
        
        </form>




 <jsp:include page="/template/footer.jsp"></jsp:include>