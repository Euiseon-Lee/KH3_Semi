<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>			
			
<h1>예약정보(입력)</h1>
<form action="add.kh" method="post">
<div class="container w400 m30">
	    <div class="row center">
	        <h1>예약 정보 등록</h1>
	    </div>
	     <div class="row">
	        <label>객실번호</label>
	        <input type="number" name="bookingRoomNo" autocomplete="off" required >
	    </div>
	    <div class="row">
	        <label>인원</label>
	        <input type="number" name="bookingPeopleNum" autocomplete="off" required >
	    </div>
	    <div class="row">
	        <label>객실타입</label><br>
	        <select name="bookingRoomType" required >
	            <option value="">선택하세요</option>
	            <option>스탠다드</option>
	            <option>디럭스</option>
	            <option>프리미어</option>
	            <option>스위트</option>
	        </select>
	    </div>
	    <div class="row">
	        <label>침대타입</label><br>
	        <select name="bookingBedType" required >
	            <option value="">선택하세요</option>
	            <option>더블</option>
	            <option>트윈</option>
	            <option>퀸</option>
	        </select>
	    </div>
	    <div class="row">
	        <label>체크인</label>
	        <input type="date" name="bookingCheckIn" autocomplete="off" required >
	    </div>
	     <div class="row">
	        <label>체크아웃</label>
	        <input type="date" name="bookingCheckOut" autocomplete="off" required >
	    </div>
	    <div class="row">
	        <label>침대추가개수</label>
	        <input type="number" name="bookingExtrabedNum" autocomplete="off" required >
	    </div>
	    <div class="row">
	        <label>개인풀 이용인원</label>
	        <input type="number" name="bookingPoolPeopleNum" autocomplete="off" required >
	    </div>
	    </div>
	     <div class="row">
	        <label>개인풀 이용날짜</label>
	        <input type="date" name="bookingPoolUseDate" autocomplete="off" required >
	    </div>
	    <div class="row">
	        <label>레스토랑이용인원</label>
	        <input type="number" name="bookingRestPeopleNum" autocomplete="off" required >
	    </div>
	    <div class="row">
	        <label>레스토랑이용날짜</label>
	        <input type="date" name="bookingRestUseDate" autocomplete="off" required >
	    </div>
	     <div class="row">
	        <label>레스토랑식사유형</label><br>
	        <select name="bookingRestMealType" required >
	            <option value="">선택하세요</option>
	            <option>조식</option>
	            <option>석식</option>
	        </select>
	    </div>
	    <div class="row">
	        <button type="submit" >등록</button>
	    </div>
	    </form>
	    <div class="row">
	        <a href="pay.jsp" >결제등록</a>
	    </div>
