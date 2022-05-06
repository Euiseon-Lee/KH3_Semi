package semi.servlet.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.MemberDao;
import semi.beans.MemberDto;
@WebServlet(urlPatterns = "/member/password.semi")
public class MemberPasswordServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			req.setCharacterEncoding("UTF-8");
			String currentPw = req.getParameter("currentPw");
			String changePw = req.getParameter("changePw");
			
			String memberId = (String) req.getSession().getAttribute("login");
			
			//처리
			boolean isSamePassword = currentPw == null || changePw == null || currentPw.equals(changePw);
			if(isSamePassword) {
				resp.sendRedirect("password.jsp?error=1");
				return;
			}
			
			MemberDao memberDao = new MemberDao();
			MemberDto memberDto = memberDao.selectOneId(memberId);
			
			boolean isCorrectPassword = currentPw.equals(memberDto.getMemberPw());
			if(!isCorrectPassword) {
				resp.sendRedirect("password.jsp?error=2");
				return;
			}
			memberDao.changePassword(memberId, changePw);
			
			//출력
			resp.sendRedirect("mypage.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
