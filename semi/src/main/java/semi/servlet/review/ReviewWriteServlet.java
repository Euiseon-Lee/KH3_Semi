package semi.servlet.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.ReviewDao;
import semi.beans.ReviewDto;

@WebServlet(urlPatterns="/review/write.kh")
public class ReviewWriteServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			ReviewDto reviewDto = new ReviewDto();
			reviewDto.setReviewTitle(req.getParameter("reviewTitle"));
			reviewDto.setReviewContent(req.getParameter("reviewContent"));
			reviewDto.setReviewStar(Integer.parseInt(req.getParameter("reviewStar")));
			
			reviewDto.setReviewOrderNo(Integer.parseInt(req.getParameter("reviewOrderNo")));	//수정필요
			reviewDto.setReviewMemberId(req.getParameter("reviewMemberId"));	//수정필요
			
			
			//추후 세션을 만들면 reviewMemberId 가져올 코드
			//String memberId = (String) req.getSession().getAttribute("login");
			//reviewDto.setReviewMemberId(memberId);
			
			
			ReviewDao reviewDao = new ReviewDao();
			reviewDto.setReviewNo(reviewDao.getSequence());
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			resp.sendError(500);
		}
		
		
	}
	
}