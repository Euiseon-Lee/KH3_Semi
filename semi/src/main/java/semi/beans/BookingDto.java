package semi.beans;

import java.sql.Date;

public class BookingDto {
	
	//17개
	private	int BookingOrderNo; // 주문번호
	private int BookingRoomNo; // 객실번호
	private String BookingMemberId; // 아이디
	private	int	BookingPeopleNum; // 인원
	private String BookingRoomType; // 객실타입
	private String BookingBedType; // 침대타입
	private Date BookingCheckIn; // 체크인
	private Date BookingCheckOut; // 체크아웃
	private long BookingRoomRates; // 객실기본요금
	private long BookingSeasonExtra; // 객실시즌추가요금
	private int BookingExtrabedNum; // 침대추가개수
	private long BookingExtraBedPrice; // 침대추가요금
	private int BookingPoolPeopleNum; // 개인풀 이용인원
	private Date BookingPoolUseDate;  // 개인풀 이용날짜
	private int BookingRestPeopleNum; // 레스토랑이용인원
	private Date BookingRestUseDate; // 레스토랑이용날짜
	private String BookingRestMealType; // 레스토랑식사유형
	
	
	public BookingDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	/**
	 * @return the bookingOrderNo
	 */
	public int getBookingOrderNo() {
		return BookingOrderNo;
	}
	/**
	 * @param bookingOrderNo the bookingOrderNo to set
	 */
	public void setBookingOrderNo(int bookingOrderNo) {
		BookingOrderNo = bookingOrderNo;
	}
	/**
	 * @return the bookingRoomNo
	 */
	public int getBookingRoomNo() {
		return BookingRoomNo;
	}
	/**
	 * @param bookingRoomNo the bookingRoomNo to set
	 */
	public void setBookingRoomNo(int bookingRoomNo) {
		BookingRoomNo = bookingRoomNo;
	}
	/**
	 * @return the bookingMemberId
	 */
	public String getBookingMemberId() {
		return BookingMemberId;
	}
	/**
	 * @param bookingMemberId the bookingMemberId to set
	 */
	public void setBookingMemberId(String bookingMemberId) {
		BookingMemberId = bookingMemberId;
	}
	/**
	 * @return the bookingPeopleNum
	 */
	public int getBookingPeopleNum() {
		return BookingPeopleNum;
	}
	/**
	 * @param bookingPeopleNum the bookingPeopleNum to set
	 */
	public void setBookingPeopleNum(int bookingPeopleNum) {
		BookingPeopleNum = bookingPeopleNum;
	}
	/**
	 * @return the bookingRoomType
	 */
	public String getBookingRoomType() {
		return BookingRoomType;
	}
	/**
	 * @param bookingRoomType the bookingRoomType to set
	 */
	public void setBookingRoomType(String bookingRoomType) {
		BookingRoomType = bookingRoomType;
	}
	/**
	 * @return the bookingBedType
	 */
	public String getBookingBedType() {
		return BookingBedType;
	}
	/**
	 * @param bookingBedType the bookingBedType to set
	 */
	public void setBookingBedType(String bookingBedType) {
		BookingBedType = bookingBedType;
	}
	/**
	 * @return the bookingCheckIn
	 */
	public Date getBookingCheckIn() {
		return BookingCheckIn;
	}
	/**
	 * @param bookingCheckIn the bookingCheckIn to set
	 */
	public void setBookingCheckIn(Date bookingCheckIn) {
		BookingCheckIn = bookingCheckIn;
	}
	/**
	 * @return the bookingCheckOut
	 */
	public Date getBookingCheckOut() {
		return BookingCheckOut;
	}
	/**
	 * @param bookingCheckOut the bookingCheckOut to set
	 */
	public void setBookingCheckOut(Date bookingCheckOut) {
		BookingCheckOut = bookingCheckOut;
	}
	/**
	 * @return the bookingRoomRates
	 */
	public long getBookingRoomRates() {
		return BookingRoomRates;
	}
	/**
	 * @param bookingRoomRates the bookingRoomRates to set
	 */
	public void setBookingRoomRates(long bookingRoomRates) {
		BookingRoomRates = bookingRoomRates;
	}
	/**
	 * @return the bookingSeasonExtra
	 */
	public long getBookingSeasonExtra() {
		return BookingSeasonExtra;
	}
	/**
	 * @param bookingSeasonExtra the bookingSeasonExtra to set
	 */
	public void setBookingSeasonExtra(long bookingSeasonExtra) {
		BookingSeasonExtra = bookingSeasonExtra;
	}
	/**
	 * @return the bookingExtrabedNum
	 */
	public int getBookingExtrabedNum() {
		return BookingExtrabedNum;
	}
	/**
	 * @param bookingExtrabedNum the bookingExtrabedNum to set
	 */
	public void setBookingExtrabedNum(int bookingExtrabedNum) {
		BookingExtrabedNum = bookingExtrabedNum;
	}
	/**
	 * @return the bookingExtraBedPrice
	 */
	public long getBookingExtraBedPrice() {
		return BookingExtraBedPrice;
	}
	/**
	 * @param bookingExtraBedPrice the bookingExtraBedPrice to set
	 */
	public void setBookingExtraBedPrice(long bookingExtraBedPrice) {
		BookingExtraBedPrice = bookingExtraBedPrice;
	}
	/**
	 * @return the bookingPoolPeopleNum
	 */
	public int getBookingPoolPeopleNum() {
		return BookingPoolPeopleNum;
	}
	/**
	 * @param bookingPoolPeopleNum the bookingPoolPeopleNum to set
	 */
	public void setBookingPoolPeopleNum(int bookingPoolPeopleNum) {
		BookingPoolPeopleNum = bookingPoolPeopleNum;
	}
	/**
	 * @return the bookingPoolUseDate
	 */
	public Date getBookingPoolUseDate() {
		return BookingPoolUseDate;
	}
	/**
	 * @param bookingPoolUseDate the bookingPoolUseDate to set
	 */
	public void setBookingPoolUseDate(Date bookingPoolUseDate) {
		BookingPoolUseDate = bookingPoolUseDate;
	}
	/**
	 * @return the bookingRestPeopleNum
	 */
	public int getBookingRestPeopleNum() {
		return BookingRestPeopleNum;
	}
	/**
	 * @param bookingRestPeopleNum the bookingRestPeopleNum to set
	 */
	public void setBookingRestPeopleNum(int bookingRestPeopleNum) {
		BookingRestPeopleNum = bookingRestPeopleNum;
	}
	/**
	 * @return the bookingRestUseDate
	 */
	public Date getBookingRestUseDate() {
		return BookingRestUseDate;
	}
	/**
	 * @param bookingRestUseDate the bookingRestUseDate to set
	 */
	public void setBookingRestUseDate(Date bookingRestUseDate) {
		BookingRestUseDate = bookingRestUseDate;
	}
	/**
	 * @return the bookingRestMealType
	 */
	public String getBookingRestMealType() {
		return BookingRestMealType;
	}
	/**
	 * @param bookingRestMealType the bookingRestMealType to set
	 */
	public void setBookingRestMealType(String bookingRestMealType) {
		BookingRestMealType = bookingRestMealType;
	}


	@Override
	public String toString() {
		return "BookingDto [BookingOrderNo=" + BookingOrderNo + ", BookingRoomNo=" + BookingRoomNo
				+ ", BookingMemberId=" + BookingMemberId + ", BookingPeopleNum=" + BookingPeopleNum
				+ ", BookingRoomType=" + BookingRoomType + ", BookingBedType=" + BookingBedType + ", BookingCheckIn="
				+ BookingCheckIn + ", BookingCheckOut=" + BookingCheckOut + ", BookingRoomRates=" + BookingRoomRates
				+ ", BookingSeasonExtra=" + BookingSeasonExtra + ", BookingExtrabedNum=" + BookingExtrabedNum
				+ ", BookingExtraBedPrice=" + BookingExtraBedPrice + ", BookingPoolPeopleNum=" + BookingPoolPeopleNum
				+ ", BookingPoolUseDate=" + BookingPoolUseDate + ", BookingRestPeopleNum=" + BookingRestPeopleNum
				+ ", BookingRestUseDate=" + BookingRestUseDate + ", BookingRestMealType=" + BookingRestMealType + "]";
	}
	
	
	
}