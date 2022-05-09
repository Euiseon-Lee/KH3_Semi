<%@page import="semi.beans.PayDto"%>
<%@page import="semi.beans.PayDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>결제 확인 페이지</title>
<%-- 준비 --%>
<%
	String memberId = (String)session.getAttribute("login");
%>    
    
<h1>결제 확인 페이지</h1>
<form action="add.kh" method="post">
	<table>
		<tr>
			<th>객실번호</th> 
			<td>
				<input type="number" name="name" required>
			</td>
		</tr>
		<tr>
			<th>인원</th>
			<td>					
				<input type="number" name ="pay_peoplenum" required>
			</td>
		</tr>
		<tr>
			<th>객실타입</th>
			<td>
			<select name="pay_roomtype" required>
					<option value=""> 객실타입을 선택하세요</option>
					<option>스탠다드</option>
					<option>디럭스</option>
					<option>프리미어</option>
					<option>스위트</option>						
			</select>
			</td>
		</tr>
		<tr>
			<th>침대타입</th>
			<td>
				<select name="pay_roomtype" required>
					<option value="">침대타입을 선택하세요 </option>
					<option>더블</option>
					<option>트윈</option>
					<option>퀸</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>체크인</th>
			<td>
				<input type="date" name="pay_checkin" required>
			</td>
		</tr>
		<tr>
			<th>체크아웃</th>
			<td>
				<input type="date" name="pay_checkout" required>
			</td>
		</tr>
		<tr>
			<th>침대 추가개수</th>
			<td>					
				<input type="number" name ="pay_extrabednum" required>
			</td>
		</tr>
			<th>개인풀 이용인원</th>
			<td>					
				<input type="number" name ="pay_poolpeoplenum" required>
			</td>
		<tr>
		<th>개인풀 이용날짜</th>
			<td>
				<input type="date" name="pay_poolusedate" required>
			</td>
		</tr>
		<th>레스토랑 이용인원</th>
			<td>
				<input type="number" name="pay_restpeoplenum" required>
			</td>
		</tr>
		<th>레스토랑 이용날짜</th>
			<td>
				<input type="date" name="pay_restusedate" required>
			</td>
		</tr>
		<tr>
			<th>레스토랑 식사유형</th>
			<td>
				<select name="pay_restmealtype" required>
					<option value="">식사유형을 선택하세요 </option>
					<option>조식</option>
					<option>석식</option>
				</select>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<input type="submit" value="저장">
				<a href="add.jsp">예약 목록</a>
			</td>
		</tr>
		</table>
		</form>

