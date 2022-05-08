package semi.beans;

import java.sql.Date;

public class PayDto {
	  
	  private int payOrderNo; // 주문번호 
	  private String payMemberId; // 아이디
	  private int payRoomNo; // 객실번호
	  private int payPeopleNum; // 인원
	  private String payRoomType; // 객실타입
	  private String payBedType; // 침대타입
	  private Date payCheckIn; // 체크인
	  private Date payCheckOut; // 체크아웃
	  private long payRoomRates; // 객실기본요금
	  private long paySeasonExtra; // 객실시즌추가요금
	  private int payExtraBedNum; // 침대추가개수
	  private long payExtraBedPrice; // 침대추가요금
	  private int payPoolPeopleNum; // 개인풀 이용인원
	  private Date payPoolUseDate;  // 개인풀이용날짜
	  private int payRestPeopleNum ; // 레스토랑이용인원
	  private Date payRestUseDate; // 레스토랑이용날짜
	  private String payRestMealType; // 레스토랑식사유형
	  
	public int getPayOrderNo() {
		return payOrderNo;
	}
	public void setPayOrderNo(int payOrderNo) {
		this.payOrderNo = payOrderNo;
	}
	public String getPayMemberId() {
		return payMemberId;
	}
	public void setPayMemberId(String payMemberId) {
		this.payMemberId = payMemberId;
	}
	public int getPayRoomNo() {
		return payRoomNo;
	}
	public void setPayRoomNo(int payRoomNo) {
		this.payRoomNo = payRoomNo;
	}
	public int getPayPeopleNum() {
		return payPeopleNum;
	}
	public void setPayPeopleNum(int payPeopleNum) {
		this.payPeopleNum = payPeopleNum;
	}
	public String getPayRoomType() {
		return payRoomType;
	}
	public void setPayRoomType(String payRoomType) {
		this.payRoomType = payRoomType;
	}
	public String getPayBedType() {
		return payBedType;
	}
	public void setPayBedType(String payBedType) {
		this.payBedType = payBedType;
	}
	public Date getPayCheckIn() {
		return payCheckIn;
	}
	public void setPayCheckIn(Date payCheckIn) {
		this.payCheckIn = payCheckIn;
	}
	public Date getPayCheckOut() {
		return payCheckOut;
	}
	public void setPayCheckOut(Date payCheckOut) {
		this.payCheckOut = payCheckOut;
	}
	public long getPayRoomRates() {
		return payRoomRates;
	}
	public void setPayRoomRates(long payRoomRates) {
		this.payRoomRates = payRoomRates;
	}
	public long getPaySeasonExtra() {
		return paySeasonExtra;
	}
	public void setPaySeasonExtra(long paySeasonExtra) {
		this.paySeasonExtra = paySeasonExtra;
	}
	public int getPayExtraBedNum() {
		return payExtraBedNum;
	}
	public void setPayExtraBedNum(int payExtraBedNum) {
		this.payExtraBedNum = payExtraBedNum;
	}
	public long getPayExtraBedPrice() {
		return payExtraBedPrice;
	}
	public void setPayExtraBedPrice(long payExtraBedPrice) {
		this.payExtraBedPrice = payExtraBedPrice;
	}
	public int getPayPoolPeopleNum() {
		return payPoolPeopleNum;
	}
	public void setPayPoolPeopleNum(int payPoolPeopleNum) {
		this.payPoolPeopleNum = payPoolPeopleNum;
	}
	public Date getPayPoolUseDate() {
		return payPoolUseDate;
	}
	public void setPayPoolUseDate(Date payPoolUseDate) {
		this.payPoolUseDate = payPoolUseDate;
	}
	public int getPayRestPeopleNum() {
		return payRestPeopleNum;
	}
	public void setPayRestPeopleNum(int payRestPeopleNum) {
		this.payRestPeopleNum = payRestPeopleNum;
	}
	public Date getPayRestUseDate() {
		return payRestUseDate;
	}
	public void setPayRestUseDate(Date payRestUseDate) {
		this.payRestUseDate = payRestUseDate;
	}
	public String getPayRestMealType() {
		return payRestMealType;
	}
	public void setPayRestMealType(String payRestMealType) {
		this.payRestMealType = payRestMealType;
	}
	
	@Override
	public String toString() {
		return "PayDto [payOrderNo=" + payOrderNo + ", payMemberId=" + payMemberId + ", payRoomNo=" + payRoomNo
				+ ", payPeopleNum=" + payPeopleNum + ", payRoomType=" + payRoomType + ", payBedType=" + payBedType
				+ ", payCheckIn=" + payCheckIn + ", payCheckOut=" + payCheckOut + ", payRoomRates=" + payRoomRates
				+ ", paySeasonExtra=" + paySeasonExtra + ", payExtraBedNum=" + payExtraBedNum + ", payExtraBedPrice="
				+ payExtraBedPrice + ", payPoolPeopleNum=" + payPoolPeopleNum + ", payPoolUseDate=" + payPoolUseDate
				+ ", payRestPeopleNum=" + payRestPeopleNum + ", payRestUseDate=" + payRestUseDate + ", payRestMealType="
				+ payRestMealType + "]";
	}
	  
	  
}	