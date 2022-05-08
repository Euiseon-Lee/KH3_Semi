package semi.beans;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookingDao {
	
	//일단 등록만 먼저 하고 시간 남으면 나머지 적용
	
	// 등록 Booking 
	public void add(BookingDto bookingDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into booking(BOOKING_ORDER_NO, BOOKING_ROOM_NO, BOOKING_MEMBER_ID,"
				+"BOOKING_PEOPLENUM, BOOKING_ROOMTYPE, BOOKING_BEDTYPE, BOOKING_CHECKIN, BOOKING_CHECKOUT"
				+"BOOKING_ROOMRATES, BOOKING_SEASONEXTRA, BOOKING_EXTRABEDNUM, BOOKING_EXTRABEDPRICE, BOOKING_POOLPEOPLENUM"
				+"BOOKING_POOLUSEDATE, BOOKING_RESTPEOPLENUM, BOOKING_RESTUSEDATE, BOOKING_RESTMEALTYPE)"
				+"values(booking_seq.nextval,?,?,?,?,?,to_date(?, 'YYYY-MM-DD'), to_date(?, 'YYYY-MM-DD'),?,?,?,?,?,to_date(?, 'YYYY-MM-DD'),?,to_date(?, 'YYYY-MM-DD'),?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, bookingDto.getBookingOrderNo());
		ps.setInt(2, bookingDto.getBookingRoomNo());
		ps.setString(3, bookingDto.getBookingMemberId());
		ps.setInt(4, bookingDto.getBookingPeopleNum());
		ps.setString(5, bookingDto.getBookingRoomType());
		ps.setString(6, bookingDto.getBookingBedType());
		ps.setDate(7, bookingDto.getBookingCheckIn());
		ps.setDate(8, bookingDto.getBookingCheckOut());
		ps.setLong(9, bookingDto.getBookingRoomRates());
		ps.setLong(10, bookingDto.getBookingSeasonExtra());
		ps.setInt(11, bookingDto.getBookingExtrabedNum());
		ps.setLong(12, bookingDto.getBookingExtraBedPrice());
		ps.setInt(13, bookingDto.getBookingPoolPeopleNum());
		ps.setDate(14, bookingDto.getBookingPoolUseDate());
		ps.setInt(15, bookingDto.getBookingRestPeopleNum());
		ps.setDate(16, bookingDto.getBookingRestUseDate());
		ps.setString(17, bookingDto.getBookingRestMealType());
		
		ps.execute();
	
		con.close();
	}
	
	// 수정 // 폐기 할 수 있음 
	public boolean edit(BookingDto bookingDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
	
		String sql = "update Booking" 
						+"set booking_peoplenum=?, booking_roomtype=?, booking_bedtype=?, booking_checkin=?, booking_checkout=?"
						+ "booking_roomrates=?, booking_seasonextra=?, booking_extrabednum=?, booking_extrabedprice=?, booking_poolpeoplenum=?"
						+ "booking_poolusedate=?, booking_restpeoplenum=?, booking_restusedate=?, booking_restmealtype=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, bookingDto.getBookingPeopleNum());
		ps.setString(2, bookingDto.getBookingRoomType());
		ps.setString(3,bookingDto.getBookingBedType());
		ps.setDate(4, bookingDto.getBookingCheckIn());
		ps.setDate(5, bookingDto.getBookingCheckOut());
		ps.setLong(6, bookingDto.getBookingRoomRates());
		ps.setLong(7, bookingDto.getBookingSeasonExtra());
		ps.setInt(8, bookingDto.getBookingExtrabedNum());
		ps.setLong(9, bookingDto.getBookingExtraBedPrice());
		ps.setInt(10, bookingDto.getBookingPoolPeopleNum());
		ps.setDate(11,bookingDto.getBookingPoolUseDate());
		ps.setInt(12, bookingDto.getBookingRestPeopleNum());
		ps.setDate(13, bookingDto.getBookingRestUseDate());
		ps.setString(14, bookingDto.getBookingRestMealType());
		
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	
	}
	
	// 삭제
	public boolean delete(int BookingOrderNo) throws Exception{
			Connection con = JdbcUtils.getConnection();
			
			String sql = "delete booking where BOOKING_ORDER_NO = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, BookingOrderNo);
			int count = ps.executeUpdate();
			
			con.close();
			
			return count > 0;
	
		}
		
	
	//상세
	public BookingDto getOneSelect(int BookingOrderNo) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select * from booking where BOOKING_ORDER_NO = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, BookingOrderNo);
			ResultSet rs = ps.executeQuery();
			
			BookingDto bookingDto;
			if(rs.next()) {
				bookingDto = new BookingDto();
				bookingDto.setBookingOrderNo(rs.getInt("BOOKING_ORDER_NO"));
				bookingDto.setBookingRoomNo(rs.getInt("BOOKING_ROOM_NO"));
				bookingDto.setBookingMemberId(rs.getString("BOOKING_MEMBER_ID"));
				bookingDto.setBookingPeopleNum(rs.getInt("BOOKING_PEOPLENUM"));
				bookingDto.setBookingRoomType(rs.getString("BOOKING_ROOMTYPE"));
				bookingDto.setBookingBedType(rs.getString("BOOKING_BEDTYPE"));
				bookingDto.setBookingCheckIn(rs.getDate("BOOKING_CHECKIN"));
				bookingDto.setBookingCheckOut(rs.getDate("BOOKING_CHECKOUT"));
				bookingDto.setBookingRoomRates(rs.getLong("BOOKING_ROOMRATES"));
				bookingDto.setBookingSeasonExtra(rs.getLong("BOOKING_SEASONEXTRA"));
				bookingDto.setBookingExtrabedNum(rs.getInt("BOOKING_EXTRABEDNUM"));
				bookingDto.setBookingExtraBedPrice(rs.getLong("BOOKING_EXTRABEDPRICE"));
				bookingDto.setBookingPoolPeopleNum(rs.getInt("BOOKING_POOLPEOPLENUM"));
				bookingDto.setBookingPoolUseDate(rs.getDate("BOOKING_POOLUSEDATE"));
				bookingDto.setBookingRestPeopleNum(rs.getInt("BOOKING_RESTPEOPLENUM"));
				bookingDto.setBookingRestUseDate(rs.getDate("BOOKING_RESTUSEDATE"));
				bookingDto.setBookingRestMealType(rs.getString("BOOKING_RESTMEALTYPE"));
				
	
			}
			else {
				bookingDto = null;
			}
			
			con.close();
			
			return bookingDto;
	}
	
	//조회 
	public List<BookingDto> selectList() throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from Booking order by no asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<BookingDto> list = new ArrayList<>();
		while(rs.next()) {
			BookingDto bookingDto = new BookingDto();
			bookingDto.setBookingOrderNo(rs.getInt("BOOKING_ORDER_NO"));
			bookingDto.setBookingRoomNo(rs.getInt("BOOKING_ROOM_NO"));
			bookingDto.setBookingMemberId(rs.getString("BOOKING_MEMBER_ID"));
			bookingDto.setBookingPeopleNum(rs.getInt("BOOKING_PEOPLENUM"));
			bookingDto.setBookingRoomType(rs.getString("BOOKING_ROOMTYPE"));
			bookingDto.setBookingBedType(rs.getString("BOOKING_BEDTYPE"));
			bookingDto.setBookingCheckIn(rs.getDate("BOOKING_CHECKIN"));
			bookingDto.setBookingCheckOut(rs.getDate("BOOKING_CHECKOUT"));
			bookingDto.setBookingRoomRates(rs.getLong("BOOKING_ROOMRATES"));
			bookingDto.setBookingSeasonExtra(rs.getLong("BOOKING_SEASONEXTRA"));
			bookingDto.setBookingExtrabedNum(rs.getInt("BOOKING_EXTRABEDNUM"));
			bookingDto.setBookingExtraBedPrice(rs.getLong("BOOKING_EXTRABEDPRICE"));
			bookingDto.setBookingPoolPeopleNum(rs.getInt("BOOKING_POOLPEOPLENUM"));
			bookingDto.setBookingPoolUseDate(rs.getDate("BOOKING_POOLUSEDATE"));
			bookingDto.setBookingRestPeopleNum(rs.getInt("BOOKING_RESTPEOPLENUM"));
			bookingDto.setBookingRestUseDate(rs.getDate("BOOKING_RESTUSEDATE"));
			bookingDto.setBookingRestMealType(rs.getString("BOOKING_RESTMEALTYPE"));
			
			
			list.add(bookingDto);
		}
		
		con.close();
		
		return list;
	
	}
	
}

