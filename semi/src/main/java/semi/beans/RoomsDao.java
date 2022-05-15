package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RoomsDao {
	//가격 수정
	public boolean update(RoomsDto roomsDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update rooms "
				+"set peak_season_price=?, off_season_price=? "
				+"where room_type=?";
		PreparedStatement ps= con.prepareStatement(sql);
		ps.setLong(1, roomsDto.getPeakSeason());
		ps.setLong(2, roomsDto.getOffSeason());
		ps.setString(3, roomsDto.getRoomType());
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	
	// 룸별 가격 목록
	public List<RoomsDto> selectList() throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from( "
				+ "select rownum rn, TMP.* from( "
				+ "SELECT room_type, peak_season_price,off_season_price FROM rooms WHERE room_type='스탠다드' "
				+ "union "
				+ "SELECT room_type, peak_season_price,off_season_price FROM rooms WHERE room_type='스위트' "
				+ "union "
				+ "SELECT room_type, peak_season_price,off_season_price FROM rooms WHERE room_type='디럭스' "
				+ "union "
				+ "SELECT room_type, peak_season_price,off_season_price FROM rooms WHERE room_type='프리미어' "
				+ ")TMP "
				+ ")where rn between 1 and 4";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<RoomsDto> list = new ArrayList<>();
		while(rs.next()) {
			RoomsDto roomsDto = new RoomsDto();
			
			roomsDto.setRoomType(rs.getString("room_type"));
			roomsDto.setPeakSeason(rs.getLong("peak_season_price"));
			roomsDto.setOffSeason(rs.getLong("off_season_price"));
			
			list.add(roomsDto);
		}
		con.close();
		
		return list;
	}
	//상세
	public RoomsDto selectOne(String roomType)throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from rooms where room_type=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, roomType);
		ResultSet rs = ps.executeQuery();
		
		RoomsDto roomsDto;
		if(rs.next()) {
			roomsDto = new RoomsDto();
			
			roomsDto.setRoomNo(rs.getInt("room_no"));
			roomsDto.setRoomType(rs.getString("room_type"));
			roomsDto.setPeakSeason(rs.getLong("peak_season_price"));
			roomsDto.setOffSeason(rs.getLong("off_season_price"));
		}
		else {
			roomsDto = null;
		}
		con.close();
		
		return roomsDto;
	}
}
