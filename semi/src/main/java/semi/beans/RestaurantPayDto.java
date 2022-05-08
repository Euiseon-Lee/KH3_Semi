package semi.beans;

import java.sql.Date;

public class RestaurantPayDto {
	
	 private int restTableno; // 레스토랑 테이블 번호 
	 private int restOrderNo; // 주문번호
	 private int payRestpeoplenum; // 레스토랑 테이블 이용인원
	 private String payRestmealtype; // 레스토랑 식사유형
	 private long payRestmealprice; // 레스토랑 식사금액
	 private Date payRestusedate; // 레스토랑 이용날짜 
	 
	public int getRestTableno() {
		return restTableno;
	}
	public void setRestTableno(int restTableno) {
		this.restTableno = restTableno;
	}
	public int getRestOrderNo() {
		return restOrderNo;
	}
	public void setRestOrderNo(int restOrderNo) {
		this.restOrderNo = restOrderNo;
	}
	public int getPayRestpeoplenum() {
		return payRestpeoplenum;
	}
	public void setPayRestpeoplenum(int payRestpeoplenum) {
		this.payRestpeoplenum = payRestpeoplenum;
	}
	public String getPayRestmealtype() {
		return payRestmealtype;
	}
	public void setPayRestmealtype(String payRestmealtype) {
		this.payRestmealtype = payRestmealtype;
	}
	public long getPayRestmealprice() {
		return payRestmealprice;
	}
	public void setPayRestmealprice(long payRestmealprice) {
		this.payRestmealprice = payRestmealprice;
	}
	public Date getPayRestusedate() {
		return payRestusedate;
	}
	public void setPayRestusedate(Date payRestusedate) {
		this.payRestusedate = payRestusedate;
	}
	
	@Override
	public String toString() {
		return "RestaurantPayDto [restTableno=" + restTableno + ", restOrderNo=" + restOrderNo + ", payRestpeoplenum="
				+ payRestpeoplenum + ", payRestmealtype=" + payRestmealtype + ", payRestmealprice=" + payRestmealprice
				+ ", payRestusedate=" + payRestusedate + "]";
	}
	
	 
 
}
