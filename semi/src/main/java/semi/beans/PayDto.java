package semi.beans;
  
import java.sql.Date;

public class PayDto {
	  
	  private int pay_order_no; // 주문번호 
	  private String pay_member_id; // 아이디
	  private int pay_room_no; // 객실번호
	  private int pay_peoplenum; // 인원
	  private String pay_roomtype; // 객실타입
	  private String pay_bedtype; // 침대타입
	  private Date pay_checkin; // 체크인
	  private Date pay_checkout; // 체크아웃
	  private long pay_roomates; // 객실기본요금
	  private long pay_seasonextra; // 객실시즌추가요금
	  private int pay_extrabednum; // 침대추가개수
	  private long pay_extrabedprice; // 침대추가요금
	  private int pay_poolpeoplenum; // 개인풀 이용인원
	  private Date pay_poolusedate;  // 개인풀 이용날짜
	  private int pay_restpeoplenum; // 레스토랑이용인원
	  private Date pay_restusedate; // 레스토랑이용날짜
	  private String pay_restmealtype; // 레스토랑식사유형	
	  
	public int getPay_order_no() {
		return pay_order_no;
	}
	public void setPay_order_no(int pay_order_no) {
		this.pay_order_no = pay_order_no;
	}
	public String getPay_member_id() {
		return pay_member_id;
	}
	public void setPay_member_id(String pay_member_id) {
		this.pay_member_id = pay_member_id;
	}
	public int getPay_room_no() {
		return pay_room_no;
	}
	public void setPay_room_no(int pay_room_no) {
		this.pay_room_no = pay_room_no;
	}
	public int getPay_peoplenum() {
		return pay_peoplenum;
	}
	public void setPay_peoplenum(int pay_peoplenum) {
		this.pay_peoplenum = pay_peoplenum;
	}
	public String getPay_roomtype() {
		return pay_roomtype;
	}
	public void setPay_roomtype(String pay_roomtype) {
		this.pay_roomtype = pay_roomtype;
	}
	public String getPay_bedtype() {
		return pay_bedtype;
	}
	public void setPay_bedtype(String pay_bedtype) {
		this.pay_bedtype = pay_bedtype;
	}
	public Date getPay_checkin() {
		return pay_checkin;
	}
	public void setPay_checkin(Date pay_checkin) {
		this.pay_checkin = pay_checkin;
	}
	public Date getPay_checkout() {
		return pay_checkout;
	}
	public void setPay_checkout(Date pay_checkout) {
		this.pay_checkout = pay_checkout;
	}
	public long getPay_roomates() {
		return pay_roomates;
	}
	public void setPay_roomates(long pay_roomates) {
		this.pay_roomates = pay_roomates;
	}
	public long getPay_seasonextra() {
		return pay_seasonextra;
	}
	public void setPay_seasonextra(long pay_seasonextra) {
		this.pay_seasonextra = pay_seasonextra;
	}
	public int getPay_extrabednum() {
		return pay_extrabednum;
	}
	public void setPay_extrabednum(int pay_extrabednum) {
		this.pay_extrabednum = pay_extrabednum;
	}
	public long getPay_extrabedprice() {
		return pay_extrabedprice;
	}
	public void setPay_extrabedprice(long pay_extrabedprice) {
		this.pay_extrabedprice = pay_extrabedprice;
	}
	public int getPay_poolpeoplenum() {
		return pay_poolpeoplenum;
	}
	public void setPay_poolpeoplenum(int pay_poolpeoplenum) {
		this.pay_poolpeoplenum = pay_poolpeoplenum;
	}
	public Date getPay_poolusedate() {
		return pay_poolusedate;
	}
	public void setPay_poolusedate(Date pay_poolusedate) {
		this.pay_poolusedate = pay_poolusedate;
	}
	public int getPay_restpeoplenum() {
		return pay_restpeoplenum;
	}
	public void setPay_restpeoplenum(int pay_restpeoplenum) {
		this.pay_restpeoplenum = pay_restpeoplenum;
	}
	public Date getPay_restusedate() {
		return pay_restusedate;
	}
	public void setPay_restusedate(Date pay_restusedate) {
		this.pay_restusedate = pay_restusedate;
	}
	public String getPay_restmealtype() {
		return pay_restmealtype;
	}
	public void setPay_restmealtype(String pay_restmealtype) {
		this.pay_restmealtype = pay_restmealtype;
	}
	
	@Override
	public String toString() {
		return "PayDto [pay_order_no=" + pay_order_no + ", pay_member_id=" + pay_member_id + ", pay_room_no="
				+ pay_room_no + ", pay_peoplenum=" + pay_peoplenum + ", pay_roomtype=" + pay_roomtype + ", pay_bedtype="
				+ pay_bedtype + ", pay_checkin=" + pay_checkin + ", pay_checkout=" + pay_checkout + ", pay_roomates="
				+ pay_roomates + ", pay_seasonextra=" + pay_seasonextra + ", pay_extrabednum=" + pay_extrabednum
				+ ", pay_extrabedprice=" + pay_extrabedprice + ", pay_poolpeoplenum=" + pay_poolpeoplenum
				+ ", pay_poolusedate=" + pay_poolusedate + ", pay_restpeoplenum=" + pay_restpeoplenum
				+ ", pay_restusedate=" + pay_restusedate + ", pay_restmealtype=" + pay_restmealtype + "]";
	}
}