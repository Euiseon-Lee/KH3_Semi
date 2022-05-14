package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SeasonDao {
	
	//체크인날짜 비교해서 season type 가져오는 dao
	public String CheckinSeasonType (int bookingOrderNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select season_type from temp "
				+"where season_start-(select booking_checkin from bookings where booking_order_no = ?) < 0";
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
	
	
	
	//체크아웃날짜 비교해서 season type 가져오는 dao
	public String CheckoutSeasonType (int bookingOrderNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select season_type from temp "
				+"where season_end-(select booking_checkout from bookings where booking_order_no = ?) > 0";
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
	
	
	
	//성수기요금 가져오는 Dao
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

	
	
	//비성수기요금 가져오는 Dao
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
