package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDao {

	//회원가입 입력(insert) 
	public void join(MemberDto memberDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql="insert into member(member_id, member_pw, member_birth,"
				+"member_name, member_fname, member_lname, member_phone, member_email, member_post"
				+"member_basic_address, member_detail_address)"
				+"values(?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberDto.getMemberId());
		ps.setString(2, memberDto.getMemberPw());
		ps.setString(3, memberDto.getMemberBirth());
		ps.setString(4, memberDto.getMemberName());
		ps.setString(5, memberDto.getMemberFname());
		ps.setString(6, memberDto.getMemberLname());
		ps.setString(7, memberDto.getMemberPhone());
		ps.setString(8, memberDto.getMemberEmail());
		ps.setString(9, memberDto.getMemberPost());
		ps.setString(10, memberDto.getMemberBasicAddress());
		ps.setString(11, memberDto.getMemberDetailAddress());
		ps.execute();
		
		con.close();
		}
	
		
	//	아이디 단일조회(select)
	public MemberDto selectOneId(String memberId) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from member where member_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberId);
		ResultSet rs = ps.executeQuery();
		
		MemberDto memberDto;
		if(rs.next()) {
			memberDto = new MemberDto();
			
			memberDto.setMemberId(rs.getString("member_id"));
			memberDto.setMemberPw(rs.getString("member_pw"));
			memberDto.setMemberBirth(rs.getString("member_birth"));
			memberDto .setMemberName(rs.getString("member_name"));
			memberDto .setMemberFname(rs.getString("member_fname"));
			memberDto .setMemberLname(rs.getString("member_lname"));
			memberDto.setMemberPhone(rs.getString("member_phone"));
			memberDto.setMemberEmail(rs.getString("member_email"));
			memberDto.setMemberPost(rs.getString("member_post"));
			memberDto.setMemberBasicAddress(rs.getString("member_basic_address"));
			memberDto.setMemberDetailAddress(rs.getString("member_detail_address"));
			memberDto.setMemberJoindate(rs.getDate("member_joindate"));
			memberDto.setMemberLogindate(rs.getDate("member_logindate"));
		}
		else {
			memberDto = null;
		}
		con.close();
		return memberDto;
		}
	

		//이름(영문-성,이름) 조회(select)
		public MemberDto selectOneName(String memberFname, String memberLname) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		
		String sql = "select * from member where member_fname = ? and member_lname =?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberFname);
		ps.setString(2, memberLname);
		ResultSet rs = ps.executeQuery();
		
		MemberDto memberDto;
		if(rs.next()) {
			memberDto = new MemberDto();
			
			memberDto.setMemberId(rs.getString("member_id"));
			memberDto.setMemberPw(rs.getString("member_pw"));
			memberDto.setMemberBirth(rs.getString("member_birth"));
			memberDto.setMemberName(rs.getString("member_name"));
			memberDto.setMemberFname(rs.getString("member_fname"));
			memberDto.setMemberLname(rs.getString("member_lname"));
			memberDto.setMemberPhone(rs.getString("member_phone"));
			memberDto.setMemberEmail(rs.getString("member_email"));
			memberDto.setMemberPost(rs.getString("member_post"));
			memberDto.setMemberBasicAddress(rs.getString("member_basic_address"));
			memberDto.setMemberDetailAddress(rs.getString("member_detail_address"));
			memberDto.setMemberJoindate(rs.getDate("member_joindate"));
			memberDto.setMemberLogindate(rs.getDate("member_logindate"));
		}
		else {
			memberDto = null;
		}
		con.close();
		return memberDto;
		}
		
		
		//아이디 찾기(select)
				//-> 이름(영문-성,이름), 이메일로 아이디 찾기
		public String findId(MemberDto memberDto) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select member_id from member where member_fname=? and member_lname=? and member_email=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberDto.getMemberFname());
			ps.setString(2, memberDto.getMemberLname());
			ps.setString(3, memberDto.getMemberEmail());
			ResultSet rs = ps.executeQuery();
			
			String memberId;
			if(rs.next()) {
				memberId = rs.getString("member_id");
			}
			else {
				memberId = null;
			}
			con.close();
			return memberId;
		}
		
		
		//비밀번호 찾기(select)
					//-> 아이디, 이름(영문-성,이름), 이메일, 핸드폰번호로 비밀번호 찾기
		public MemberDto findPw(MemberDto memberDto) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select * from member "
								+ "where "
								+ "member_id = ? and member_fname = ? and member_Lname = ? and member_email = ? and member_phone = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberDto.getMemberId());
			ps.setString(2, memberDto.getMemberFname());
			ps.setString(3, memberDto.getMemberLname());
			ps.setString(4, memberDto.getMemberEmail());
			ps.setString(5, memberDto.getMemberPhone());
			ResultSet rs = ps.executeQuery();
			
			MemberDto findDto;
			if(rs.next()) {
				findDto = new MemberDto();
				
				memberDto.setMemberId(rs.getString("member_id"));
				memberDto.setMemberPw(rs.getString("member_pw"));
				memberDto.setMemberBirth(rs.getString("member_birth"));
				memberDto.setMemberName(rs.getString("member_name"));
				memberDto.setMemberFname(rs.getString("member_fname"));
				memberDto.setMemberLname(rs.getString("member_lname"));
				memberDto.setMemberPhone(rs.getString("member_phone"));
				memberDto.setMemberEmail(rs.getString("member_email"));
				memberDto.setMemberPost(rs.getString("member_post"));
				memberDto.setMemberBasicAddress(rs.getString("member_basic_address"));
				memberDto.setMemberDetailAddress(rs.getString("member_detail_address"));
				memberDto.setMemberJoindate(rs.getDate("member_joindate"));
				memberDto.setMemberLogindate(rs.getDate("member_logindate"));
			}
			else {
				findDto = null;
			}
			con.close();
			
			return findDto;
		}
		
		
		//비밀번호 변경 (update)
		public boolean changePassword(String memberId, String changePw) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "update member set member_pw = ? where member_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, changePw);
			ps.setString(2, memberId);
			int count = ps.executeUpdate();
			
			con.close();
			
			return count > 0;
		}
		
		
		//개인정보 변경(update)
		public boolean changeInformation(MemberDto memberDto) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "update member set "
										+ "member_name = ? , member_fname = ? , member_lname = ?, member_birth = ? , member_phone = ?, member_email = ? , "
										+ "member_post = ? , member_basic_address = ?, member_detail_address = ? "
										+ "where member_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberDto.getMemberName());
			ps.setString(2, memberDto.getMemberFname());
			ps.setString(3, memberDto.getMemberLname());
			ps.setString(4, memberDto.getMemberBirth());
			ps.setString(5, memberDto.getMemberPhone());
			ps.setString(6, memberDto.getMemberEmail());
			ps.setString(7, memberDto.getMemberPost());
			ps.setString(8, memberDto.getMemberBasicAddress());
			ps.setString(9, memberDto.getMemberDetailAddress());
			ps.setString(10, memberDto.getMemberId());
			int count = ps.executeUpdate();
			
			con.close();
			
			return count > 0;
		}
		
		
		//최종 접속일시 갱신(update)
		public boolean updateLogindate(String memberId) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "update member set member_logindate = sysdate where member_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberId);
			int count = ps.executeUpdate();
			
			con.close();
			
			return count > 0;
		}
		
		
		//탈퇴하기(delete)
		public boolean delete(String memberId) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "delete member where member_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberId);
			int count = ps.executeUpdate();
			
			con.close();
			
			return count > 0;
		}
		

	}

