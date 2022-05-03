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
		
		String sql = "select * from qaboard where instr(#1,?)>0 order by board_no desc";
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
		
		String sql = "select qa_seq.nextval from dual";
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
				+ "qa_no, qa_title, qa_content, qa_writer,"
				+ "group_no, super_no, depth"
				+ ")"
				+ "values(?,?,?,?,?,?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, qaDto.getQaNo());
		ps.setString(2, qaDto.getQaTitle());
		ps.setString(3, qaDto.getQaContent());
		ps.setString(4, qaDto.getQaWriter());
		ps.setInt(5, qaDto.getGroupNo());
		ps.setInt(6, qaDto.getSuperNo());
		ps.setInt(7, qaDto.getDepth());
		ps.execute();
		
		con.close();
	}
	
	//수정
	public boolean update(QaDto qaDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update qaboard"
				+ "set qa_title=?, qa_content=?"
				+ "where qa_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, qaDto.getQaTitle());
		ps.setString(2, qaDto.getQaContent());
		ps.setInt(3, qaDto.getQaNo());
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
}
