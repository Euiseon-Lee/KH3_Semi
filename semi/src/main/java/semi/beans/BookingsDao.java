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
			
}
