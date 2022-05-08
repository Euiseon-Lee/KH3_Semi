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
	<h1>Asure에 오신 것을 환영합니다.</h1>
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
Asure Hotel(이하 ‘아주르호텔’)을 이용해 주셔서 감사합니다. 
본 약관은 다양한 호텔 서비스 이용과 관련하여 서비스를 제공하는 Asure Hotel과(이하 ‘아주르호텔’)와 이를 이용하는 Asure Hotel 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 
아울러 여러분의 호텔 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
				</li>
			</ul>
		</div>
		<!-- 약관 end -->


		<div>
      <button type="button">메인으로</button>
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


</table>
</form>
</body>
</html>