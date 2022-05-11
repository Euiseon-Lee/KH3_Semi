package semi.beans;

import java.sql.Date;

public class BookingDto {
	
	//8개
	private	int bookingOrderNo; // 주문번호 int
	private String bookingMemberId; // 아이디 string
	private int bookingRoomNo;  // 객실번호 int 
	private int bookingPeopleNum; // 인원 int 
	private String bookingRoomType; // 객실타입 string
	private Date bookingCheckIn; // 체크인 date
	private Date bookingCheckOut; // 체크아웃 date
	private Date bookingDate; // 예약완료 날짜 date
	
	public BookingDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "BookingDto [bookingOrderNo=" + bookingOrderNo + ", bookingMemberId=" + bookingMemberId
				+ ", bookingRoomNo=" + bookingRoomNo + ", bookingPeopleNum=" + bookingPeopleNum + ", bookingRoomType="
				+ bookingRoomType + ", bookingCheckIn=" + bookingCheckIn + ", bookingCheckOut=" + bookingCheckOut
				+ ", bookingDate=" + bookingDate + "]";
	}

	/**
	 * @return the bookingOrderNo
	 */
	public int getBookingOrderNo() {
		return bookingOrderNo;
	}

	/**
	 * @param bookingOrderNo the bookingOrderNo to set
	 */
	public void setBookingOrderNo(int bookingOrderNo) {
		this.bookingOrderNo = bookingOrderNo;
	}

	/**
	 * @return the bookingMemberId
	 */
	public String getBookingMemberId() {
		return bookingMemberId;
	}

	/**
	 * @param bookingMemberId the bookingMemberId to set
	 */
	public void setBookingMemberId(String bookingMemberId) {
		this.bookingMemberId = bookingMemberId;
	}

	/**
	 * @return the bookingRoomNo
	 */
	public int getBookingRoomNo() {
		return bookingRoomNo;
	}

	/**
	 * @param bookingRoomNo the bookingRoomNo to set
	 */
	public void setBookingRoomNo(int bookingRoomNo) {
		this.bookingRoomNo = bookingRoomNo;
	}

	/**
	 * @return the bookingPeopleNum
	 */
	public int getBookingPeopleNum() {
		return bookingPeopleNum;
	}

	/**
	 * @param bookingPeopleNum the bookingPeopleNum to set
	 */
	public void setBookingPeopleNum(int bookingPeopleNum) {
		this.bookingPeopleNum = bookingPeopleNum;
	}

	/**
	 * @return the bookingRoomType
	 */
	public String getBookingRoomType() {
		return bookingRoomType;
	}

	/**
	 * @param bookingRoomType the bookingRoomType to set
	 */
	public void setBookingRoomType(String bookingRoomType) {
		this.bookingRoomType = bookingRoomType;
	}

	/**
	 * @return the bookingCheckIn
	 */
	public Date getBookingCheckIn() {
		return bookingCheckIn;
	}

	/**
	 * @param bookingCheckIn the bookingCheckIn to set
	 */
	public void setBookingCheckIn(Date bookingCheckIn) {
		this.bookingCheckIn = bookingCheckIn;
	}

	/**
	 * @return the bookingCheckOut
	 */
	public Date getBookingCheckOut() {
		return bookingCheckOut;
	}

	/**
	 * @param bookingCheckOut the bookingCheckOut to set
	 */
	public void setBookingCheckOut(Date bookingCheckOut) {
		this.bookingCheckOut = bookingCheckOut;
	}

	/**
	 * @return the bookingDate
	 */
	public Date getBookingDate() {
		return bookingDate;
	}

	/**
	 * @param bookingDate the bookingDate to set
	 */
	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}
}