package semi.servlet.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.ReviewDao;
import semi.beans.ReviewReplyDao;
import semi.beans.ReviewReplyDto;
@WebServlet(urlPatterns = "/review/reply_insert.kh" )
public class ReplyInsertServlet extends HttpServlet {
	//리뷰게시판 댓글 생성 서블릿
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			//리뷰 댓글 객체에 데이터 넣기(나머지 두개는 시퀀스,default값이라 안넣어도됨)
			ReviewReplyDto reviewReplyDto = new ReviewReplyDto();
			reviewReplyDto.setReplyContent(req.getParameter("replyContent"));
			reviewReplyDto.setReplyTarget(Integer.parseInt(req.getParameter("replyTarget")));
//			세션 설정 되면 이 코드로 바꾸기(관리자만 들어갈수 있게 필터도 만들어야함)
			reviewReplyDto.setReplyWriter((String)req.getSession().getAttribute("login"));
//			테스트용으로 그냥 testuser로 작성자에 넣어서 해봄
//			reviewReplyDto.setReplyWriter("testuser");
			
			//처리  
			ReviewReplyDao reviewReplyDao = new ReviewReplyDao();
			reviewReplyDao.insert(reviewReplyDto);
			
			//댓글 등록후 리뷰게시판 테이블에 댓글 수 갱신
			ReviewDao reviewDao = new ReviewDao();
			reviewDao.updateReplycount(reviewReplyDto.getReplyTarget());
			
			//출력
			resp.sendRedirect(req.getContextPath()+"/review/detail.jsp?reviewNo="+reviewReplyDto.getReplyTarget());
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
			// TODO: handle exception
		}
	
	}
}
