package semi.beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PayDao {
	

	// 결제 목록 => list.jsp (본인 아이디로 결제내역 검색하는 형태, 아이디는 세션에서 가져온다)
	public List<PayDto> showPayList(String payMemberId) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from pay where pay_member_id = ? order by pay_order_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, payMemberId);
		ResultSet rs = ps.executeQuery();
		
		
		List<PayDto> list = new ArrayList<>();
		PayDto payDto = new PayDto();
		
		if(rs.next()) {			
			payDto.setPayOrderNo(rs.getInt("pay_order_no"));
			//payDto.setPayMemberId(rs.getString("pay_member_id"));
			payDto.setPayRoomNo(rs.getInt("pay_room_no"));
			payDto.setPayPeople(rs.getInt("pay_people"));
			payDto.setPayRoomtype(rs.getString("pay_roomtype"));
			payDto.setPayCheckIn(rs.getDate("pay_checkin"));
			payDto.setPayCheckOut(rs.getDate("pay_checkout"));
			//payDto.setPayDate(rs.getDate("pay_date"));
			payDto.setPayTotalPrice(rs.getInt("pay_total_price"));
			
			list.add(payDto);
		}
		else {
			payDto = null;
		}
		
		con.close();
		
		return list;	
		
	}	

	//상세 => detail.jsp (pk인 글 번호로 조회하므로 추가 조건구문 필요 없음)
	public PayDto showPayDetail(int payOrderNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from pay where pay_order_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, payOrderNo);
		ResultSet rs = ps.executeQuery();
		
		PayDto payDto = new PayDto();
		
		if(rs.next()) {
			payDto = new PayDto();
			
			payDto.setPayOrderNo(rs.getInt("pay_order_no"));
			payDto.setPayMemberId(rs.getString("pay_member_id"));
			payDto.setPayRoomNo(rs.getInt("pay_room_no"));
			payDto.setPayPeople(rs.getInt("pay_people"));
			payDto.setPayRoomtype(rs.getString("pay_roomtype"));
			payDto.setPayCheckIn(rs.getDate("pay_checkin"));
			payDto.setPayCheckOut(rs.getDate("pay_checkout"));
			payDto.setPayDate(rs.getDate("pay_date"));
			payDto.setPayTotalPrice(rs.getInt("pay_total_price"));

		}
		else {
			payDto = null;
		}
		
		con.close();
		
		return payDto;
	}
	

	// 검색	기능 제거
	
	
	//페이징 구현된 리스트 (본인 아이디로 결제내역 검색하는 형태, 아이디는 세션에서 가져온다)
	public List<PayDto> selectPayListByPaging(String payMemberId, int p, int s) throws Exception{
		int end = p * s;
		int begin = end - ( s - 1 ); 
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from "
				+"(select rownum rn, TMP.* from "
					+"(select * from pay where pay_member_id = ?) TMP) "
						+"where rn between ? and ? order by pay_order_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, payMemberId);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		ResultSet rs = ps.executeQuery();
		
		List<PayDto> list = new ArrayList<>();
		while(rs.next()) {
			PayDto payDto = new PayDto();
			
			payDto.setPayOrderNo(rs.getInt("pay_order_no"));
			//payDto.setPayMemberId(rs.getString("pay_member_id"));
			payDto.setPayRoomNo(rs.getInt("pay_room_no"));
			payDto.setPayPeople(rs.getInt("pay_people"));
			payDto.setPayRoomtype(rs.getString("pay_roomtype"));
			payDto.setPayCheckIn(rs.getDate("pay_checkin"));
			payDto.setPayCheckOut(rs.getDate("pay_checkout"));
			//payDto.setPayDate(rs.getDate("pay_date"));
			payDto.setPayTotalPrice(rs.getInt("pay_total_price"));
			
			
			list.add(payDto);
		}
		con.close();
		
		return list;
	}
	

	public int countByPaging() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from pay";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	
	// 결제 등록 (pay.jsp)
	// 1.시퀀스 생성
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
	
	
	// 2. 입력 sql
	public void addPaymentHistory(PayDto payDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into pay(pay_order_no, pay_member_id, pay_room_no,"
	            +"pay_people, pay_roomtype, pay_checkin, pay_checkout,"
	            +"pay_date, pay_total_price)"
				+"values(?,?,?,?,?,?,?,?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, payDto.getPayOrderNo());
		ps.setString(2, payDto.getPayMemberId());
		ps.setInt(3, payDto.getPayRoomNo());
		ps.setInt(4, payDto.getPayPeople());
		ps.setString(5, payDto.getPayRoomtype());
		ps.setDate(6, payDto.getPayCheckIn());
		ps.setDate(7, payDto.getPayCheckOut());
		ps.setDate(8, payDto.getPayDate());
		ps.setInt(9, payDto.getPayTotalPrice());
		
		ps.execute();
	
		con.close();
	}
	
	
	// 결제 취소 => delete.jsp
	public boolean paymentCancel(int payOrderNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete where pay_order_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, payOrderNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;

	}

	
	
	//체크인 날짜 비교해서 결제 취소 가능하게 하는 구문
	public boolean paymentCheck (String payMemberId, int payOrderNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from pay where pay_member_id = ? and pay_order_no = ? and pay_checkin - sysdate > 0";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, payMemberId);
		ps.setInt(2, payOrderNo);
		ResultSet rs = ps.executeQuery();
		
		boolean paymentCheck;
		
		if (rs.next()) {
			paymentCheck = true;
		}
		else {
			paymentCheck = false;
		}
		
		con.close();
		
		return paymentCheck;
		
	}
	
	
	
	

	
	
}
