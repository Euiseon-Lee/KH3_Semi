package semi.servlet.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.MemberDao;
import semi.beans.MemberDto;
@WebServlet(urlPatterns = "/mypage/exit.kh")
public class MypageExitServlet extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		//준비(세션에서 정보 가져오기)
		req.setCharacterEncoding("UTF-8");
		String memberId = (String)req.getSession().getAttribute("login");
		String memberPw = req.getParameter("memberPw");
		
		//처리
		MemberDao memberDao = new MemberDao();
		MemberDto memberDto = memberDao.selectOneId(memberId);
		boolean isPasswordCorrect = memberPw != null && memberPw.equals(memberDto.getMemberPw());
		if(!isPasswordCorrect) {
			resp.sendRedirect("exit.jsp?error");
			return;
		}
		memberDao.delete(memberId); //아이디삭제
		
		
		
		//로그아웃 처리(세션에서 정보 삭세하기)
		req.getSession().removeAttribute("login"); //로그인 정보 삭제 
		req.getSession().removeAttribute("auth"); //로그인 권한 삭제
		
		
		//출력
		resp.sendRedirect("exit_finish.jsp");
		
		
	} catch (Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}
}
}
