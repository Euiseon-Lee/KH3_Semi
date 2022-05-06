package semi.beans;

import java.sql.Date;

public class PrivatePoolPayDto {
	
	 private int pool_no; // 개인풀 방 번호 
	 private int pool_order_no; // 주문번호
	 private long pay_poolprice; // 개인풀 이용금액
	 private Date pay_poolusedate; // 개인풀 이용날짜
	 
	public int getRest_tapool_no() {
		return pool_no;
	}
	public void setRest_tapool_no(int pool_no) {
		this.pool_no = pool_no;
	}
	public int getPool_order_no() {
		return pool_order_no;
	}
	public void setPool_order_no(int pool_order_no) {
		this.pool_order_no = pool_order_no;
	}
	public long getPay_poolprice() {
		return pay_poolprice;
	}
	public void setPay_poolprice(long pay_poolprice) {
		this.pay_poolprice = pay_poolprice;
	}
	public Date getPay_poolusedate() {
		return pay_poolusedate;
	}
	public void setPay_poolusedate(Date pay_poolusedate) {
		this.pay_poolusedate = pay_poolusedate;
	}
	
	@Override
	public String toString() {
		return "PrivatePoolPayDto [pool_no=" + pool_no + ", pool_order_no=" + pool_order_no
				+ ", pay_poolprice=" + pay_poolprice + ", pay_poolusedate=" + pay_poolusedate + "]";
	}

}
