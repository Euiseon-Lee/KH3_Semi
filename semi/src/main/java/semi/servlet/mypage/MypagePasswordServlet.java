package semi.servlet.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.MemberDao;
import semi.beans.MemberDto;
@WebServlet(urlPatterns = "/mypage/password.kh")
public class MypagePasswordServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			req.setCharacterEncoding("UTF-8");
			String currentPw = req.getParameter("currentPw");
			String changePw = req.getParameter("changePw");
			String changePw_check = req.getParameter("changePw_check");
			
			
			
			String memberId = (String) req.getSession().getAttribute("login");
			
			
			//처리
			
			
			boolean isSamePassword = currentPw == null || changePw == null || currentPw.equals(changePw);
			if(isSamePassword) {
				resp.sendRedirect(req.getContextPath()+"/mypage/password.jsp?error=1");
				return;
			}
			
			MemberDao memberDao = new MemberDao();
			MemberDto memberDto = memberDao.selectOneId(memberId);
			
			boolean isCorrectPassword = currentPw.equals(memberDto.getMemberPw());
			if(!isCorrectPassword) {
				resp.sendRedirect(req.getContextPath()+"/mypage/password.jsp?error=2");
				return;
			}
			
			//변경할 비밀번호 적합한지 검사 추가 
			boolean isSamePassword_check = changePw != null && changePw_check != null && changePw_check!=changePw;
			if(isSamePassword_check) {
				resp.sendRedirect(req.getContextPath()+"/mypage/password.jsp?error=3");
				return;
			}
			
			//출력
			//로그아웃 시키기 
			if(!(isSamePassword_check&&isSamePassword&&isCorrectPassword)) {
				memberDao.changePassword(memberId, changePw);
				resp.sendRedirect(req.getContextPath()+"/member/login.jsp");
			}
			else {
				resp.sendRedirect(req.getContextPath()+"/mypage/password.jsp");
			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
