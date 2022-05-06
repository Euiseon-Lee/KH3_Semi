<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>예약정보(입력)</h1>
<form action="add.kh" method="post">
	<table>
		<tr>
			<th>주문번호</th>  //주문번호 seq 어떻게 가져오는지 
			<td>
				<input type="number" name="booking_order_no" required>
			</td>
		</tr>
		<tr>
			<th>객실번호</th> // 객실번호 어떻게 sql에서 가져오는지?
			<td>
				<input type="text" name="name" required>
			</td>
		</tr>
		<tr>
			<th>인원</th>
			<td>					
				<input type="number" name ="booking_peoplenum" requird>
			</td>
		</tr>
		<tr>
			<th>객실타입</th>
			<td>
			<select name="booking_roomtype" required>
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
				<select name="booking_roomtype" required>
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
				<input type="date" name="booking_checkin" required>
			</td>
		</tr>
		<tr>
			<th>체크아웃</th>
			<td>
				<input type="date" name="booking_checkout" required>
			</td>
		</tr>
		<tr>
			<th>침대추가개수</th>
			<td>					
				<input type="number" name ="booking_extrabednum" required>
			</td>
		</tr>
			<th>개인풀 이용인원</th>
			<td>					
				<input type="number" name ="booking_poolpeoplenum" required>
			</td>
		<tr>
		<th>개인풀 이용날짜</th>
			<td>
				<input type="date" name="booking_poolusedate" required>
			</td>
		</tr>
		<th>레스토랑이용인원</th>
			<td>
				<input type="date" name="booking_restpeoplenum" required>
			</td>
		</tr>
		<th>레스토랑이용날짜</th>
			<td>
				<input type="date" name="booking_restusedate" required>
			</td>
		</tr>
		<tr>
			<th>침대타입</th>
			<td>
				<select name="booking_restmealtype" required>
					<option value="">식사유형을 선택하세요 </option>
					<option>더블</option>
					<option>트윈</option>
				</select>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<input type="submit" value="저장">
				<a href="pay.jsp">목록</a>
			</td>
		</tr>
	</table>
</form>
