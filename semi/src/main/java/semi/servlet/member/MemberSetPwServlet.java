package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.MemberDao;
@WebServlet(urlPatterns = "/member/set_pw.semi")
public class MemberSetPwServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			req.setCharacterEncoding("UTF-8");
			String memberId = req.getParameter("memberId");
			String memberPw = req.getParameter("memberPw");
			
			//처리
			MemberDao memberDao = new MemberDao();
			memberDao.changePassword(memberId, memberPw);
			
			//출력
			resp.sendRedirect("set_pw_finish.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
