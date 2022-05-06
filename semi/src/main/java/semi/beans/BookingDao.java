package semi.beans;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BookingDao {
	
	//일단 등록만 먼저 하고 시간 남으면 나머지 적용
	
	// 등록 Booking 
	
	//주문번호 sequence로 가져오기 
	public int getSequence() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select booking_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int number = rs.getInt("nextval");
		
		con.close();
		
		return number;
	}
	
	public void add(BookingDto bookingDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into booking(booking_order_no, booking_room_no, booking_member_id,"
				+"booking_peoplenum, booking_roomtype, booking_bedtype, booking_checkin, booking_checkout"
				+"booking_roomrates, booking_seasonextra, booking_extrabednum, booking_extrabedprice, booking_poolpeoplenum"
				+"booking_poolusedate, booking_restpeoplenum, booking_restusedate, booking_restmealtype)"
				+"values(booking_seq.nextval,?,?,?,?,?,to_date(?, 'YYYY-MM-DD'), to_date(?, 'YYYY-MM-DD'),?,?,?,?,?,to_date(?, 'YYYY-MM-DD'),?,to_date(?, 'YYYY-MM-DD'),?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, bookingDto.getBooking_order_no());
		ps.setInt(2, bookingDto.getBooking_room_no());
		ps.setString(3, bookingDto.getBooking_member_id());
		ps.setInt(4, bookingDto.getBooking_peoplenum());
		ps.setString(5, bookingDto.getBooking_roomtype());
		ps.setString(6, bookingDto.getBooking_bedtype());
		ps.setDate(7, bookingDto.getBooking_checkin());
		ps.setDate(8, bookingDto.getBooking_checkout());
		ps.setLong(9, bookingDto.getBooking_roomrates());
		ps.setLong(10, bookingDto.getBooking_seasonextra());
		ps.setInt(11, bookingDto.getBooking_extrabednum());
		ps.setLong(12, bookingDto.getBooking_extrabedprice());
		ps.setInt(13, bookingDto.getBooking_poolpeoplenum());
		ps.setDate(14, bookingDto.getBooking_poolusedate());
		ps.setInt(15, bookingDto.getBooking_restpeoplenum());
		ps.setDate(16, bookingDto.getBooking_restusedate());
		ps.setString(17, bookingDto.getBooking_restmealtype());
	
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
		ps.setInt(1, bookingDto.getBooking_peoplenum());
		ps.setString(2, bookingDto.getBooking_roomtype());
		ps.setString(3,bookingDto.getBooking_bedtype());
		ps.setDate(4, bookingDto.getBooking_checkin());
		ps.setDate(5, bookingDto.getBooking_checkout());
		ps.setLong(6, bookingDto.getBooking_roomrates());
		ps.setLong(7, bookingDto.getBooking_seasonextra());
		ps.setInt(8, bookingDto.getBooking_extrabednum());
		ps.setLong(9, bookingDto.getBooking_extrabedprice());
		ps.setInt(10, bookingDto.getBooking_poolpeoplenum());
		ps.setDate(11,bookingDto.getBooking_poolusedate());
		ps.setInt(12, bookingDto.getBooking_restpeoplenum());
		ps.setDate(13, bookingDto.getBooking_restusedate());
		ps.setString(14, bookingDto.getBooking_restmealtype());
		
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
		
	}
	
	// 삭제
	public boolean delete(int booking_order_no) throws Exception{
			Connection con = JdbcUtils.getConnection();
			
			String sql = "delete booking where booking_order_no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, booking_order_no);
			int count = ps.executeUpdate();
			
			con.close();
			
			return count > 0;
	
		}
		
	
	//상세
	public BookingDto selectOne(int booking_order_no) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select * from booking where no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, booking_order_no);
			ResultSet rs = ps.executeQuery();
			
			BookingDto bookingDto;
			if(rs.next()) {
				bookingDto = new BookingDto();
				bookingDto.setBooking_order_no(rs.getInt("booking_order_no"));
				bookingDto.setBooking_room_no(rs.getInt("booking_room_no"));
				bookingDto.setBooking_member_id(rs.getString("booking_member_id"));
				bookingDto.setBooking_peoplenum(rs.getInt("booking_peoplenum"));
				bookingDto.setBooking_roomtype(rs.getString("booking_roomtype"));
				bookingDto.setBooking_bedtype(rs.getString("booking_bedtype"));
				bookingDto.setBooking_checkin(rs.getDate("booking_checkin"));
				bookingDto.setBooking_checkout(rs.getDate("booking_checkout"));
				bookingDto.setBooking_roomrates(rs.getLong("booking_roomrates"));
				bookingDto.setBooking_seasonextra(rs.getLong("booking_seasonextra"));
				bookingDto.setBooking_extrabednum(rs.getInt("booking_extrabednum"));
				bookingDto.setBooking_extrabedprice(rs.getLong("booking_extrabedprice"));
				bookingDto.setBooking_poolpeoplenum(rs.getInt("booking_poolpeoplenum"));
				bookingDto.setBooking_poolusedate(rs.getDate("booking_poolusedate"));
				bookingDto.setBooking_restpeoplenum(rs.getInt("booking_restpeoplenum"));
				bookingDto.setBooking_restusedate(rs.getDate("booking_restusedate"));
				bookingDto.setBooking_restmealtype(rs.getString("Booking_restmealtype"));
	
			}
			else {
				bookingDto = null;
			}
			
			con.close();
			
			return bookingDto;
		}
		
		
	}
