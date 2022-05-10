package semi.servlet.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.ReviewDao;
import semi.beans.ReviewDto;

@WebServlet(urlPatterns="/review/edit.kh")
public class ReviewEditServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			//필터 만들면 지우기
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html; charset=utf-8");
			
			
			ReviewDto reviewDto = new ReviewDto();
			reviewDto.setReviewNo(Integer.parseInt(req.getParameter("reviewNo")));
			reviewDto.setReviewTitle(req.getParameter("reviewTitle"));
			reviewDto.setReviewContent(req.getParameter("reviewContent"));
			reviewDto.setReviewStar(Integer.parseInt(req.getParameter("reviewStar")));
			
			

			ReviewDao reviewDao = new ReviewDao();
			boolean success = reviewDao.edit(reviewDto);
			
			
			if(success) {
				resp.sendRedirect("detail.jsp?reviewNo="+reviewDto.getReviewNo());
			}
			else {
				resp.sendError(404);
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
