package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReviewReplyDao {
	
	//리뷰 게시판 댓글 생성
	public void insert(ReviewReplyDto reviewReplyDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into review_reply(reply_no, reply_writer, reply_target,reply_content) "
					+ "values(reply_seq.nextval,?,?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, reviewReplyDto.getReplyWriter());
		ps.setInt(2, reviewReplyDto.getReplyTarget());
		ps.setString(3, reviewReplyDto.getReplyContent());
		ps.execute();
		
		con.close();
		
	}
	// 댓글 목록 보여주는 메소드
		// 시간 남으면 댓글 정렬 최신순,등록순 둘다 구현하고(jquery사용해야할걸?) 우선순위는 등록순으로 한다.
			public List<ReviewReplyDto> selectList(int replyTarget) throws Exception{
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select * from review_reply where reply_target = ? order by reply_no asc ";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, replyTarget);
			ResultSet rs = ps.executeQuery();
			
			List<ReviewReplyDto> list = new ArrayList<>();
			
			
			while(rs.next()) {
				ReviewReplyDto reviewReplyDto = new ReviewReplyDto();
				reviewReplyDto.setReplyNo(rs.getInt("reply_no"));
				reviewReplyDto.setReplyWriter(rs.getString("reply_writer"));
				reviewReplyDto.setReplyContent(rs.getString("reply_content"));
				reviewReplyDto.setReplyTarget(rs.getInt("reply_target"));
				reviewReplyDto.setReplyTime(rs.getDate("reply_time"));
				
				list.add(reviewReplyDto);
			}
			
			con.close();
			
			return list;
		}
		// 댓글 검색 기능메소드는 만들어놨는데 화면에 구현할지는 시간 남으면 하자(추가기능이라고 생각)
			public List<ReviewReplyDto> selectList(String type, String keyword) throws Exception{
				Connection con = JdbcUtils.getConnection();
				
				String sql = "select * from review_reply where instr(#1,?)>0 order by reply_no asc ";
				sql = sql.replace("#1", type);
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, keyword);
				ResultSet rs = ps.executeQuery();
				
				List<ReviewReplyDto> list = new ArrayList<>();
				
				
				while(rs.next()) {
					ReviewReplyDto reviewReplyDto = new ReviewReplyDto();
					reviewReplyDto.setReplyNo(rs.getInt(rs.getInt("reply_no")));
					reviewReplyDto.setReplyWriter(rs.getString("reply_writer"));
					reviewReplyDto.setReplyContent(rs.getString("reply_content"));
					reviewReplyDto.setReplyTarget(rs.getInt("reply_target"));
					reviewReplyDto.setReplyTime(rs.getDate("reply_time"));
					
					list.add(reviewReplyDto);
				}
				
				con.close();
				
				return list;
			}
//			댓글 삭제 메소드
			public boolean delete(int replyNo) throws Exception {
				Connection con = JdbcUtils.getConnection();
				
				String sql = "delete review_reply where reply_no = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, replyNo);
				int count = ps.executeUpdate();
				
				con.close();
				
				return count > 0;
			}

//			댓글 수정 메소드
			public boolean update(ReviewReplyDto reviewReplyDto) throws Exception {
					Connection con = JdbcUtils.getConnection();
					
					String sql = "update review_reply set reply_content = ? where reply_no = ?";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, reviewReplyDto.getReplyContent());
					ps.setInt(2, reviewReplyDto.getReplyNo());
					int count = ps.executeUpdate();
					
					con.close();
					
					return count >0 ;
			}
}
