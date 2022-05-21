package semi.servlet.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.ReviewReplyDao;
import semi.beans.ReviewReplyDto;

@WebServlet(urlPatterns = "/review/reply_edit.kh")
public class ReplyEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			//준비 코드(댓글번호,댓글상대게시판번호,댓글내용을 댓글객체에 넣음)
			ReviewReplyDto reviewReplyDto = new ReviewReplyDto();
			reviewReplyDto.setReplyNo(Integer.parseInt(req.getParameter("replyNo")));
			reviewReplyDto.setReplyTarget(Integer.parseInt(req.getParameter("replyTarget")));
			reviewReplyDto.setReplyContent(req.getParameter("replyContent"));
				
			
			//처리 코드
			ReviewReplyDao reviewReplyDao = new ReviewReplyDao();
			boolean success = reviewReplyDao.update(reviewReplyDto);
			
			//출력 코드
			if(success) {
				resp.sendRedirect(req.getContextPath()+"/review/detail.jsp?reviewNo="+reviewReplyDto.getReplyTarget());
				
			}else {
				resp.sendError(404);
			}
		
			
			
		}catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	
	}
	
	
}
