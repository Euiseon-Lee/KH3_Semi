package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class QaDao {
	//목록
	public List<QaDto> selectList() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from qaboard order by qa_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<QaDto> list = new ArrayList<>();
		while(rs.next()) {
			QaDto qaDto = new QaDto();
			
			qaDto.setQaNo(rs.getInt("qa_no"));
			qaDto.setQaTitle(rs.getString("qa_title"));
			//qaDto.setQaContent(rs.getString("qa_content"));
			qaDto.setQaWritedate(rs.getDate("qa_writedate"));
			qaDto.setQaReadcount(rs.getInt("qa_readcount"));
			qaDto.setQaPublic(rs.getString("qa_public"));
			qaDto.setQaWriter(rs.getString("qa_writer"));
			qaDto.setGroupNo(rs.getInt("group_no"));
			qaDto.setSuperNo(rs.getInt("super_no"));
			qaDto.setDepth(rs.getInt("depth"));
			
			list.add(qaDto);
		}
		con.close();
		
		return list;
	}
}
