package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookingsDao {
	//고객에게 받은 3가지 정보(타입,체크in-out)를 이용해 (결제+예약테이블의 들어가있는거 뺴고) 객실테이블에 남는 객실정보를 조회해주는 기능
	public List<RoomsDto> selectPossibleRooms(String bookingRoomType,String bookingCheckIn,String bookingCheckOut) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select room_no from rooms where room_type = ? "
				+ "minus "
				+ " select pay_room_no from ("
				+ " select * from pay where pay_roomtype = ?"
				+ " minus"
				+ " select * from pay where pay_checkout <= to_date(?, 'YYYY-MM-DD')"
				+ " minus"
				+ " select * from pay where pay_checkin >= to_date(?, 'YYYY-MM-DD')"
				+ ")"
				+ " minus"
				+ " select booking_room_no from ("
				+ " select * from bookings where booking_room_type = ?"
				+ " minus"
				+ " select * from bookings where booking_checkout <= to_date(?, 'YYYY-MM-DD')"
				+ " minus"
				+ " select * from bookings where booking_checkin >= to_date(?, 'YYYY-MM-DD'))";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, bookingRoomType);
		ps.setString(2, bookingRoomType);
		ps.setString(3, bookingCheckIn);
		ps.setString(4, bookingCheckOut);
		ps.setString(5, bookingRoomType);
		ps.setString(6, bookingCheckIn);
		ps.setString(7, bookingCheckOut);

		ResultSet rs = ps.executeQuery();
		List<RoomsDto> list = new ArrayList<>();
		
		while(rs.next()) {
			RoomsDto roomsDto = new RoomsDto();
			
			roomsDto.setRoomNo(rs.getInt("room_no"));
			
			list.add(roomsDto);
		}
		con.close();
		
		return list;
	}

		//(예약테이블에 등록되는 메소드)
		public void insert(BookingsDto bookingsDto) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "insert into bookings(booking_order_no,booking_member_id,booking_room_no,"
					+ " booking_people,booking_room_type,booking_checkin,booking_checkout)"
					+ " values(bookings_seq.nextval,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, bookingsDto.getBookingMemberId());
			ps.setInt(2, bookingsDto.getBookingRoomNo());
			ps.setInt(3, bookingsDto.getBookingPeople());
			ps.setString(4, bookingsDto.getBookingRoomType());
			ps.setString(5, bookingsDto.getBookingCheckin());
			ps.setString(6, bookingsDto.getBookingCheckout());
			
			ps.execute();
			con.close();
		}
		
		/// 예약 전체목록메소드(관리자용)
		public List<BookingsDto> selectList() throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select * from bookings order by booking_order_no asc";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			List<BookingsDto> list = new ArrayList<>();
			while(rs.next()) {
				BookingsDto bookingsDto = new BookingsDto();
				
				bookingsDto.setBookingOrderNo(rs.getInt("booking_order_no"));
				bookingsDto.setBookingMemberId(rs.getString("booking_member_id"));
				bookingsDto.setBookingRoomNo(rs.getInt("booking_room_no"));
				bookingsDto.setBookingPeople(rs.getInt("booking_people"));
				bookingsDto.setBookingRoomType(rs.getString("booking_room_type"));
				bookingsDto.setBookingCheckin(rs.getString("booking_checkin"));
				bookingsDto.setBookingCheckout(rs.getString("booking_checkout"));
				bookingsDto.setBookingDate(rs.getString("booking_date"));
				
				list.add(bookingsDto);
			}
			con.close();
			return list;
		}
// 자기(로그인 아이디필요) 예약목록
		public List<BookingsDto> selectList(String memberId) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select * from bookings where booking_member_id = ? order by booking_order_no asc";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberId);
			ResultSet rs = ps.executeQuery();
			
			List<BookingsDto> list = new ArrayList<>();
			while(rs.next()) {
				BookingsDto bookingsDto = new BookingsDto();
				
				bookingsDto.setBookingOrderNo(rs.getInt("booking_order_no"));
				bookingsDto.setBookingMemberId(rs.getString("booking_member_id"));
				bookingsDto.setBookingRoomNo(rs.getInt("booking_room_no"));
				bookingsDto.setBookingPeople(rs.getInt("booking_people"));
				bookingsDto.setBookingRoomType(rs.getString("booking_room_type"));
				bookingsDto.setBookingCheckin(rs.getString("booking_checkin"));
				bookingsDto.setBookingCheckout(rs.getString("booking_checkout"));
				bookingsDto.setBookingDate(rs.getString("booking_date"));
				
				list.add(bookingsDto);
			}
			con.close();
			return list;
		}
		//가장 최근 예약 주문번호 조회하는 기능
		public int selectSequence() throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select * from ("
					+ "    select rownum rn, TMP.* from ("
					+ "        select booking_order_no from bookings order by booking_order_no desc"
					+ "    )TMP"
					+ ") where rn =1";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int number = rs.getInt("booking_order_no");
			
			con.close();
			
			return number;
		}
			
			//삭제
		public boolean delete(int bookingOrderNo) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "delete bookings where booking_order_no = ?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, bookingOrderNo);
			int count = ps.executeUpdate();
			con.close();
			return count>0;
					
		}
}
