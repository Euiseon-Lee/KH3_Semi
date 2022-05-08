package semi.servlet.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.ReviewDao;
import semi.beans.ReviewReplyDao;

@WebServlet(urlPatterns = "/review/reply_delete.kh")
public class ReplyDeleteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			try {
				//준비코드(댓글 번호를 이용해 삭제하고 게시글번호를 이용해 다시 detail로 돌아간다)
					int replyNo = Integer.parseInt(req.getParameter("replyNo"));
					int replyTarget = Integer.parseInt(req.getParameter("replyTarget"));
					
				//처리코드
				ReviewReplyDao reviewReplyDao = new ReviewReplyDao();
				boolean success = reviewReplyDao.delete(replyNo);
				
				//출력코드
				if(success) {
					
					ReviewDao reviewDao = new ReviewDao();
					reviewDao.updateReplycount(replyTarget);//댓글 수 갱신해야함
					resp.sendRedirect("detail.jsp?reviewNo="+replyTarget);
					
				}else {//잘못된 번호 입력하셨어요 고객님
					resp.sendError(404);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
				resp.sendError(500);
			}
	
	}
}
