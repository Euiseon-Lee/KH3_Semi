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
				+"values(pay_seq.nextval,?,?,?,?,?,to_date(?, 'YYYY-MM-DD'), to_date(?, 'YYYY-MM-DD'),?,?,?,?,?,to_date(?, 'YYYY-MM-DD'),?,to_date(?, 'YYYY-MM-DD'),?)";
		
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
	
	// 결제 취소 => delete.jsp
	public boolean delete(int payOrderNo) throws Exception{
			Connection con = JdbcUtils.getConnection();
			
			String sql = "delete pay where PAY_ORDER_NO = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, payOrderNo);
			int count = ps.executeUpdate();
			
			con.close();
			
			return count > 0;
	
		}

//		 결제 내역(목록) => list.jsp
		public List<PayDto> selectList() throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select * from pay order by pay_order_no desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			List<PayDto> list = new ArrayList<>();
			
			while(rs.next()) {
				PayDto payDto = new PayDto();
				
				payDto.setPayOrderNo(rs.getInt("pay_order_no"));
				payDto.setPayMemberId(rs.getString("pay_member_id"));
				payDto.setPayRoomNo(rs.getInt("pay_room-no"));
				payDto.setPayPeopleNum(rs.getInt("pay_people_num"));
				payDto.setPayRoomType(rs.getString("pay_roomtype"));
				payDto.setPayBedType(rs.getString("pay_bedtype"));
				payDto.setPayCheckIn(rs.getDate("pay_checkin"));
				payDto.setPayCheckOut(rs.getDate("pay_checkout"));
				payDto.setPayRoomRates(rs.getLong("pay_roomrates"));
				payDto.setPaySeasonExtra(rs.getLong("pay_seasonextra"));
				payDto.setPayExtraBedNum(rs.getInt("pay_extrabednum"));
				payDto.setPayExtraBedPrice(rs.getLong("pay_extrabedprice"));
				payDto.setPayPoolPeopleNum(rs.getInt("pay_poolpeoplenum"));
				payDto.setPayPoolUseDate(rs.getDate("pay_poolusedate"));
				payDto.setPayRestPeopleNum(rs.getInt("pay_restpeoplenum"));
				payDto.setPayRestUseDate(rs.getDate("pay_restusedate"));
				payDto.setPayRestMealType(rs.getString("pay_restmealtype"));
				
				list.add(payDto);
			}
			
			con.close();
			
			return list;	
			
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
				payDto = new PayDto();
				
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
	

