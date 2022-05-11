package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookingsDao {
	//고객에게 받은 3가지 정보(타입,체크in-out)를 이용해 객실테이블에 남는 객실정보를 조회해주는 기능
	public List<RoomsDto> selectPossibleRooms(String bookingRoomType,String bookingCheckIn,String bookingCheckOut) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select room_no from rooms where room_type = ? "
				+ "minus "
				+ "select pay_room_no from ("
				+ " select * from pay where pay_roomtype = ?"
				+ " minus"
				+ " select * from pay where pay_checkout <= to_date(?, 'YYYY-MM-DD')"
				+ " minus"
				+ " select * from pay where pay_checkin >= to_date(?, 'YYYY-MM-DD')"
				+ ")";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, bookingRoomType);
		ps.setString(2, bookingRoomType);
		ps.setString(3, bookingCheckIn);
		ps.setString(4, bookingCheckOut);
		
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
}
