package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PayDao {
	
	// 결제 등록 (시퀀스 생성)
	public int getSequence() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select pay_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int number = rs.getInt("nextval");
		
		con.close();
		
		return number;
	}
	
	// 등록 = > pay.jsp
	public void add(PayDto payDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into pay(PAY_ORDER_NO, pay_member_id, pay_room_no,"
	            +"pay_peoplenum, pay_roomtype, pay_bedtype, pay_checkin, pay_checkout"
	            +"pay_roomrates, pay_seasonextra, pay_extrabednum, pay_extrabedprice, pay_poolpeoplenum"
	            +"pay_poolusedate, pay_restpeoplenum, pay_restusedate, pay_restmealtype)"
				+"values(pay_seq.nextval,?,?,?,?,?,to_date(?, 'YYYY-MM-DD'), to_date(?, 'YYYY-MM-DD'),?,?,?,?,?,to_date(?, 'YYYY-MM-DD'),?,to_date(?, 'YYYY-MM-DD'),?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, payDto.getPayOrderNo());
		ps.setString(2, payDto.getPayMemberId());
		ps.setInt(3, payDto.getPayRoomNo());
		ps.setInt(4, payDto.getPayPeopleNum());
		ps.setString(5, payDto.getPayRoomType());
		ps.setString(6, payDto.getPayBedType());
		ps.setDate(7, payDto.getPayCheckIn());
		ps.setDate(8, payDto.getPayCheckOut());
		ps.setLong(9, payDto.getPayRoomRates());
		ps.setLong(10, payDto.getPaySeasonExtra());
		ps.setInt(11, payDto.getPayExtraBedNum());
		ps.setLong(12, payDto.getPayExtraBedPrice());
		ps.setInt(13, payDto.getPayPoolPeopleNum());
		ps.setDate(14, payDto.getPayPoolUseDate());
		ps.setInt(15, payDto.getPayRestPeopleNum());
		ps.setDate(16, payDto.getPayRestUseDate());
		ps.setString(17, payDto.getPayRestMealType());
		
		ps.execute();
	
		con.close();
	}
	
	// 삭제 => delete.jsp
	public boolean delete(int payOrderNo) throws Exception{
			Connection con = JdbcUtils.getConnection();
			
			String sql = "delete pay where PAY_ORDER_NO = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, payOrderNo);
			int count = ps.executeUpdate();
			
			con.close();
			
			return count > 0;
	
		}
		
	//상세 => detail.jsp
	public PayDto showDetail(int payOrderNo) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select * from pay where PAY_ORDER_NO = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, payOrderNo);
			ResultSet rs = ps.executeQuery();
			
			PayDto payDto = new PayDto();
			
			if(rs.next()) {
				
				payDto.setPayOrderNo(rs.getInt("PAY_ORDER_NO"));
				payDto.setPayRoomNo(rs.getInt("PAY_ROOM_NO"));
				payDto.setPayMemberId(rs.getString("PAY_MEMBER_ID"));
				payDto.setPayPeopleNum(rs.getInt("PAY_PEOPLENUM"));
				payDto.setPayRoomType(rs.getString("PAY_ROOMTYPE"));
				payDto.setPayBedType(rs.getString("PAY_BEDTYPE"));
				payDto.setPayCheckIn(rs.getDate("PAY_CHECKIN"));
				payDto.setPayCheckOut(rs.getDate("PAY_CHECKOUT"));
				payDto.setPayRoomRates(rs.getLong("PAY_ROOMRATES"));
				payDto.setPaySeasonExtra(rs.getLong("PAY_SEASONEXTRA"));
				payDto.setPayExtraBedNum(rs.getInt("PAY_EXTRABEDNUM"));
				payDto.setPayExtraBedPrice(rs.getLong("PAY_EXTRABEDPRICE"));
				payDto.setPayPoolPeopleNum(rs.getInt("PAY_POOLPEOPLENUM"));
				payDto.setPayPoolUseDate(rs.getDate("PAY_POOLUSEDATE"));
				payDto.setPayRestPeopleNum(rs.getInt("PAY_RESTPEOPLENUM"));
				payDto.setPayRestUseDate(rs.getDate("PAY_RESTUSEDATE"));
				payDto.setPayRestMealType(rs.getString("PAY_RESTMEALTYPE"));	
	
			}
			else {
				payDto = null;
			}
			
			con.close();
			
			return payDto;
	}
	
}
	

