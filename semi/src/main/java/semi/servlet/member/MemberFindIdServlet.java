package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.MemberDto;
import semi.beans.MemberDao;

@WebServlet(urlPatterns = "/member/find_id.kh")
public class MemberFindIdServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 준비
			req.setCharacterEncoding("UTF-8");
			MemberDto memberDto = new MemberDto();
			memberDto.setMemberFname(req.getParameter("memberFname"));
			memberDto.setMemberLname(req.getParameter("memberLname"));
			memberDto.setMemberEmail(req.getParameter("memberEmail"));

			// 처리
			MemberDao memberDao = new MemberDao();
			String memberId = memberDao.findId(memberDto);

			// 출력
			if(memberId != null) {
				resp.sendRedirect("find_id_result.jsp?memberId="+memberId);
			}
			else {
				resp.sendRedirect("find_id.jsp?error");
			}

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}

	}
}
