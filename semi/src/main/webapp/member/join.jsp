<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header -->
<jsp:include page="/template/header.jsp"></jsp:include>


<!--jquery cdn-->
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script type="text/javascript">
	$(function() {
		var index = 0;

		//처음페이지를 제외하고 모두 숨김 처리
		$(".page:gt(0)").hide();

		//다음버튼을 누르면 다음 페이지가 나오도록 구현
		$(".btn-next").not(":last").click(function() {
			index++;
			$(".page").hide();
			$(".page").eq(index).show();

		});

		//이전버튼을 누르면 이전 페이지가 나오도록 구현
		$(".btn-prev").not(":first").click(function() {
			index--;
			$(".page").hide();
			$(".page").eq(index).show();

		});

	});
</script>



<form action="login.kh" method="post">

<!-- required 항목은 * 표시 -->
<!-- jquery 약관동의 전체 동의 체크박스 선택 시 모두 선택되게 구현 예정 : .select-all -->
<!-- jquery 아이디, 이메일 중복검사, 형식검사 예정 : 아이디는 "영문소문자, 숫자 8~20자" -->
<!-- 비밀번호 확인 기능 추가 예정 -->  
<!-- 주소 우편번호 검색 API 사용 예정 -->
<!-- 1. 약관동의 -> 2. 회원정보입력 -> 3. 회원가입 완료 페이지 이동-->


<!-- 회원가입 약관 동의 영역 -->
<div class="container w800 m40 page">
<div class="row center">
	<h1 class="title-text">Azure에 오신 것을 환영합니다</h1>
</div>
<div class="row center">
	<h5 class="middle-text-left">* 회원가입을 위해 약관 및 개인정보 수집/이용 사항 동의여부에 체크해주시기 바랍니다.</h5>
</div>


<hr>

		<!-- 약관 start -->
			<ul>
				<li>
					<ul>
						<li>
                            <div class="row m40">
                            <h4 class="important-text"> <input type="checkbox" name="checkAll"> 이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 안내 메일 수신(선택)에 모두
							동의합니다.</h4>
                            </div>
						</li>
					</ul>
				</li>
				<li>
					<ul>
                        <div class="row m20">
						<li> <input type="checkbox" name="check1"> <label>이용약관 동의(필수)</label>
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
							<input type="checkbox" name="check1"> <label>개인정보 수집 및 이용 동의(필수)</label>
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
							<input type="checkbox" name="check1"><label>위치정보 이용약관(선택)</label>
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
							<input type="checkbox" name="check1"><label>프로모션 안내 메일 수신(선택)</label>
						</li>
                        </div>
					</ul>       <div class="row center">
                        <textarea name="" id="" class="form-input fill input-round" rows="7">
Azure 호텔앤리조트㈜의 온라인 회원 서비스 관련 정보, 혜택, 신상품 안내, 이벤트 및 맞춤 서비스 정보 수신을 위해
개인정보를 수집 및 이용하는 것에 동의합니다.    </textarea>
				</li>
			</ul>
		</div>
		<!-- 약관 end -->


        <div class="row center m20">
      <button type="button" class="btn"><a href="<%=request.getContextPath()%>/index.jsp" class="link tomain-text">메인으로</a></button>
      <button type="button"  class="btn btn-next">다음</button>
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
    <input type="button" value="중복확인">
    </div>
	<input type="text" name="memberId" class="underline fill" required autocomplete="off">
</div>

<div class="row m20">
    <div class="row">
	<label>비밀번호</label>
	<span class="star">*</span> 
    </div>
	<input type="password" class="underline fill" name="memberPw" required placeholder="8자 이상 영문, 숫자, 특수 문자중 3가지 이상 조합">
</div>

<div class="row m20">
    <div class="row">
	<label>생년월일</label>
    <span class="star">*</span> 
    </div>
	<input type="text" name="memberBirth" class="underline fill" required placeholder="YYYY-MM-DD" autocomplete="off">
</div>


<div class="row m20">
    <div class="row">
<label>비밀번호 확인</label>
<span class="star">*</span>
</div>
<input type="password" name="memberPw-check" class="underline fill" required>
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
    <input type="button" value="중복확인">  
	<input type="email" name="memberEmail" class="underline fill" required autocomplete="off">
</div>

<div class="row m20">
	<label>주소</label>
    <input type="button" value="주소 찾기">
    <br>
	<input type="text" name="memberPost" size="6" maxlength="6" class="underline" autocomplete="off">
</div>

<div class="row m20">
    <input type="text" name="memberBasicAddress" class="underline fill" autocomplete="off" > 
    &nbsp;&nbsp;<input type="text" class="underline fill" name="memberDetailAddress">
 </div>
 
 <div class="row center m20">
      <button type="button" class="btn btn-prev">이전</button>
      <input type="submit" class="btn" value="회원가입">
</div>
</div>

</form>


 <jsp:include page="/template/footer.jsp"></jsp:include>