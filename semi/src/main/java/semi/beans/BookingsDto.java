package semi.beans;

import java.util.Date;

public class BookingsDto {
	private int bookingOrderNo;
	private String bookingMemberId;
	private int bookingRoomNo;
	private String bookingRoomType;
	private String bookingCheckin;
	private String bookingCheckout;
	private String bookingDate;
	private int bookingPeople;
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
	public String getBookingRoomType() {
		return bookingRoomType;
	}
	public void setBookingRoomType(String bookingRoomType) {
		this.bookingRoomType = bookingRoomType;
	}
	public String getBookingCheckin() {
		return bookingCheckin;
	}
	public void setBookingCheckin(String bookingCheckin) {
		this.bookingCheckin = bookingCheckin;
	}
	public String getBookingCheckout() {
		return bookingCheckout;
	}
	public void setBookingCheckout(String bookingCheckout) {
		this.bookingCheckout = bookingCheckout;
	}
	public String getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}
	public int getBookingPeople() {
		return bookingPeople;
	}
	public void setBookingPeople(int bookingPeople) {
		this.bookingPeople = bookingPeople;
	}
	public BookingsDto() {
		super();
	}



}