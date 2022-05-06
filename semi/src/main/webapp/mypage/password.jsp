<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	//에러 관련 파라미터 수신
	String error = request.getParameter("error");
	boolean type1 = error != null && error.equals("1");
	boolean type2 = error != null && error.equals("2");
%>
 
	<form action="password.kh" method="post">
	<div class="container w400 m30">
	    <div class="row center">
	        <h1>비밀번호 변경</h1>
	    </div>
	    <div class="row">
	        <label>현재 비밀번호</label>
	        <input type="password" name="currentPw" required class="form-input fill input-round">
	    </div>
	    <div class="row">
	        <label>변경할 비밀번호</label>
	        <input type="password" name="changePw" required class="form-input fill input-round">
	    </div>
	    <div class="row">
	        <button type="submit" class="btn btn-primary fill">비밀번호 변경하기</button>
	    </div>
	    
	    <%if(type1){ %>
	    <div class="row center">
			<h3 style="color:red;">현재 비밀번호와 같은 비밀번호로 변경할 수 없습니다</h3>
		</div>
		<%} %>
		
		<%if(type2){ %>
		<div class="row center">
			<h3 style="color:red;">비밀번호가 일치하지 않습니다</h3>
		</div>
		<%} %>
	</div>
</form>
</body>
</html>