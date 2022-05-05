package semi.servlet.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.ReviewReplyDao;
import semi.beans.ReviewReplyDto;
@WebServlet(urlPatterns = "/review/reply_insert.kh" )
public class ReplyInsertServlet extends HttpServlet {
	//리뷰게시판 댓글 생성 서블릿
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//리뷰 댓글 객체에 데이터 넣기(나머지 두개는 시퀀스,default값이라 안넣어도됨)
			ReviewReplyDto reviewReplyDto = new ReviewReplyDto();
			reviewReplyDto.setReplyContent(req.getParameter("replyContent"));
			reviewReplyDto.setReplyTarget(Integer.parseInt("replyTarget"));
			
			//세션 설정 된걸로 가정해서 만듬(관리자만 들어갈수 있게 필터도 만들어야함)
			reviewReplyDto.setReplyWriter((String)req.getSession().getAttribute("login"));
			
			//처리
			ReviewReplyDao reviewReplyDao = new ReviewReplyDao();
			reviewReplyDao.insert(reviewReplyDto);
			
			//출력
			resp.sendRedirect("detail.jsp?reviewNo="+reviewReplyDto.getReplyTarget());
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
			// TODO: handle exception
		}
	
	}
}
