package semi.beans;

import java.sql.Date;

public class PayDto {
	  
	  private int payOrderNo; 		// 주문번호 
	  private String payMemberId; 	// 아이디
	  private int payRoomNo; 		// 객실번호
	  private int payPeople;	 	// 인원
	  private String payRoomtype; 	// 객실타입
	  private Date payCheckIn; 		// 체크인
	  private Date payCheckOut; 	// 체크아웃
	  private Date payDate;			// 결제완료된 날짜
	  private int payTotalPrice;	// 총 금액
	  
	  
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
	public int getPayPeople() {
		return payPeople;
	}
	public void setPayPeople(int payPeople) {
		this.payPeople = payPeople;
	}
	public String getPayRoomtype() {
		return payRoomtype;
	}
	public void setPayRoomtype(String payRoomtype) {
		this.payRoomtype = payRoomtype;
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
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public int getPayTotalPrice() {
		return payTotalPrice;
	}
	public void setPayTotalPrice(int payTotalPrice) {
		this.payTotalPrice = payTotalPrice;
	}

	  
	
}
	  
	