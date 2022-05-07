package semi.servlet.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.MemberDao;
import semi.beans.MemberDto;
import semi.beans.ReviewDao;
import semi.beans.ReviewDto;

@WebServlet(urlPatterns="/review/write.kh")
public class ReviewWriteServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			//필터 만들면 지우기
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html; charset=utf-8");
			
			
			
			ReviewDto reviewDto = new ReviewDto();			
			
			reviewDto.setReviewTitle(req.getParameter("reviewTitle"));
			reviewDto.setReviewContent(req.getParameter("reviewContent"));
			reviewDto.setReviewStar(Integer.parseInt(req.getParameter("reviewStar")));
			
			//추후 세션을 만들면 reviewMemberId 가져올 코드
			//String memberId = (String) req.getSession().getAttribute("login");
			//reviewDto.setReviewMemberId(memberId);
			
			
			//주문번호 불러오는 코드
			//reviewDto.setReviewOrderNo(Integer.parseInt(req.getParameter("reviewOrderNo")));	
			
			//세션과 PayDto 불러올수 있을 때 삭제할 코드
			reviewDto.setReviewOrderNo(2);
			reviewDto.setReviewMemberId("testmanager");
			
			
			
			ReviewDao reviewDao = new ReviewDao();
			reviewDto.setReviewNo(reviewDao.getSequence());
			
			reviewDao.write(reviewDto);
			
			resp.sendRedirect("detail.jsp?reviewNo="+reviewDto.getReviewNo());
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			resp.sendError(500);
		}
		
		
	}
	
}