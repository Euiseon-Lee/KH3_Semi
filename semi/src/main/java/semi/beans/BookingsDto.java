package semi.beans;

import java.util.Date;

public class BookingsDto {
	private int bookingOrderNo;
	private String bookingMemberId;
	private int bookingRoomNo;
	private int bookingRoomType;
	private Date bookingCheckin;
	private Date bookingCheckout;
	private Date bookingDate;
	public int getBookingOrderNo() {
		return bookingOrderNo;
	}
	public void setBookingOrderNo(int bookingOrderNo) {
		this.bookingOrderNo = bookingOrderNo;
	}
	public String getBookingMemberId() {
		return bookingMemberId;
	}
	public void setBookingMemberId(String bookingMemberId) {
		this.bookingMemberId = bookingMemberId;
	}
	public int getBookingRoomNo() {
		return bookingRoomNo;
	}
	public void setBookingRoomNo(int bookingRoomNo) {
		this.bookingRoomNo = bookingRoomNo;
	}
	public int getBookingRoomType() {
		return bookingRoomType;
	}
	public void setBookingRoomType(int bookingRoomType) {
		this.bookingRoomType = bookingRoomType;
	}
	public Date getBookingCheckin() {
		return bookingCheckin;
	}
	public void setBookingCheckin(Date bookingCheckin) {
		this.bookingCheckin = bookingCheckin;
	}
	public Date getBookingCheckout() {
		return bookingCheckout;
	}
	public void setBookingCheckout(Date bookingCheckout) {
		this.bookingCheckout = bookingCheckout;
	}
	public Date getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}
	public BookingsDto() {
		super();
	}
	
}
