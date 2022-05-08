package semi.beans;

import java.sql.Date;

public class BookingDto {
	
	//17개
	private	int bookingOrderNo; // 주문번호
	private int bookingRoomNo; // 객실번호
	private String bookingMemberId; // 아이디
	private	int	bookingPeopleNum; // 인원
	private String bookingRoomType; // 객실타입
	private String bookingBedType; // 침대타입
	private Date bookingCheckIn; // 체크인
	private Date bookingCheckOut; // 체크아웃
	private long bookingRoomRates; // 객실기본요금
	private long bookingSeasonExtra; // 객실시즌추가요금
	private int bookingExtrabedNum; // 침대추가개수
	private long bookingExtraBedPrice; // 침대추가요금
	private int bookingPoolPeopleNum; // 개인풀 이용인원
	private Date bookingPoolUseDate;  // 개인풀 이용날짜
	private int bookingRestPeopleNum; // 레스토랑이용인원
	private Date bookingRestUseDate; // 레스토랑이용날짜
	private String bookingRestMealType; // 레스토랑식사유형
	
	public BookingDto() {
		super();
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
	 * @return the bookingBedType
	 */
	public String getBookingBedType() {
		return bookingBedType;
	}

	/**
	 * @param bookingBedType the bookingBedType to set
	 */
	public void setBookingBedType(String bookingBedType) {
		this.bookingBedType = bookingBedType;
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
	 * @return the bookingRoomRates
	 */
	public long getBookingRoomRates() {
		return bookingRoomRates;
	}

	/**
	 * @param bookingRoomRates the bookingRoomRates to set
	 */
	public void setBookingRoomRates(long bookingRoomRates) {
		this.bookingRoomRates = bookingRoomRates;
	}

	/**
	 * @return the bookingSeasonExtra
	 */
	public long getBookingSeasonExtra() {
		return bookingSeasonExtra;
	}

	/**
	 * @param bookingSeasonExtra the bookingSeasonExtra to set
	 */
	public void setBookingSeasonExtra(long bookingSeasonExtra) {
		this.bookingSeasonExtra = bookingSeasonExtra;
	}

	/**
	 * @return the bookingExtrabedNum
	 */
	public int getBookingExtrabedNum() {
		return bookingExtrabedNum;
	}

	/**
	 * @param bookingExtrabedNum the bookingExtrabedNum to set
	 */
	public void setBookingExtrabedNum(int bookingExtrabedNum) {
		this.bookingExtrabedNum = bookingExtrabedNum;
	}

	/**
	 * @return the bookingExtraBedPrice
	 */
	public long getBookingExtraBedPrice() {
		return bookingExtraBedPrice;
	}

	/**
	 * @param bookingExtraBedPrice the bookingExtraBedPrice to set
	 */
	public void setBookingExtraBedPrice(long bookingExtraBedPrice) {
		this.bookingExtraBedPrice = bookingExtraBedPrice;
	}

	/**
	 * @return the bookingPoolPeopleNum
	 */
	public int getBookingPoolPeopleNum() {
		return bookingPoolPeopleNum;
	}

	/**
	 * @param bookingPoolPeopleNum the bookingPoolPeopleNum to set
	 */
	public void setBookingPoolPeopleNum(int bookingPoolPeopleNum) {
		this.bookingPoolPeopleNum = bookingPoolPeopleNum;
	}

	/**
	 * @return the bookingPoolUseDate
	 */
	public Date getBookingPoolUseDate() {
		return bookingPoolUseDate;
	}

	/**
	 * @param bookingPoolUseDate the bookingPoolUseDate to set
	 */
	public void setBookingPoolUseDate(Date bookingPoolUseDate) {
		this.bookingPoolUseDate = bookingPoolUseDate;
	}

	/**
	 * @return the bookingRestPeopleNum
	 */
	public int getBookingRestPeopleNum() {
		return bookingRestPeopleNum;
	}

	/**
	 * @param bookingRestPeopleNum the bookingRestPeopleNum to set
	 */
	public void setBookingRestPeopleNum(int bookingRestPeopleNum) {
		this.bookingRestPeopleNum = bookingRestPeopleNum;
	}

	/**
	 * @return the bookingRestUseDate
	 */
	public Date getBookingRestUseDate() {
		return bookingRestUseDate;
	}

	/**
	 * @param bookingRestUseDate the bookingRestUseDate to set
	 */
	public void setBookingRestUseDate(Date bookingRestUseDate) {
		this.bookingRestUseDate = bookingRestUseDate;
	}

	/**
	 * @return the bookingRestMealType
	 */
	public String getBookingRestMealType() {
		return bookingRestMealType;
	}

	/**
	 * @param bookingRestMealType the bookingRestMealType to set
	 */
	public void setBookingRestMealType(String bookingRestMealType) {
		this.bookingRestMealType = bookingRestMealType;
	}

	@Override
	public String toString() {
		return "BookingDto [bookingOrderNo=" + bookingOrderNo + ", bookingRoomNo=" + bookingRoomNo
				+ ", bookingMemberId=" + bookingMemberId + ", bookingPeopleNum=" + bookingPeopleNum
				+ ", bookingRoomType=" + bookingRoomType + ", bookingBedType=" + bookingBedType + ", bookingCheckIn="
				+ bookingCheckIn + ", bookingCheckOut=" + bookingCheckOut + ", bookingRoomRates=" + bookingRoomRates
				+ ", bookingSeasonExtra=" + bookingSeasonExtra + ", bookingExtrabedNum=" + bookingExtrabedNum
				+ ", bookingExtraBedPrice=" + bookingExtraBedPrice + ", bookingPoolPeopleNum=" + bookingPoolPeopleNum
				+ ", bookingPoolUseDate=" + bookingPoolUseDate + ", bookingRestPeopleNum=" + bookingRestPeopleNum
				+ ", bookingRestUseDate=" + bookingRestUseDate + ", bookingRestMealType=" + bookingRestMealType + "]";
	}
	
	
	

	
}