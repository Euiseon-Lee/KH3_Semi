package semi.beans;

import java.sql.Date;

public class RestaurantPayDto {
	
	 private int rest_tableno; // 레스토랑 테이블 번호 
	 private int rest_order_no; // 주문번호
	 private int pay_restpeoplenum; // 레스토랑 테이블 이용인원
	 private String pay_restmealtype; // 레스토랑 식사유형
	 private long pay_restmealprice; // 레스토랑 식사금액
	 private Date pay_restusedate; // 레스토랑 이용날짜 
	
	public int getRest_tableno() {
		return rest_tableno;
	}
	public void setRest_tableno(int rest_tableno) {
		this.rest_tableno = rest_tableno;
	}
	public int getRest_order_no() {
		return rest_order_no;
	}
	public void setRest_order_no(int rest_order_no) {
		this.rest_order_no = rest_order_no;
	}
	public int getPay_restpeoplenum() {
		return pay_restpeoplenum;
	}
	public void setPay_restpeoplenum(int pay_restpeoplenum) {
		this.pay_restpeoplenum = pay_restpeoplenum;
	}
	public String getPay_restmealtype() {
		return pay_restmealtype;
	}
	public void setPay_restmealtype(String pay_restmealtype) {
		this.pay_restmealtype = pay_restmealtype;
	}
	public long getPay_restmealprice() {
		return pay_restmealprice;
	}
	public void setPay_restmealprice(long pay_restmealprice) {
		this.pay_restmealprice = pay_restmealprice;
	}
	public Date getPay_restusedate() {
		return pay_restusedate;
	}
	public void setPay_restusedate(Date pay_restusedate) {
		this.pay_restusedate = pay_restusedate;
	}
	
	@Override
	public String toString() {
		return "RestaurantPayDto [rest_tableno=" + rest_tableno + ", rest_order_no=" + rest_order_no
				+ ", pay_restpeoplenum=" + pay_restpeoplenum + ", pay_restmealtype=" + pay_restmealtype
				+ ", pay_restmealprice=" + pay_restmealprice + ", pay_restusedate=" + pay_restusedate + "]";
	}

	 
}
