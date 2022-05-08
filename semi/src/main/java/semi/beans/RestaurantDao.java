package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RestaurantDao {
	
	// 등록 restaurant
	public void add(RestaurantDto restaurantDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into restaurant(REST_TABLENO, REST_PEOPLENUM, REST_MEALTYPE,REST_MEALPRICE)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, restaurantDto.getRestTableno());
		ps.setInt(2, restaurantDto.getRestPeopleNum());
		ps.setLong(3, restaurantDto.getRestMealType());
		ps.setDate(4, restaurantDto.getRestMealPrice());
		
		ps.execute();
	
		con.close();
	}
	
	// 삭제
	public boolean delete(int RestTableno) throws Exception{
			Connection con = JdbcUtils.getConnection();
			
			String sql = "delete restaurant where REST_TABLENO = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, RestTableno);
			int count = ps.executeUpdate();
			
			con.close();
			
			return count > 0;
	
		}
		
	
	//상세
	public RestaurantDto getOneSelect(int RestTableno) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select * from restaurant where REST_TABLENO = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, RestTableno);
			ResultSet rs = ps.executeQuery();
			
			RestaurantDto restaurantDto;
			if(rs.next()) {
				restaurantDto = new RestaurantDto();
				ps.setInt(1, restaurantDto.getRestTableno());
				ps.setInt(2, restaurantDto.getRestPeopleNum());
				ps.setLong(3, restaurantDto.getRestMealType());
				ps.setDate(4, restaurantDto.getRestMealPrice());
	
			}
			else {
				restaurantDto = null;
			}
			
			con.close();
			
			return restaurantDto;
	}
	
	//조회 
//	public List<RestaurantDto> selectList() throws Exception{
//		Connection con = JdbcUtils.getConnection();
//		
//		// ? String sql = "select * from Pay order by no asc";
//		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setInt(1, RestaurantDto);
//		ResultSet rs = ps.executeQuery();
//		
//		List<RestaurantDto> list = new ArrayList<>();
//		while(rs.next()) {
//			RestaurantDto restaurantDto = new RestaurantDto();
//			restaurantDto.setRestTableno(rs.getInt("REST_TABLENO"));
//			restaurantDto.setRestPeopleNum(rs.getInt("REST_PEOPLENUM"));
//			restaurantDto.setRestMealType(rs.getLong("REST_MEALTYPE"));
//			restaurantDto.setRestMealPrice(rs.getDate("REST_MEALPRICE"));
//					
//			list.add(restaurantDto);
//		}
//		
//		con.close();
//		
//		return list;
//	
//	}
	
}
