package semi.servlet.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.MemberDao;
import semi.beans.MemberDto;
import semi.beans.PayDao;
import semi.beans.PayDto;
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
			
			//준비
			ReviewDto reviewDto = new ReviewDto();	
			
			
			//payDto 불러서 주문번호와 객실유형 넣도록하자
			int payOrderNo = Integer.parseInt(req.getParameter("payOrderNo"));
			PayDto payDto = new PayDto();
			PayDao payDao = new PayDao();
			payDto = payDao.showPayDetail(payOrderNo);
			String payRoomtype = payDto.getPayRoomtype();
			int reviewOrderNo = payDto.getPayOrderNo();
			
			
			//세션에서 reviewMemberId 가져올 코드
			String memberId = (String) req.getSession().getAttribute("login");
			reviewDto.setReviewMemberId(memberId);	
			
			
					
			
			reviewDto.setReviewTitle(req.getParameter("reviewTitle"));
			reviewDto.setReviewContent(req.getParameter("reviewContent"));
			reviewDto.setReviewStar(Integer.parseInt(req.getParameter("reviewStar")));
			

			
			
			//주문번호와 객실유형 넣는 코드
			reviewDto.setReviewOrderNo(reviewOrderNo);
			reviewDto.setReviewRoomtype(payRoomtype);
			
			
			
			ReviewDao reviewDao = new ReviewDao();
			reviewDto.setReviewNo(reviewDao.getSequence());
			
			reviewDao.write(reviewDto);
			
			resp.sendRedirect(req.getContextPath()+"/review/detail.jsp?reviewNo="+reviewDto.getReviewNo());
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			resp.sendError(500);
		}
		
		
	}
	
}