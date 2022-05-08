package semi.beans;

import java.sql.Date;

public class PrivatePoolPayDto {
	
	 private int poolNo; // 개인풀 방 번호 
	 private int poolOrderNo; // 주문번호
	 private long payPoolprice; // 개인풀 이용금액
	 private Date payPoolusedate; // 개인풀 이용날짜
	 
	public int getPoolNo() {
		return poolNo;
	}
	public void setPoolNo(int poolNo) {
		this.poolNo = poolNo;
	}
	public int getPoolOrderNo() {
		return poolOrderNo;
	}
	public void setPoolOrderNo(int poolOrderNo) {
		this.poolOrderNo = poolOrderNo;
	}
	public long getPayPoolprice() {
		return payPoolprice;
	}
	public void setPayPoolprice(long payPoolprice) {
		this.payPoolprice = payPoolprice;
	}
	public Date getPayPoolusedate() {
		return payPoolusedate;
	}
	public void setPayPoolusedate(Date payPoolusedate) {
		this.payPoolusedate = payPoolusedate;
	}
	
	@Override
	public String toString() {
		return "PrivatePoolPayDto [poolNo=" + poolNo + ", poolOrderNo=" + poolOrderNo + ", payPoolprice=" + payPoolprice
				+ ", payPoolusedate=" + payPoolusedate + "]";
	}
	 
	 
	 
}