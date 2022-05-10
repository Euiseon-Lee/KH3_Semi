package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.proxy.annotation.Pre;


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
	
	//검색
	public List<QaDto> selectList(String type, String keyword) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from qaboard where instr(#1,?)>0 order by qa_no desc";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs =ps.executeQuery();
		
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
	
	//상세보기
	public QaDto selectOne(int qaNo)throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from qaboard where qa_no= ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, qaNo);
		ResultSet rs = ps.executeQuery();
		
		QaDto qaDto;
		if(rs.next()) {
			qaDto = new QaDto();
			
			qaDto.setQaNo(rs.getInt("qa_no"));
			qaDto.setQaTitle(rs.getString("qa_title"));
			qaDto.setQaContent(rs.getString("qa_content"));
			qaDto.setQaWritedate(rs.getDate("qa_writedate"));
			qaDto.setQaReadcount(rs.getInt("qa_readcount"));
			qaDto.setQaPublic(rs.getString("qa_public"));
			qaDto.setQaWriter(rs.getString("qa_writer"));
			qaDto.setGroupNo(rs.getInt("group_no"));
			qaDto.setSuperNo(rs.getInt("super_no"));
			qaDto.setDepth(rs.getInt("depth"));
		}
		else {
			qaDto = null;
		}
		con.close();
		
		return qaDto;
	}
	
	//조회수 증가
	public boolean plusReadcount(int qaNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update qaboard set qa_readcount = qa_readcount + 1 where qa_no =?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, qaNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	
	//등록
	// 시퀀스 번호 생성 
	public int getSequence() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select qaboard_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int number = rs.getInt("nextval");
		
		con.close();
		
		return number;
	}
	
	public void insert(QaDto qaDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into qaboard("
				+ "qa_no, qa_public, qa_title, qa_content, qa_writer,"
				+ "group_no, super_no, depth"
				+ ")"
				+ "values(?,?,?,?,?,?,?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, qaDto.getQaNo());
		ps.setString(2, qaDto.getQaPublic());
		ps.setString(3, qaDto.getQaTitle());
		ps.setString(4, qaDto.getQaContent());
		ps.setString(5, qaDto.getQaWriter());
		ps.setInt(6, qaDto.getGroupNo());
		ps.setInt(7, qaDto.getSuperNo());
		ps.setInt(8, qaDto.getDepth());
		ps.execute();
		
		con.close();
	}
	
	//수정
	public boolean update(QaDto qaDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update qaboard "
				+ "set qa_title=?, qa_content=?, qa_public=? "
				+ "where qa_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, qaDto.getQaTitle());
		ps.setString(2, qaDto.getQaContent());
		ps.setString(3, qaDto.getQaPublic());
		ps.setInt(4, qaDto.getQaNo());
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	//삭제
	public boolean delete(int qaNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete qaboard where qa_no =?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, qaNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count >0;
	}
	//페이징 구현된 리스트
	public List<QaDto> selectListByPaging(int p, int s) throws Exception{
		int end = p * s;
		int begin = end - ( s - 1 ); 
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("
									+ "select * from qaboard "
									+ "connect by prior qa_no = super_no "
									+ "start with super_no = 0 "
									+ "order siblings by group_no desc, qa_no asc "
								+ ") TMP"
						+ ") where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
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
	
	//검색 + 페이징 리스트
	
	public List<QaDto> selectListByPaging(int p, int s, String type, String keyword) throws Exception{
		int end = p * s;
		int begin = end - ( s - 1 ); 
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ( "
						+ "select rownum rn, TMP.* from ( "
							+ "select * from qaboard where instr(#1, ?) > 0 "
							+ "connect by prior qa_no = super_no "
							+ "start with super_no = 0 "
							+ "order siblings by group_no desc, qa_no asc "
						+ ") TMP "
				+ ") where rn between ? and ?";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, begin);
		ps.setInt(3, end);
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
	public int countByPaging() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from qaboard";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	public int countByPaging(String type, String keyword) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from qaboard where instr(#1, ?) > 0";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);		
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	// 관리자의 비공개 답글 확인 테스트
	public String firstWriter (int groupNo) throws Exception {
	      Connection con = JdbcUtils.getConnection();
	      
	      String sql = "select qa_writer from qaboard where group_no = ? and super_no= 0";
	      
	      PreparedStatement ps = con.prepareStatement(sql);
	      ps.setInt(1, groupNo);
	      
	      String firstOne; 
	      
	      ResultSet rs = ps.executeQuery();
	      
	      if(rs.next()) {
	         firstOne = rs.getString("qa_writer");         
	      }

	      else {
	         firstOne = null;
	      }
	      
	      con.close();
	      
	      return firstOne;
	      
	   }
}
