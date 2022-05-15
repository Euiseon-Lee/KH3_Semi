package semi.servlet.qa;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.MemberDao;
import semi.beans.MemberDto;
import semi.beans.QaDao;
import semi.beans.QaDto;

@WebServlet(urlPatterns = "/qa/checkpw.kh")
public class QaPwCheckServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int qaNo = Integer.parseInt(req.getParameter("qaNo"));
			int groupNo = Integer.parseInt(req.getParameter("groupNo"));
			
		    QaDao qaDao = new QaDao(); 
			QaDto qaDto = qaDao.selectOne(qaNo);
			
			String memberId = (String) req.getSession().getAttribute("login");
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
				resp.sendRedirect("detail.jsp?qaNo="+qaNo+"&groupNo="+groupNo);
			}
			else {
				resp.sendRedirect("check.jsp?qaNo="+qaNo+"&groupNo="+groupNo);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
