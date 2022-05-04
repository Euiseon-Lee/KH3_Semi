package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
//객실소개 dao
public class RoomIntroduceDao {
	
	//목록
	public List<RoomIntroduceDto> selectList() throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from room_introduce";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<RoomIntroduceDto> list = new ArrayList<>();
		
		while(rs.next()) {
			RoomIntroduceDto roomIntroduceDto = new RoomIntroduceDto();
			
			roomIntroduceDto.setRoomIntroduceWriter(rs.getString("room_introduce_writer"));
			roomIntroduceDto.setRoomIntroduceHead(rs.getString("room_introduce_head"));
			roomIntroduceDto.setRoomIntroduceContent(rs.getString("room_introduce_content"));
			roomIntroduceDto.setRoomIntroduceNo(rs.getInt("room_introduce_no"));
			list.add(roomIntroduceDto);
		}
	
			con.close();
			
			return list;
	}
	//상세보기
		public RoomIntroduceDto selectOne(int roomIntroduceNo) throws Exception{
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select * from room_introduce where room_introduce_no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, roomIntroduceNo);
			ResultSet rs = ps.executeQuery();
			
			RoomIntroduceDto roomIntroduceDto;
			if(rs.next()) {
				roomIntroduceDto = new RoomIntroduceDto();
				
				roomIntroduceDto.setRoomIntroduceNo((rs.getInt("room_introduce_no")));
				roomIntroduceDto.setRoomIntroduceHead(rs.getString("room_introduce_head"));
				roomIntroduceDto.setRoomIntroduceContent(rs.getString("room_introduce_content"));
				roomIntroduceDto.setRoomIntroduceWriter(rs.getString("room_introduce_writer"));
			}else {
				roomIntroduceDto = null;
			}
			con.close();
			return roomIntroduceDto;
		}
		//객실 소개 수정
		public boolean update(RoomIntroduceDto roomIntroduceDto) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "update room_introduce "
							+ "set room_introduce_head = ?, room_introduce_content = ? "
							+ "where room_introduce_no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, roomIntroduceDto.getRoomIntroduceHead());
			ps.setString(2, roomIntroduceDto.getRoomIntroduceContent());
			ps.setInt(3, roomIntroduceDto.getRoomIntroduceNo());
			int count = ps.executeUpdate();
			
			con.close();
			return count >0;		
		}
		
}
