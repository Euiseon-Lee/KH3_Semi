package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;

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


}
