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
	
	
	//의선: 체크인날짜 비교해서 season type 가져오는 dao
	public String CheckinSeasonType (int bookingOrderNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select season_type from season "
				+ "where season_start - (select booking_checkin from bookings where booking_order_no = ?) < 0";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, bookingOrderNo);
		ResultSet rs = ps.executeQuery();
		
		String checkinSeasonType;
		if (rs.next()) {
			checkinSeasonType = rs.getString("season_type");
		}
		else {
			checkinSeasonType = null;
		}
		

		con.close();
		
		return checkinSeasonType;
		
	}
	
	
	
	//의선: 체크아웃날짜 비교해서 season type 가져오는 dao
	public String CheckoutSeasonType (int bookingOrderNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select season_type from season "
				+ "where season_start - (select booking_checkout from bookings where booking_order_no = ?) < 0";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, bookingOrderNo);
		ResultSet rs = ps.executeQuery();
		
		String checkoutSeasonType;
		if(rs.next()) {
			checkoutSeasonType = rs.getString("season_type");
		}
		else {
			checkoutSeasonType = null;
		}
		
		
		con.close();
		
		return checkoutSeasonType;
		
	}
	
	
	
	//의선: 성수기요금 가져오는 Dao
	public int PeakSeasonPrice (int bookingRoomNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select peak_season_price from rooms where room_no=?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, bookingRoomNo);
		ResultSet rs = ps.executeQuery();
		
		int peakSeasonPrice;
		if(rs.next()) {
			peakSeasonPrice = rs.getInt("peak_season_price");
		}
		else {
			peakSeasonPrice = 0;
		}

		
		con.close();
		
		return peakSeasonPrice;
	}

	
	
	//의선: 비성수기요금 가져오는 Dao
	public int OffSeasonPrice (int bookingRoomNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select off_season_price from rooms where room_no=?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, bookingRoomNo);
		ResultSet rs = ps.executeQuery();
		
		int offSeasonPrice;
		if(rs.next()) {
			offSeasonPrice = rs.getInt("off_season_price");
		}
		else {
			offSeasonPrice = 0;
		}

		
		con.close();
		
		return offSeasonPrice;
	}
	
	
	//의선: 숙박기간 뽑는 Dao
	public int stayPeriod (int bookingOrderNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select booking_checkout - booking_checkin from bookings where booking_order_no=?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, bookingOrderNo);
		ResultSet rs = ps.executeQuery();
		
		int stayPeriod;
		if(rs.next()) {
			stayPeriod = rs.getInt(1);
		}
		else {
			stayPeriod = 1;
		}

		
		con.close();
		
		return stayPeriod;		
	}
}
