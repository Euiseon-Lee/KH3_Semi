package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ReviewLikesDao {
	//좋아요 추가
		public boolean plusLikescount(String likesWho, long reviewNo) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "update review set likes_num = likescount + 1 where likes_who = ? and review_no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, likesWho);
			ps.setLong(2, reviewNo);
			int count = ps.executeUpdate();
			
			con.close();
			
			return count > 0;
		}
		
		
	//좋아요 취소
	public boolean minuslikescount(String likesWho, long reviewNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update review set likescount = likescount - 1 where likes_who = ? and review_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, likesWho);
		ps.setLong(2, reviewNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}		
	
}
