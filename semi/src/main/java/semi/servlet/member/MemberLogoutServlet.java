package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/member/logout.kh")
public class MemberLogoutServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.getSession().removeAttribute("login"); // 로그아웃 시 session 로그인 정보삭제
			req.getSession().removeAttribute("auth"); //로그아웃 시 권한 정보 삭제(grade)
			req.getSession().removeAttribute("id");//로그아웃 시 로그인 아이디 삭제
			resp.sendRedirect(req.getContextPath()); //메인으로 이동
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
