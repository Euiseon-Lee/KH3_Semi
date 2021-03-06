package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.MemberDao;
import semi.beans.MemberDto;
@WebServlet(urlPatterns = "/member/login.kh")
public class MemberLoginServlet extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		//준비
		req.setCharacterEncoding("UTF-8");
		String memberId = req.getParameter("memberId");
		String memberPw = req.getParameter("memberPw");
		
		//처리
		MemberDao memberDao = new MemberDao();
		MemberDto memberDto = memberDao.selectOneId(memberId);
		boolean isLogin = memberDto != null && memberDto.getMemberPw().equals(memberPw);
		
		//출력
		if(isLogin) { //로그인 성공 시
			memberDao.updateLogindate(memberId); //최종접속일 update
			req.getSession().setAttribute("login", memberId); //session에 Id 정보 추가
			//세션에 사용자의 권한 추가(auth)
			req.getSession().setAttribute("auth", memberDto.getMemberGrade());
			req.getSession().setAttribute("id", memberDto.getMemberId());
			
			
			resp.sendRedirect(req.getContextPath()); //메인페이지 이동
		}
		else { //실패 시 
			resp.sendRedirect(req.getContextPath()+"/member/login.jsp?error");
		}
		
	} catch (Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}
}
}
