package semi.servlet.pay;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.BookingsDao;
import semi.beans.BookingsDto;
import semi.beans.PayDao;
import semi.beans.PayDto;

@WebServlet(urlPatterns = "/pay/add.kh")
public class PayAddServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			  
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html; charset=utf-8");
			
			// ID 불러오기
			String bookingsMemberId = (String)req.getSession().getAttribute("id");
			
			//예약내역 불러오기
			int bookingOrderNo = Integer.parseInt(req.getParameter("bookingOrderNo"));
			BookingsDto bookingsDto = new BookingsDto();
			BookingsDao bookingsDao = new BookingsDao();
			bookingsDto = bookingsDao.showDetail(bookingOrderNo, bookingsMemberId);
			

			

			
			PayDto payDto = new PayDto();
			
			payDto.setPayMemberId(bookingsDto.getBookingMemberId());
			payDto.setPayRoomNo(bookingsDto.getBookingRoomNo());
			payDto.setPayPeople(bookingsDto.getBookingPeople());
			payDto.setPayRoomtype(bookingsDto.getBookingRoomType());
			payDto.setPayCheckIn(Date.valueOf(bookingsDto.getBookingCheckin()));
			payDto.setPayCheckOut(Date.valueOf(bookingsDto.getBookingCheckout()));
			payDto.setPayDate(null);
			payDto.setPayTotalPrice(Integer.parseInt(req.getParameter("payTotalPrice")));
			
			
			PayDao payDao = new PayDao();
			payDto.setPayOrderNo(payDao.getSequence());
			
			payDao.addPaymentHistory(payDto);
			
			// 주문번호 받을 시 사용
			resp.sendRedirect(req.getContextPath()+"pay_success.jsp?payOrderNo="+payDto.getPayOrderNo());
		}
		
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}