<%@page import="semi.beans.MemberDto"%>
<%@page import="semi.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header -->
<jsp:include page="/template/header.jsp"></jsp:include>
 <style>
        .correct, .incorrect {
            
        }
        .correct { 
            color:gray;
            display: none;
        }
        .incorrect {
            color: red;
            display: none;
        }

        /* 입력창의 상태에 따라 다른 메세지가 출력되도록 설정 */

        /* 입력창에 ok라는 클래스가 붙으면 그 뒤에 있는 .correct라는 span을 보여주겠다 */
        .input.ok ~ .correct {
            display: inline;
        }
        /* 입력창에 nok라는 클래스가 붙으면 그 뒤에 있는 .incorrect라는 span을 보여주겠다 */
        .input.nok ~ .incorrect {
            display:inline;
        }
    </style>
<script type="text/javascript">
   function memberPwCheck(){
             //준비 : 비밀번호 입력창 , 비밀번호 검사식, 출력대상
             var target = document.querySelector("input[name=changePw]");
             var regex1 = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[a-zA-Z0-9!@#$]{8,16}$/;
			 var regex2 = new RegExp("^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[a-zA-Z0-9!@#$]{8,16}$");
			 
             //처리
             var memberPw = target.value;
             var judge1 = regex1.test(memberPw);
			 var judge2 = regex2.test(memberPw);
			 
             //출력
             target.classList.remove("ok", "nok");
             if(judge1){
                 target.classList.add("ok");
                 return true;
             }
             else {
                 target.classList.add("nok");
                 return false;
             }
         }
         function memberPw2Check(){
             //준비 : 비밀번호 입력창 , 확인창 , 출력대상
             var target = document.querySelector("#password-check");
             var origin = document.querySelector("input[name=changePw]");
             
             //처리
             //1. origin에 값이 없는 경우에는 target을 검사하지 않는다.
             //2. origin에 값이 있는 경우에는 target의 값과 비교하여 같은지 판정한다.
             var judge1 = origin.value.length > 0;
             var judge2 = origin.value == target.value;

             //출력
             target.classList.remove("ok", "nok");
             if(judge1){
                 if(judge2){
                     target.classList.add("ok");
                     return true;
                 }
                 else {
                     target.classList.add("nok");
                     return false;
                 }
             }
             else {
                 target.classList.add("nok");
                 return false;
             }
         }
         
       //폼 검사 함수
         //(1-순차적 실행)
         function formCheck(){
             //넷 다 true면 true
             return memberPwCheck()
                     &&memberPw2Check();
         }
         </script>

<%
	//에러 관련 정보 
	String error = request.getParameter("error");
	boolean case1 = error != null && error.equals("1");
	boolean case2 = error != null && error.equals("2");
%>


 
    <form action="password.kh" method="post" onsubmit="return formCheck();">
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
           <input type="password" name="currentPw"  class="underline fill" autocomplete="off" required>
       </div>
       
       <!-- 새 비밀번호 입력창  -->
       <div class="row m20">
           <label>새 비밀번호</label>
           <span class="star">*</span> 
           <input type="password" name="changePw"  class=" input underline fill"  placeholder="8자 이상 영문, 숫자, 특수 문자중 3가지 이상 조합" required onblur="memberPwCheck();">
        <span class="correct">사용가능한 비밀번호입니다</span>
              <span class="incorrect">형식에 맞게 입력하세요</span>
       </div>
       
       <!-- 새 비밀번호 확인 입력창  -->
       <div class="row m20">
           <label>새 비밀번호 확인</label>
           <span class="star">*</span> 
           <input type="password" id="password-check" class="input underline fill" required onblur="memberPw2Check();">
                      <span class="correct">비밀번호가 일치합니다</span>
                <span class="incorrect">비밀번호가 일치하지 않습니다</span>
       </div>
       
       <!-- 비밀번호 변경 버튼  -->
       <div>
           <button type="submit" class="btn fill m10">비밀번호 변경</button>
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