package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReviewDao {
	
	//목록 => list.jsp
	public List<ReviewDto> showList() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from review order by review_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<ReviewDto> list = new ArrayList<>();
		while(rs.next()) {
			ReviewDto reviewDto = new ReviewDto();
			
			reviewDto.setReviewNo(rs.getInt("review_no"));
			reviewDto.setReviewMemberId(rs.getString("review_member_id"));
			reviewDto.setReviewTitle(rs.getString("review_title"));
			reviewDto.setReviewWritedate(rs.getDate("review_writedate"));
			reviewDto.setReviewReadcount(rs.getInt("review_readcount"));
			reviewDto.setReviewStar(rs.getInt("review_star"));
			
			list.add(reviewDto);
		}
		
		con.close();
		
		return list;	
	}
	
	
	
	//검색 => list.jsp
	//제목검색 / 내용검색 / 제목+내용검색
	public List<ReviewDto> searchList(String type, String keyword) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from review where instr(#1, ?) > 0 order by review_no desc";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		List<ReviewDto> list = new ArrayList<>();
		while(rs.next()) {
			ReviewDto reviewDto = new ReviewDto();
			
			reviewDto.setReviewNo(rs.getInt("review_no"));
			reviewDto.setReviewMemberId(rs.getString("review_member_id"));
			reviewDto.setReviewTitle(rs.getString("review_title"));
			reviewDto.setReviewWritedate(rs.getDate("review_writedate"));
			reviewDto.setReviewReadcount(rs.getInt("review_readcount"));
			reviewDto.setReviewStar(rs.getInt("review_star"));
			
			list.add(reviewDto);
		}
		
		con.close();
		
		return list;	
		
	}
	
	
	
	
	//상세 => detail.jsp
	public ReviewDto showDetail(int reviewNo) throws Exception {	
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from review where review_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, reviewNo);
		ResultSet rs = ps.executeQuery();
		
		ReviewDto reviewDto = new ReviewDto();
		
		if(rs.next()) {
		
			reviewDto.setReviewNo(rs.getInt("review_no"));
			reviewDto.setReviewMemberId(rs.getString("review_member_id"));
			reviewDto.setReviewTitle(rs.getString("review_title"));
			reviewDto.setReviewContent(rs.getString("review_content"));
			reviewDto.setReviewWritedate(rs.getDate("review_writedate"));
			reviewDto.setReviewReadcount(rs.getInt("review_readcount"));
			reviewDto.setReviewStar(rs.getInt("review_star"));
		}
		
		else {
			reviewDto = null;
		}
		
		con.close();
		
		return reviewDto;
	}
	
	
	
	//조회수 증가
	public boolean plusReadcount(int reviewNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update review set review_readcount = review_readcount + 1 where review_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, reviewNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	
	
	//글 등록 => write.jsp
		// 1) 시퀀스 번호 생성
	public int getSequence() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select review_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int number = rs.getInt("nextval");
		
		con.close();
		
		return number;
	}
	

	
	
	

	
	

}
