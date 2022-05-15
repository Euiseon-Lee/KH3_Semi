package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SeasonDao {
	//시즌 날짜수정
	public boolean update(SeasonDto seasonDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update season "
				+ "set season_start=to_date(?, 'YYYY-MM-DD'), season_end=to_date(?, 'YYYY-MM-DD') "
				+ "where season_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, seasonDto.getSeasonStartString());
		ps.setString(2, seasonDto.getSeasonEndString());
		ps.setInt(3, seasonDto.getSeasonNo());
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	//시즌 목록
	public List<SeasonDto> selectList() throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from season order by season_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<SeasonDto> list = new ArrayList<>();
		while(rs.next()) {
			SeasonDto seasonDto = new SeasonDto();
			
			seasonDto.setSeasonNo(rs.getInt("season_no"));
			seasonDto.setSeasonType(rs.getString("season_type"));
			seasonDto.setSeasonStart(rs.getDate("season_start"));
			seasonDto.setSeasonEnd(rs.getDate("season_end"));
			
			seasonDto.setSeasonStartString(rs.getString("season_start"));
			seasonDto.setSeasonEndString(rs.getString("season_end"));
			
			list.add(seasonDto);
		}
		con.close();
		
		return list;
	}
	
	//상세
	public SeasonDto selectOne(int seasonNo)throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from season where season_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, seasonNo);
		ResultSet rs = ps.executeQuery();
		
		SeasonDto seasonDto;
		if(rs.next()) {
			seasonDto = new SeasonDto();
			
			seasonDto.setSeasonNo(rs.getInt("season_no"));
			seasonDto.setSeasonType(rs.getString("season_type"));
			seasonDto.setSeasonStart(rs.getDate("season_start"));
			seasonDto.setSeasonEnd(rs.getDate("season_end"));
			
			seasonDto.setSeasonStartString(rs.getString("season_start"));
			seasonDto.setSeasonEndString(rs.getString("season_end"));
		}
		else {
			seasonDto = null;
		}
		con.close();
		
		return seasonDto;
	}
}
