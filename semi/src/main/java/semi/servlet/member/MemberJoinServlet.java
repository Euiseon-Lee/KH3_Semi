package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.MemberDto;
import semi.beans.MemberDao;

@WebServlet(urlPatterns = "/member/join.kh")
public class MemberJoinServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			// 준비
			MemberDto memberDto = new MemberDto();
			memberDto.setMemberId(req.getParameter("memberId"));
			memberDto.setMemberPw(req.getParameter("memberPw"));
			memberDto.setMemberBirth(req.getParameter("memberBirth"));
			memberDto.setMemberName(req.getParameter("memberFname"));
			memberDto.setMemberName(req.getParameter("memberLname"));
			memberDto.setMemberName(req.getParameter("memberName"));
			memberDto.setMemberPhone(req.getParameter("memberPhone"));
			memberDto.setMemberEmail(req.getParameter("memberEmail"));
			memberDto.setMemberPost(req.getParameter("memberPost"));
			memberDto.setMemberBasicAddress(req.getParameter("memberBasicAddress"));
			memberDto.setMemberDetailAddress(req.getParameter("memberDetailAddress"));

			// 처리
			MemberDao memberDao = new MemberDao();
			memberDao.join(memberDto);

			// 출력
			resp.sendRedirect("join_finish.jsp");

		} catch (Exception e) {  
			e.printStackTrace();
			resp.sendError(500);
		}

	}

}
