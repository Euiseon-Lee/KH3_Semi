package semi.beans;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookingDao {
	
	//// 시퀀스 번호 생성 
	
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
	
	// 등록 
	
	public void insert(BookingDto bookingDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into booking( "
				+ "booking_order_no, booking_member_id, booking_room_no, "
				+ "booking_people_num, booking_roomtype, booking_checkin, booking_checkout, booking_date)"
				+ "values(?, ?, ?, ?, ?, ?, ?, ?)";
	
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, bookingDto.getBookingOrderNo());
		ps.setString(2, bookingDto.getBookingMemberId());
		ps.setInt(3, bookingDto.getBookingRoomNo());
		ps.setInt(4, bookingDto.getBookingPeopleNum());
		ps.setString(5, bookingDto.getBookingRoomType());
		ps.setDate(6, bookingDto.getBookingCheckIn());
		ps.setDate(7, bookingDto.getBookingCheckOut());
		ps.setDate(8, bookingDto.getBookingDate());
		
		con.close();
	}
	
	
	
	//	목록 
	public List<BookingDto> selectList() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from booking";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<BookingDto> list = new ArrayList<>();
		
		while(rs.next()) {
			BookingDto bookingDto = new BookingDto();
			
			bookingDto.setBookingOrderNo(rs.getInt("booking_order_no"));
			bookingDto.setBookingMemberId(rs.getString("booking_member_id"));
			bookingDto.setBookingRoomNo(rs.getInt("booking_room_no"));
			bookingDto.setBookingPeopleNum(rs.getInt("booking_people_num"));
			bookingDto.setBookingRoomType(rs.getString("booking_roomtype"));
			bookingDto.setBookingCheckIn(rs.getDate("booking_checkin"));
			bookingDto.setBookingCheckOut(rs.getDate("booking_checkout"));
			bookingDto.setBookingDate(rs.getDate("booking_date"));
	
			list.add(bookingDto);
		}
		
		con.close();
		
		return list;
		
	}
	
	// 상세 
	public BookingDto selectOne(int bookingRoomNo) throws Exception {	
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from booking where booking_rooom_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, bookingRoomNo);
		ResultSet rs = ps.executeQuery();
		
		BookingDto bookingDto = new BookingDto();
		
		if(rs.next()) {
		
			bookingDto.setBookingRoomType(rs.getString("booking_room_no"));
		
		}
		
		else {
			bookingDto = null;
		}
		
		con.close();
		
		return bookingDto;
	}
	
	
	// 검색 
	
	public List<BookingDto> selectList(String keyword) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from booking where instr(booking_roomtype, ?) > 0 order by booking_roomtype asc";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		List<BookingDto> list = new ArrayList<>();
	
		while(rs.next()) {
			BookingDto bookingDto = new BookingDto();
			bookingDto.setBookingRoomType(rs.getString("booking_roomtype"));
			bookingDto.setBookingMemberId(rs.getString("booking_member_id"));
			bookingDto.setBookingRoomNo(rs.getInt("booking_room_no")); 
			bookingDto.setBookingPeopleNum(rs.getInt("booking_people_num"));
			bookingDto.setBookingOrderNo(rs.getInt("booking_order_no"));
			bookingDto.setBookingCheckIn(rs.getDate("booking_checkin"));
			bookingDto.setBookingCheckOut(rs.getDate("booking_checkout"));
			bookingDto.setBookingDate(rs.getDate("booking_date")); 
			
			list.add(bookingDto);
		}
		
		con.close();
		
		return list;
	}
}
