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

<!--jquery cdn-->
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>


<script type="text/javascript">

	//페이지 다음이전 함수
	$(function() {
		var index = 0;
        move(index);
        $(".btn-next").click(function(){
            move(++index);
        });
		//이전버튼을 누르면 이전 페이지가 나오도록 구현
        $(".btn-prev").click(function(){
            move(--index);
        });
        function move(index){
            $(".page").hide();
            $(".page").eq(index).show();
        }
	});
	
	//약관 전체동의 선택동의 함수
     function checkboxControl(target){//target==이벤트가 발생한 태그 객체
         //준비 : 전체선택, 항목 체크박스들
        var selectAllList = document.querySelectorAll(".select-all");
        var checkboxAllList = document.querySelectorAll("input[name=subject]");

        //처리
        for(var i=0;i<selectAllList.length;i++){
            selectAllList[i].checked=target.checked;
        }
        for(var i=0;i<checkboxAllList.length;i++){
            checkboxAllList[i].checked=target.checked;
        }

        function selectItem(){//target==체크한 항목 아이템
            //모든 체크박스가 체크되었는지 확인
            //-> 체크된 체크박스 수 = 전체 항목 체크박스 수 
            //준비
            var checkboxList=document.querySelectorAll("input[name=subject]");
            var count =0;
            //처리
            for(var i=0;i<checkboxList;i++){
                if(checkboxList[i].checked){
                    count++;
                }
            }
            
            var judge = count ==checkboxList.length;
            var selectAllList = document.querySelectorAll(".select-all");
            for(var i=0; i<selectAllList;i++){
                selectAllList[i].checked=judge;
            }
        }
     }

	
         function memberIdCheck(){
             //준비 : 아이디 입력창 , 아이디 검사식
             var target = document.querySelector("input[name=memberId]");
             var regex = /^[a-z][a-z0-9-_]{7,19}$/;
             
             //처리
             var memberId = target.value;
             var judge = regex.test(memberId);

             //출력
             target.classList.remove("ok", "nok");//ok, nok 클래스를 모두 제거
             if(judge){
                 //클래스 항목에 ok라는 클래스를 추가(classList는 태그에 내장된 내장객체)
                 target.classList.add("ok");
                 return true;
             }
             else {
                 target.classList.add("nok");
                 return false;
             }
         }
         function memberPwCheck(){
             //준비 : 비밀번호 입력창 , 비밀번호 검사식, 출력대상
             var target = document.querySelector("input[name=memberPw]");
             var regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[a-zA-Z0-9!@#$]{8,16}$/;

             //처리
             var memberPw = target.value;
             var judge = regex.test(memberPw);

             //출력
             target.classList.remove("ok", "nok");
             if(judge){
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
             var origin = document.querySelector("input[name=memberPw]");
             
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
             return memberIdCheck()&&memberPwCheck()
                     &&memberPw2Check();
         }

          //(2-일괄 실행)
         function formCheck2(){
             var judge1 = memberIdCheck();
             var judge2 = memberPwCheck();
             var judge3 = memberPw2Check();
             return judge1&&judge2&&judge3;
         }
     </script>
    
    
    


<script>
    function findAddress() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                   // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    } 
                
                
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                   // document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                //document.getElementById('sample6_postcode').value = data.zonecode;
                $("input[name=memberPost]").val(data.zonecode);
                //document.getElementById("sample6_address").value = addr;
                $("input[name=memberBasicAddress]").val(addr);
                // 커서를 상세주소 필드로 이동한다.
                //document.getElementById("sample6_detailAddress").focus();
                $("input[name=memberDetailAddress]").foicus();
            }
        }).open();
    }
    
</script>

 <script type="text/javascript">
     $(function(){
         $(".address-find-btn").click(findAddress);
     });
</script>

    <!-- 필수항목체크 함수 -->
    <script>
    function chk() {
        var f = document.thisForm;
        if(f.subject_agree.checked!==true) {
            alert('필수항목에 체크해 주세요.');
        } else {
            alert('약관에 동의하셨습니다.');
            f.submit();
        }
    }
  </script>

<form action="join.kh" method="post"  onsubmit="return formCheck();">
  

<!-- jquery 아이디, 이메일 중복검사, 형식검사 예정 : 아이디는 "영문소문자, 숫자 8~20자" -->
<!-- 비밀번호 확인 기능 추가 예정 -->  


<!-- 회원가입 약관 동의 영역 -->
<div class="container w800 m40 page">
<div class="row center">
	<h1 class="title-text">Azure에 오신 것을 환영합니다</h1>
</div>
<div class="row center">
	<h6 class="middle-text-center">* 회원가입을 위해 약관 및 개인정보 수집/이용 사항 동의여부에 체크해주시기 바랍니다.</h6>
</div>


<hr>

		<!-- 약관 start -->
		  <form name="thisForm">
			<p class="qna_privacy_agree">
			<ul>
				<li>
					<ul>
						<li>
                            <div class="row m40">
                            <h4 class="important-text"> <input type="checkbox" oninput="checkboxControl(this);" class="select-all"> 이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 안내 메일 수신(선택)에 모두
							동의합니다.</h4>
                            </div>
						</li>
					</ul>
				</li>
				<li>
					<ul>
                        <div class="row m20">
						<li> <input type="checkbox" name="subject"  required  oninput="selectItem();"> <label>이용약관 동의(필수)</label>
						</li>
                        </div>
					</ul> 
                    <div class="row center">
                    <textarea name="" id="" class="form-input fill input-round" rows="7">여러분을 환영합니다.
Azure Hotel(이하 ‘아주르호텔’)을 이용해 주셔서 감사합니다. 
이 약관은 Azure 호텔앤리조트㈜(이하, “회사”)가 운영하는 온라인 인터넷 사이트 및 애플리케이션(이하, “홈페이지”)에서 제공하는
인터넷 관련 서비스(이하, “서비스”)를 이용함에 있어 홈페이지, 서비스와 이용자의 권리의무 및 책임사항을 규정함을 목적으로 합니다.
       </textarea>
                    </div>
				</li>
				<li>
					<ul>
                        <div class="row m20">
						<li>
							<input type="checkbox" name="subject"   required  oninput="selectItem();"> <label>개인정보 수집 및 이용 동의(필수)</label>
						</li>
                        </div>
					</ul>  
                    <div class="row center">
                    <textarea name="" id="" class="form-input fill input-round" rows="7">
Azure 호텔앤리조트㈜는 온라인 회원 가입과 관련하여 아래와 같은 개인정보를 수집 및 이용하고 있습니다 .
개인정보처리에 대한 상세한 사항은 글래드 호텔앤리조트 홈페이지의 “개인정보 처리방침”을 참조하세요.
“개인정보 처리방침”과 이 개인정보 수집 및 이용 동의서의 내용과 상충되는 사항이 있는 경우에는 이 동의서의 내용이 우선합니다.
       </textarea>
       <div>
				</li>
					<li>
					<ul>
                        <div class="row  m20">
						<li>
							<input type="checkbox" name="subject"  oninput="selectItem();"><label>위치정보 이용약관(선택)</label>
						</li>
                        </div>
					</ul>
                        <div class="row center">
                        <textarea name="" id="" class="form-input fill input-round" rows="7">
Azure 호텔앤리조트㈜는 개인위치정보를 이용하여 서비스를 제공하고자 하는 경우에는 회원이 본 약관에 동의하면 위치정보 이용에 동의한 것으로 간주됩니다.
회원이 제공한 개인위치정보를 해당 회원의 동의 없이 서비스 제공 이외의 목적으로 이용하지 않습니다. 단, 고객이 미리 요청한 경우 해당 내용을 고객이 지정한 휴대전화나 이메일 주소로 통보할 수 있습니다.
   </textarea>
   </div>
				</li>
				<li>
					<ul>
                        <div class="row  m20">
						<li>
							<input type="checkbox" name="subject"  oninput="selectItem();"><label>프로모션 안내 메일 수신(선택)</label>
						</li>
                        </div>
					</ul>       <div class="row center">
                        <textarea name="" id="" class="form-input fill input-round" rows="7">
Azure 호텔앤리조트㈜의 온라인 회원 서비스 관련 정보, 혜택, 신상품 안내, 이벤트 및 맞춤 서비스 정보 수신을 위해
개인정보를 수집 및 이용하는 것에 동의합니다.    </textarea>
				</li>
			</ul>
		<!-- 약관 end -->

            </p>
        <div class="row center m20">
      <button type="button" class="btn"><a href="<%=request.getContextPath()%>/index.jsp" class="link tomain-text">메인으로</a></button>
      <button type="button"  class="btn btn-next" >다음</button>
    </div>
</div>
</div>
		</div>
	

 
<!-- 회원 정보입력 영역 -->
<div class="container w800 m40 page">
<div class="row center m30">
	<h1 class="title-text">회원 정보입력</h1>
</div>

<hr>

<div class="row m20">
    <div class="row">
	<label>아이디</label>
	<span class="star">*</span> 
<!--     <input type="button" value="중복확인"> -->
    </div>
	<input type="text" name="memberId" class="input underline fill " required autocomplete="off" onblur="memberIdCheck();">
	                <span class="correct">사용가능한 아이디입니다</span>
                <span class="incorrect">형식에 맞게 입력하세요</span>
</div>

<div class="row m20">
    <div class="row">
	<label>생년월일</label>
    <span class="star">*</span> 
    </div>
	<input type="date" name="memberBirth" class="underline fill" required placeholder="YYYY-MM-DD" autocomplete="off">
</div>

<div class="row m20">
    <div class="row">
	<label>비밀번호</label>
	<span class="star">*</span> 
    </div>
	<input type="password" class=" input underline fill" name="memberPw" required placeholder="8자 이상 영문, 숫자, 특수 문자중 3가지 이상 조합" onblur="memberPwCheck();">
	                <span class="correct">사용가능한 비밀번호입니다</span>
                <span class="incorrect">형식에 맞게 입력하세요</span>
</div>


<div class="row m20">
    <div class="row">
<label>비밀번호 확인</label>
<span class="star">*</span>
</div>
<input type="password" id="password-check" class="input underline fill " required onblur="memberPw2Check();">
                <span class="correct">비밀번호가 일치합니다</span>
                <span class="incorrect">비밀번호가 일치하지 않습니다</span>
</div>

<div class="row m20">
	<label>이름(국문)</label>
		<input type="text" name="memberName" class="underline fill" autocomplete="off">
</div>

<div class="row m20">
	<label>이름(영문)</label>
	<span class="star">*</span>
    <br>
    <div class="row m20">
	<input type="text" name="memberFname" class="underline fill" required placeholder="First Name(이름), 대문자" autocomplete="off">
    </div>
    <input type="text" name="memberLname" class="underline fill" required placeholder="Last Name(성), 대문자" autocomplete="off">
</div>


<div class="row m20">
	<label>연락처</label>
	<span class="star">*</span> 
	<input type="tel" name="memberPhone" required placeholder="- 없이 입력" class="underline fill" autocomplete="off">
</div>

<div class="row cneter m20">
	<label>이메일</label>
	<span class="star">*</span> 
<!--     <input type="button" value="중복확인">   -->
	<input type="email" name="memberEmail" class="underline fill" required autocomplete="off">
</div>

<div class="row m20">
	<label>주소</label>
    <input type="button" class="address-find-btn" value="주소 찾기">
    <br>
	<input type="text" name="memberPost" size="6" maxlength="6" class="underline" autocomplete="off"  placeholder="우편번호">
</div>

<div class="row m20">
    <input type="text" name="memberBasicAddress" class="underline fill" autocomplete="off"  placeholder="주소"> 
    &nbsp;&nbsp;<input type="text" class="underline fill" name="memberDetailAddress" placeholder="상세주소">
 </div>
 
 <div class="row center m20">
      <button type="button" class="btn btn-prev">이전</button>
      <button type="submit" class="btn" >회원가입</button>
</div>
</div>

</form>


 <jsp:include page="/template/footer.jsp"></jsp:include>