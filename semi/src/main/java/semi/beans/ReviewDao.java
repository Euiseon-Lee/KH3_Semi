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
	//제목검색 / 내용검색 / 작성자검색
	public List<ReviewDto> showList(String type, String keyword) throws Exception {
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
	

	// 2) 등록
	//게시글번호, 주문번호와 멤버아이디는 프로그래밍으로 넣어줄 것
	//나머지는 사용자가 직접 입력
	public void write(ReviewDto reviewDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into review("
						+ "review_no, review_order_no, review_member_id, "
						+ "review_title, review_content, review_writedate, "
						+ "review_readcount, review_star, review_replycount"
					+ ") "
						+ "values(?, ?, ?, ?, ?, sysdate, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, reviewDto.getReviewNo());
		ps.setInt(2, reviewDto.getReviewOrderNo());
		ps.setString(3, reviewDto.getReviewMemberId());
		ps.setString(4, reviewDto.getReviewTitle());
		ps.setString(5, reviewDto.getReviewContent());
		ps.setInt(6, reviewDto.getReviewReadcount());
		ps.setInt(7, reviewDto.getReviewStar());
		ps.setInt(8, reviewDto.getReviewReplycount());
		ps.execute();
		
		con.close();
	}
	
	
	
	//글 수정 => edit.jsp
	public boolean edit(ReviewDto reviewDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update review "
						+ "review_title = ?, review_content = ?, review_star = ? "
						+ "where review_no = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, reviewDto.getReviewTitle());
		ps.setString(2, reviewDto.getReviewContent());
		ps.setInt(3, reviewDto.getReviewStar());
		ps.setInt(4, reviewDto.getReviewNo());
		
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
		
	}
	
	
	//글 삭제 => delete.jsp
	public boolean delete(int reviewNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete review where review_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, reviewNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	
	
	
	
	//댓글 수 갱신 => 한석님 구상 후 추가 예정


	
	
	//페이지네이션 => 나중에 구현 예정
		
	

	
	

}
