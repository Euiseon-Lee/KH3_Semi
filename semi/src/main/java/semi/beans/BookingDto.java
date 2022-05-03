package semi.beans;

import java.sql.Date;

public class BookingDto {

	private int booking_room_no;
	private String booking_member_id;
	private	int	booking_peoplenum;
	private String booking_roomtype;
	private String booking_bedtype;
	private Date booking_checkin;
	private Date booking_checkout;
	private long booking_roomates;
	private long booking_seasonextra;
	private int booking_extrabednum;
	private long booking_extrabedprice;
	private int booking_poolpeoplenum;
	private Date booking_poolusedate; 
	private int booking_restpeoplenum; 
	private Date booking_restusedate;
	private String booking_restmealtype; 
	private String booking_name;
	
	public int getBooking_room_no() {
		return booking_room_no;
	}
	
	public void setBooking_room_no(int booking_room_no) {
		this.booking_room_no = booking_room_no;
	}
	
	public String getBooking_member_id() {
		return booking_member_id;
	}
	
	public void setBooking_member_id(String booking_member_id) {
		this.booking_member_id = booking_member_id;
	}
	
	public int getBooking_peoplenum() {
		return booking_peoplenum;
	}
	
	public void setBooking_peoplenum(int booking_peoplenum) {
		this.booking_peoplenum = booking_peoplenum;
	}
	
	public String getBooking_roomtype() {
		return booking_roomtype;
	}
	
	public void setBooking_roomtype(String booking_roomtype) {
		this.booking_roomtype = booking_roomtype;
	}
	
	public String getBooking_bedtype() {
		return booking_bedtype;
	}
	
	public void setBooking_bedtype(String booking_bedtype) {
		this.booking_bedtype = booking_bedtype;
	}
	
	public Date getBooking_checkin() {
		return booking_checkin;
	}
	
	public void setBooking_checkin(Date booking_checkin) {
		this.booking_checkin = booking_checkin;
	}
	
	public Date getBooking_checkout() {
		return booking_checkout;
	}

	public void setBooking_checkout(Date booking_checkout) {
		this.booking_checkout = booking_checkout;
	}
	
	public long getBooking_roomates() {
		return booking_roomates;
	}
	
	public void setBooking_roomates(long booking_roomates) {
		this.booking_roomates = booking_roomates;
	}
	
	public long getBooking_seasonextra() {
		return booking_seasonextra;
	}
	
	public void setBooking_seasonextra(long booking_seasonextra) {
		this.booking_seasonextra = booking_seasonextra;
	}
	
	public int getBooking_extrabednum() {
		return booking_extrabednum;
	}
	
	public void setBooking_extrabednum(int booking_extrabednum) {
		this.booking_extrabednum = booking_extrabednum;
	}
	
	public long getBooking_extrabedprice() {
		return booking_extrabedprice;
	}
	
	public void setBooking_extrabedprice(long booking_extrabedprice) {
		this.booking_extrabedprice = booking_extrabedprice;
	}
	
	public int getBooking_poolpeoplenum() {
		return booking_poolpeoplenum;
	}
	
	public void setBooking_poolpeoplenum(int booking_poolpeoplenum) {
		this.booking_poolpeoplenum = booking_poolpeoplenum;
	}
	
	public Date getBooking_poolusedate() {
		return booking_poolusedate;
	}
	
	public void setBooking_poolusedate(Date booking_poolusedate) {
		this.booking_poolusedate = booking_poolusedate;
	}
	
	public int getBooking_restpeoplenum() {
		return booking_restpeoplenum;
	}
	
	public void setBooking_restpeoplenum(int booking_restpeoplenum) {
		this.booking_restpeoplenum = booking_restpeoplenum;
	}
	
	public Date getBooking_restusedate() {
		return booking_restusedate;
	}
	
	public void setBooking_restusedate(Date booking_restusedate) {
		this.booking_restusedate = booking_restusedate;
	}
	
	public String getBooking_restmealtype() {
		return booking_restmealtype;
	}
	
	public void setBooking_restmealtype(String booking_restmealtype) {
		this.booking_restmealtype = booking_restmealtype;
	}
	
	public String getBooking_name() {
		return booking_name;
	}
	
	public void setBooking_name(String booking_name) {
		this.booking_name = booking_name;
	}

	@Override
	public String toString() {
		return "BookingDto [booking_room_no=" + booking_room_no + ", booking_member_id=" + booking_member_id
				+ ", booking_peoplenum=" + booking_peoplenum + ", booking_roomtype=" + booking_roomtype
				+ ", booking_bedtype=" + booking_bedtype + ", booking_checkin=" + booking_checkin
				+ ", booking_checkout=" + booking_checkout + ", booking_roomates=" + booking_roomates
				+ ", booking_seasonextra=" + booking_seasonextra + ", booking_extrabednum=" + booking_extrabednum
				+ ", booking_extrabedprice=" + booking_extrabedprice + ", booking_poolpeoplenum="
				+ booking_poolpeoplenum + ", booking_poolusedate=" + booking_poolusedate + ", booking_restpeoplenum="
				+ booking_restpeoplenum + ", booking_restusedate=" + booking_restusedate + ", booking_restmealtype="
				+ booking_restmealtype + ", booking_name=" + booking_name + "]";
	}

	public BookingDto(int booking_room_no, String booking_member_id, int booking_peoplenum, String booking_roomtype,
			String booking_bedtype, Date booking_checkin, Date booking_checkout, long booking_roomates,
			long booking_seasonextra, int booking_extrabednum, long booking_extrabedprice, int booking_poolpeoplenum,
			Date booking_poolusedate, int booking_restpeoplenum, Date booking_restusedate, String booking_restmealtype,
			String booking_name) {
		super();
		this.booking_room_no = booking_room_no;
		this.booking_member_id = booking_member_id;
		this.booking_peoplenum = booking_peoplenum;
		this.booking_roomtype = booking_roomtype;
		this.booking_bedtype = booking_bedtype;
		this.booking_checkin = booking_checkin;
		this.booking_checkout = booking_checkout;
		this.booking_roomates = booking_roomates;
		this.booking_seasonextra = booking_seasonextra;
		this.booking_extrabednum = booking_extrabednum;
		this.booking_extrabedprice = booking_extrabedprice;
		this.booking_poolpeoplenum = booking_poolpeoplenum;
		this.booking_poolusedate = booking_poolusedate;
		this.booking_restpeoplenum = booking_restpeoplenum;
		this.booking_restusedate = booking_restusedate;
		this.booking_restmealtype = booking_restmealtype;
		this.booking_name = booking_name;
	} 
	
	
}
