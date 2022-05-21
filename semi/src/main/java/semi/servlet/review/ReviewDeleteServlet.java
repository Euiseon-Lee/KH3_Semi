package semi.servlet.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.ReviewDao;
import semi.beans.ReviewDto;

@WebServlet(urlPatterns="/review/delete.kh")
public class ReviewDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			
			int reviewNo = Integer.parseInt(req.getParameter("reviewNo"));
			
			ReviewDao reviewDao = new ReviewDao();
			ReviewDto reviewDto = new ReviewDto();
			reviewDto = reviewDao.showDetail(reviewNo);
			

			
			boolean success = reviewDao.delete(reviewNo);
			
			if(success) {
				resp.sendRedirect(req.getContextPath()+"/review/list.jsp");
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
