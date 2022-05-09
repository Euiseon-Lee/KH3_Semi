package semi.servlet.qa;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.MemberDao;
import semi.beans.MemberDto;
import semi.beans.QaDto;

@WebServlet(urlPatterns = "/qa/checkpw.kh")
public class QaPwCheckServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			QaDto qaDto = new QaDto();
			String memberId = (String) req.getSession().getAttribute("memberId");
			//세션 아이디의 비밀번호와 입력된 비밀번호 비교
			//비밀번호가 일치할 경우 통과
			
			//입력된 비밀번호
			String memberPwCheck = req.getParameter("memberPwCheck");
			
			MemberDao memberDao = new MemberDao();
			MemberDto memberDto = memberDao.selectOneId(memberId);
			
			boolean isPasswordCorrect = memberDto != null && memberPwCheck.equals(memberDto.getMemberPw());
			
			if(isPasswordCorrect) {//일치할 경우
				//세션에 비밀번호 저장
				req.getSession().setAttribute("password", memberDto.getMemberPw());
				resp.sendRedirect("datail.jsp");
				System.out.print("성공");
			}
			else {
				resp.sendRedirect("check.jsp");
				System.out.print("실패");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
