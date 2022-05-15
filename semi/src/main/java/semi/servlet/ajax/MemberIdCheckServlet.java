package semi.servlet.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.MemberDao;
import semi.beans.MemberDto;

@WebServlet(urlPatterns = "/ajax/id.kh")
public class MemberIdCheckServlet extends HttpServlet {
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
try {
	//준비
	String memebrId= req.getParameter("memberId");
	
	//처리 : 아이디 검색
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.selectOneId("memberId");
	
	//출력
	resp.setContentType("text/plain;charset=UTF-8");
	if(memberDto != null) {//아이디가 있으면 -> 사용불가능
		resp.getWriter().print("NNNNN");
	}
	else {//아이디가 없으면 -> 사용가능
		resp.getWriter().print("NNNNY");
	}

	
} catch (Exception e) {
	e.printStackTrace();
	resp.sendError(500);
}
}
	
}
