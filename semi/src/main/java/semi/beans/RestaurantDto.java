package semi.beans;

import java.sql.Date;

public class RestaurantDto {
	
	 private int restTableno; // 레스토랑 테이블 번호
	 private int restPeopleNum; // 레스토랑 테이블 이용인원
	 private long restMealType; // 레스토랑 식사유형
	 private Date restMealPrice; // 레스토랑 식사금액
	 
	public int getRestTableno() {
		return restTableno;
	}
	public void setRestTableno(int restTableno) {
		this.restTableno = restTableno;
	}
	public int getRestPeopleNum() {
		return restPeopleNum;
	}
	public void setRestPeopleNum(int restPeopleNum) {
		this.restPeopleNum = restPeopleNum;
	}
	public long getRestMealType() {
		return restMealType;
	}
	public void setRestMealType(long restMealType) {
		this.restMealType = restMealType;
	}
	public Date getRestMealPrice() {
		return restMealPrice;
	}
	public void setRestMealPrice(Date restMealPrice) {
		this.restMealPrice = restMealPrice;
	}
	@Override
	public String toString() {
		return "RestaurantDto [restTableno=" + restTableno + ", restPeopleNum=" + restPeopleNum + ", restMealType="
				+ restMealType + ", restMealPrice=" + restMealPrice + "]";
	}

}
