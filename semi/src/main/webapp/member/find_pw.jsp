<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>


 <form action="find_pw.kh" method="post">
        <!-- 비밀번호 확인문구 -->

            <div class="center w350 m50">
        <div class="row center m40">
            <h1 class="title-text">비밀번호를 잊으셨나요?</h1>
        </div>
        <div class="m10">
            <h5 class="middle-text-left" >가입정보를 입력하면 비밀번호를 재설정할 수 있습니다.</h5>

            
        </div>
 

        <!-- 아이디 입력창 -->
        <div class="row center m20"> 
            <input type="text" name="memberId" required placeholder="아이디 입력" placeholder="이메일 입력" class="underline fill" autocomplete="off" >
        </div>
        
        <!-- 이름(영문) 입력창 -->
        <div class="row center m20"> 
            <input type="text" name="memberFname" required placeholder="영문이름(이름) 입력" placeholder="이메일 입력" class="underline fill" autocomplete="off">
        </div>
        <div>
            <input type="text" name="memberLname" required placeholder="영문이름(성) 입력" placeholder="이메일 입력" class="underline fill" autocomplete="off">
        </div>
        
        <!-- 이메일 입력창 -->
        <div class="row center m20"> 
            <input type="text" name="memberEmail" required placeholder="이메일 입력" placeholder="이메일 입력" class="underline fill" autocomplete="off">
        </div>
        
        <!-- 핸드폰 입력창 -->
        <div class="row center m20"> 
            <input type="tel" name="memberPhone" required placeholder="전화번호 입력" placeholder="이메일 입력" class="underline fill" autocomplete="off">
        </div>
        
        <!-- 비밀번호 재설정 버튼 -->
        <div class="row center m50"> 
            <button type="submit" class="btn fill" >비밀번호 재설정</button>
        </div>
			    
			    	<%-- 에러 표시가 있는 경우 메세지를 출력 --%>
		<% if(request.getParameter("error") != null) { %>
		<div class="row center">
			<h3 style="color:red;">일치하는 데이터가 존재하지 않습니다</h3>	
		</div>
		<% } %>        
    </div>
</form>
			

<jsp:include page="/template/footer.jsp"></jsp:include>