package semi.beans;

import java.sql.Date;

public class BookingDto {
	
	//17개
	private	int booking_order_no; // 주문번호
	private int booking_room_no; // 객실번호
	private String booking_member_id; // 아이디
	private	int	booking_peoplenum; // 인원
	private String booking_roomtype; // 객실타입
	private String booking_bedtype; // 침대타입
	private Date booking_checkin; // 체크인
	private Date booking_checkout; // 체크아웃
	private long booking_roomrates; // 객실기본요금
	private long booking_seasonextra; // 객실시즌추가요금
	private int booking_extrabednum; // 침대추가개수
	private long booking_extrabedprice; // 침대추가요금
	private int booking_poolpeoplenum; // 개인풀 이용인원
	private Date booking_poolusedate;  // 개인풀 이용날짜
	private int booking_restpeoplenum; // 레스토랑이용인원
	private Date booking_restusedate; // 레스토랑이용날짜
	private String booking_restmealtype; // 레스토랑식사유형
	/**
	 * @return the booking_order_no
	 */
	public int getBooking_order_no() {
		return booking_order_no;
	}
	/**
	 * @param booking_order_no the booking_order_no to set
	 */
	public void setBooking_order_no(int booking_order_no) {
		this.booking_order_no = booking_order_no;
	}
	/**
	 * @return the booking_room_no
	 */
	public int getBooking_room_no() {
		return booking_room_no;
	}
	/**
	 * @param booking_room_no the booking_room_no to set
	 */
	public void setBooking_room_no(int booking_room_no) {
		this.booking_room_no = booking_room_no;
	}
	/**
	 * @return the booking_member_id
	 */
	public String getBooking_member_id() {
		return booking_member_id;
	}
	/**
	 * @param booking_member_id the booking_member_id to set
	 */
	public void setBooking_member_id(String booking_member_id) {
		this.booking_member_id = booking_member_id;
	}
	/**
	 * @return the booking_peoplenum
	 */
	public int getBooking_peoplenum() {
		return booking_peoplenum;
	}
	/**
	 * @param booking_peoplenum the booking_peoplenum to set
	 */
	public void setBooking_peoplenum(int booking_peoplenum) {
		this.booking_peoplenum = booking_peoplenum;
	}
	/**
	 * @return the booking_roomtype
	 */
	public String getBooking_roomtype() {
		return booking_roomtype;
	}
	/**
	 * @param booking_roomtype the booking_roomtype to set
	 */
	public void setBooking_roomtype(String booking_roomtype) {
		this.booking_roomtype = booking_roomtype;
	}
	/**
	 * @return the booking_bedtype
	 */
	public String getBooking_bedtype() {
		return booking_bedtype;
	}
	/**
	 * @param booking_bedtype the booking_bedtype to set
	 */
	public void setBooking_bedtype(String booking_bedtype) {
		this.booking_bedtype = booking_bedtype;
	}
	/**
	 * @return the booking_checkin
	 */
	public Date getBooking_checkin() {
		return booking_checkin;
	}
	/**
	 * @param booking_checkin the booking_checkin to set
	 */
	public void setBooking_checkin(Date booking_checkin) {
		this.booking_checkin = booking_checkin;
	}
	/**
	 * @return the booking_checkout
	 */
	public Date getBooking_checkout() {
		return booking_checkout;
	}
	/**
	 * @param booking_checkout the booking_checkout to set
	 */
	public void setBooking_checkout(Date booking_checkout) {
		this.booking_checkout = booking_checkout;
	}
	/**
	 * @return the booking_roomrates
	 */
	public long getBooking_roomrates() {
		return booking_roomrates;
	}
	/**
	 * @param booking_roomrates the booking_roomrates to set
	 */
	public void setBooking_roomrates(long booking_roomrates) {
		this.booking_roomrates = booking_roomrates;
	}
	/**
	 * @return the booking_seasonextra
	 */
	public long getBooking_seasonextra() {
		return booking_seasonextra;
	}
	/**
	 * @param booking_seasonextra the booking_seasonextra to set
	 */
	public void setBooking_seasonextra(long booking_seasonextra) {
		this.booking_seasonextra = booking_seasonextra;
	}
	/**
	 * @return the booking_extrabednum
	 */
	public int getBooking_extrabednum() {
		return booking_extrabednum;
	}
	/**
	 * @param booking_extrabednum the booking_extrabednum to set
	 */
	public void setBooking_extrabednum(int booking_extrabednum) {
		this.booking_extrabednum = booking_extrabednum;
	}
	/**
	 * @return the booking_extrabedprice
	 */
	public long getBooking_extrabedprice() {
		return booking_extrabedprice;
	}
	/**
	 * @param booking_extrabedprice the booking_extrabedprice to set
	 */
	public void setBooking_extrabedprice(long booking_extrabedprice) {
		this.booking_extrabedprice = booking_extrabedprice;
	}
	/**
	 * @return the booking_poolpeoplenum
	 */
	public int getBooking_poolpeoplenum() {
		return booking_poolpeoplenum;
	}
	/**
	 * @param booking_poolpeoplenum the booking_poolpeoplenum to set
	 */
	public void setBooking_poolpeoplenum(int booking_poolpeoplenum) {
		this.booking_poolpeoplenum = booking_poolpeoplenum;
	}
	/**
	 * @return the booking_poolusedate
	 */
	public Date getBooking_poolusedate() {
		return booking_poolusedate;
	}
	/**
	 * @param booking_poolusedate the booking_poolusedate to set
	 */
	public void setBooking_poolusedate(Date booking_poolusedate) {
		this.booking_poolusedate = booking_poolusedate;
	}
	/**
	 * @return the booking_restpeoplenum
	 */
	public int getBooking_restpeoplenum() {
		return booking_restpeoplenum;
	}
	/**
	 * @param booking_restpeoplenum the booking_restpeoplenum to set
	 */
	public void setBooking_restpeoplenum(int booking_restpeoplenum) {
		this.booking_restpeoplenum = booking_restpeoplenum;
	}
	/**
	 * @return the booking_restusedate
	 */
	public Date getBooking_restusedate() {
		return booking_restusedate;
	}
	/**
	 * @param booking_restusedate the booking_restusedate to set
	 */
	public void setBooking_restusedate(Date booking_restusedate) {
		this.booking_restusedate = booking_restusedate;
	}
	/**
	 * @return the booking_restmealtype
	 */
	public String getBooking_restmealtype() {
		return booking_restmealtype;
	}
	/**
	 * @param booking_restmealtype the booking_restmealtype to set
	 */
	public void setBooking_restmealtype(String booking_restmealtype) {
		this.booking_restmealtype = booking_restmealtype;
	}
	@Override
	public String toString() {
		return "BookingDto [booking_order_no=" + booking_order_no + ", booking_room_no=" + booking_room_no
				+ ", booking_member_id=" + booking_member_id + ", booking_peoplenum=" + booking_peoplenum
				+ ", booking_roomtype=" + booking_roomtype + ", booking_bedtype=" + booking_bedtype
				+ ", booking_checkin=" + booking_checkin + ", booking_checkout=" + booking_checkout
				+ ", booking_roomrates=" + booking_roomrates + ", booking_seasonextra=" + booking_seasonextra
				+ ", booking_extrabednum=" + booking_extrabednum + ", booking_extrabedprice=" + booking_extrabedprice
				+ ", booking_poolpeoplenum=" + booking_poolpeoplenum + ", booking_poolusedate=" + booking_poolusedate
				+ ", booking_restpeoplenum=" + booking_restpeoplenum + ", booking_restusedate=" + booking_restusedate
				+ ", booking_restmealtype=" + booking_restmealtype + "]";
	}
	public BookingDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
}