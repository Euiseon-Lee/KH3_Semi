<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
</head>
<body>
<form action="join.kh" method="post">

<!-- required 항목은 * 표시 -->
<!-- jquery 약관동의 전체 동의 체크박스 선택 시 모두 선택되게 구현 예정 : .select-all -->
<!-- jquery 아이디, 이메일 중복검사, 형식검사 예정 : 아이디는 "영문소문자, 숫자 8~20자" -->
<!-- 스타일 작업 시  required span(*) text-color : red 로 작업할 예정 -->
<!-- 비밀번호 확인 기능 추가 예정 -->  
<!-- 주소 우편번호 검색 API 사용 예정 -->
<!-- 1. 약관동의 -> 2. 회원정보입력 -> 3. 회원가입 완료 페이지 이동-->


<!-- 회원가입 약관 동의 영역 -->
<div>
	<h1>Azure에 오신 것을 환영합니다.</h1>
	<h5>*회원가입을 위해 약관 및 개인정보 수집/이용 사항 동의여부에 체크해주시기 바랍니다.</h5>
</div>

<hr>

		<!-- 약관 start -->
		<div>
			<ul>
				<li>
					<ul>
						<li>이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 안내 메일 수신(선택)에 모두
							동의합니다.
							<input type="checkbox" name="checkAll">
						</li>
					</ul>
				</li>
				<li>
					<ul>
						<li>이용약관 동의(필수)
							<input type="checkbox" name="check1">
						</li>
					</ul> <textarea name="" id="">여러분을 환영합니다.
Azure Hotel(이하 ‘아주르호텔’)을 이용해 주셔서 감사합니다. 
이 약관은 Azure 호텔앤리조트㈜(이하, “회사”)가 운영하는 온라인 인터넷 사이트 및 애플리케이션(이하, “홈페이지”)에서 제공하는
인터넷 관련 서비스(이하, “서비스”)를 이용함에 있어 홈페이지, 서비스와 이용자의 권리의무 및 책임사항을 규정함을 목적으로 합니다.
       </textarea>
				</li>
				<li>
					<ul>
						<li>개인정보 수집 및 이용 동의(필수)
							<input type="checkbox" name="check1">
						</li>
					</ul> <textarea name="" id="">
Azure 호텔앤리조트㈜는 온라인 회원 가입과 관련하여 아래와 같은 개인정보를 수집 및 이용하고 있습니다 .
개인정보처리에 대한 상세한 사항은 글래드 호텔앤리조트 홈페이지의 “개인정보 처리방침”을 참조하세요.
“개인정보 처리방침”과 이 개인정보 수집 및 이용 동의서의 내용과 상충되는 사항이 있는 경우에는 이 동의서의 내용이 우선합니다.
       </textarea>
				</li>
					<li>
					<ul>
						<li>위치정보 이용약관(선택)
							<input type="checkbox" name="check1">
						</li>
					</ul> <textarea name="" id="">
Azure 호텔앤리조트㈜는 개인위치정보를 이용하여 서비스를 제공하고자 하는 경우에는 회원이 본 약관에 동의하면 위치정보 이용에 동의한 것으로 간주됩니다.
회원이 제공한 개인위치정보를 해당 회원의 동의 없이 서비스 제공 이외의 목적으로 이용하지 않습니다. 단, 고객이 미리 요청한 경우 해당 내용을 고객이 지정한 휴대전화나 이메일 주소로 통보할 수 있습니다.
   </textarea>
				</li>
				<li>
					<ul>
						<li>프로모션 안내 메일 수신(선택)
							<input type="checkbox" name="check1">
						</li>
					</ul> <textarea name="" id="">
Azure 호텔앤리조트㈜의 온라인 회원 서비스 관련 정보, 혜택, 신상품 안내, 이벤트 및 맞춤 서비스 정보 수신을 위해
개인정보를 수집 및 이용하는 것에 동의합니다.    </textarea>
				</li>
			</ul>
		</div>
		<!-- 약관 end -->


		<div>
      <button type="button" >메인으로</button>
      <button type="button">다음</button>
</div>

<!-- 회원 정보입력 영역 -->
<div>
	<h1>회원 정보입력</h1>
</div>

<hr>

<div>
	<label>아이디</label>
	<span>*</span> 
	<input type="text" name="memberId" required>
	<input type="button" value="중복확인">
</div>

<div>
	<label>비밀번호</label>
	<span>*</span> 
	<input type="password" name="memberPw" required>
	<span>8자 이상 영문, 숫자, 특수 문자중 3가지 이상 조합</span>
</div>

<div>
	<label>비밀번호 확인</label>
	<span>*</span> 
	<input type="password" name="memberPw-check" required>
</div>

<div>
	<label>이름(영문)</label>
	<span>*</span> 
	<input type="text" name="memberFname" required placeholder="First Name(이름)">
	<input type="text" name="memberLname" required placeholder="Last Name(성)">
</div>

<div>
	<label>이름(국문)</label>
		<input type="text" name="memberName">
</div>

<div>
	<label>생년월일</label>
	<span>*</span> 
	<input type="date" name="memberBirth" required placeholder="YYYY-MM-DD">
</div>

<div>
	<label>연락처</label>
	<span>*</span> 
	<input type="tel" name="memberPhone" required placeholder="- 없이 입력">
</div>

<div>
	<label>이메일</label>
	<span>*</span> 
	<input type="email" name="memberEmail" required >
	<input type="button" value="중복확인">
</div>

<div>
	<label>주소</label>
	<input type="text" name="memberPost">
	<input type="button" value="주소 찾기">
</div>

 <div>
     <input type="text" name="memberBasicAddress" > 
     <input type="text" name="memberDetailAddress">
 </div>
 
 <div>
      <button type="button">이전</button>
      <input type="submit" value="회원가입">
</div>


</form>
</body>
</html>