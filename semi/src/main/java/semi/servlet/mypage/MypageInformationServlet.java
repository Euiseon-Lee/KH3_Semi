package semi.servlet.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.MemberDto;
import semi.beans.MemberDao;
@WebServlet(urlPatterns = "/mypage/information.kh")
public class MypageInformationServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		//준비
		req.setCharacterEncoding("UTF-8");
		MemberDto memberDto = new MemberDto();
		memberDto.setMemberId((String)req.getAttribute("login")); //로그인 정보 가져오기 
		
		//파라미터 가져오기;
		memberDto.setMemberName(req.getParameter("memberName"));
		memberDto.setMemberFname(req.getParameter("memberFname"));
		memberDto.setMemberLname(req.getParameter("memberLname"));
		memberDto.setMemberBirth(req.getParameter("memberBirth"));
		memberDto.setMemberPhone(req.getParameter("memberPhone"));
		memberDto.setMemberEmail(req.getParameter("memberEmail"));
		memberDto.setMemberPost(req.getParameter("memberPost"));
		memberDto.setMemberBasicAddress(req.getParameter("memberBasicAddress"));
		memberDto.setMemberDetailAddress(req.getParameter("memberDetailAddress"));
		memberDto.setMemberPw(req.getParameter("memberPw"));
		
		//처리
		MemberDao memberDao = new MemberDao();
		
		MemberDto findDto = memberDao.selectOneId(memberDto.getMemberId());
		boolean isPasswordCorrect = memberDto.getMemberPw().equals(findDto.getMemberPw());
		
		if(!isPasswordCorrect) {  
			resp.sendRedirect("information.jsp?error");  
					return;
		}
		memberDao.changeInformation(memberDto); //정보변경Dao 호출
		
		//출력
		resp.sendRedirect("mypage.jsp");
		
	} catch (Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}
	}
}
