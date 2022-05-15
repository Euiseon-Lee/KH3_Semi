<%@page import="semi.beans.MemberDto"%>
<%@page import="semi.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header -->
<jsp:include page="/template/header.jsp"></jsp:include>
<%-- 준비 --%>
<%
	String memberId = (String)session.getAttribute("login");
%>    
    
<%-- 처리 --%>
<%
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.selectOneId(memberId);
%>

    <div class="container w800 m40 ">
        <div class="row center">
    <h1 class="title-text">회원 정보</h1>
    </div>

    <div class="row center m50">
    <table class="table table-underline">
        <tr>
            <th width="20%" class="middle-text-center" style="font-weight: bold">아이디</th>
            <td style=" color: rgb(39, 76, 119)"><%=memberDto.getMemberId()%></td>
        </tr>
        <tr>
            <th width="20%" class="middle-text-center" style="font-weight: bold">이름(영문)</th>
            <td  style=" color: rgb(39, 76, 119)"><%=memberDto.getMemberFname()%><%=memberDto.getMemberLname()%></td>
        </tr>
            <tr>
            <th width="20%" class="middle-text-center" style="font-weight: bold">이름(국문)</th>
            <td style=" color: rgb(39, 76, 119)"><%=memberDto.getMemberName()%></td>
        </tr>
        <tr>
            <th width="20%" class="middle-text-center" style="font-weight: bold">생년월일</th>
            <td style=" color: rgb(39, 76, 119)"><%=memberDto.getMemberBirth()%></td>
        </tr>
        <tr>
            <th width="20%" class="middle-text-center" style="font-weight: bold">전화번호</th>
            <td style=" color: rgb(39, 76, 119)"><%=memberDto.getMemberPhone()%></td>
        </tr>
        <tr>
            <th width="20%" class="middle-text-center" style="font-weight: bold">이메일</th>
            <td style=" color: rgb(39, 76, 119)"><%=memberDto.getMemberEmail()%></td>
        </tr>
        <tr>
            <th width="20%" class="middle-text-center" style="font-weight: bold" ><br>주소</th>
            <td style=" color: rgb(39, 76, 119)">
                <%=memberDto.getMemberPostString()%>
                <%=memberDto.getMemberBasicAddressString()%>
                <%=memberDto.getMemberDetailAddressString()%>
            </td>
        </tr>
        <tr>
            <th width="20%" class="middle-text-center" style="font-weight: bold">가입일</th>
            <td style=" color: rgb(39, 76, 119)"><%=memberDto.getMemberJoindate()%></td>  
        </tr>
        <tr>
            <th width="20%" class="middle-text-center" style="font-weight: bold">최종 접속일</th>  
            <td style=" color: rgb(39, 76, 119)"><%=memberDto.getMemberLogindate()%></td>
        </tr> 
    </table>
    </div>

    <div class="row center">  

    <a href="<%=request.getContextPath()%>/pay/list.jsp" class="link link-btn" >결제내역 목록보기</a>
    <a href="<%=request.getContextPath() %>/bookings/bookingsList.jsp" class = "link link-btn">예약내역 보기</a>

    <a href="<%=request.getContextPath()%>/mypage/password.jsp" class="link link-btn" >비밀번호 변경</a>
    <a href="<%=request.getContextPath()%>/mypage/information.jsp" class="link link-btn" >개인정보 변경</a>
    <a href="<%=request.getContextPath()%>/mypage/exit.jsp" class="link link-btn" >탈퇴하기</a>
    </div>
</div>



 <jsp:include page="/template/footer.jsp"></jsp:include>
