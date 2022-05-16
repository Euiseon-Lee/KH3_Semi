package semi.servlet.pay;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

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
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			  
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html; charset=utf-8");
			
			// ID 불러오기
			String bookingsMemberId = (String)req.getSession().getAttribute("id");
			
			//예약내역 불러오기
			int bookingOrderNo = Integer.parseInt(req.getParameter("bookingOrderNo"));
			BookingsDao bookingsDao = new BookingsDao();
			BookingsDto bookingsDto = bookingsDao.showDetail(bookingOrderNo, bookingsMemberId);
			
			
	         //String -> Date로 변환
	         SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	         Date payCheckIn = new Date(simpleDateFormat.parse(bookingsDto.getBookingCheckin()).getTime());
	         Date payCheckOut = new Date(simpleDateFormat.parse(bookingsDto.getBookingCheckout()).getTime());

			
			PayDto payDto = new PayDto();
			
			payDto.setPayMemberId(bookingsDto.getBookingMemberId());
			payDto.setPayRoomNo(bookingsDto.getBookingRoomNo());
			payDto.setPayPeople(bookingsDto.getBookingPeople());
			payDto.setPayRoomtype(bookingsDto.getBookingRoomType());
			payDto.setPayCheckIn(payCheckIn);
			payDto.setPayCheckOut(payCheckOut);
			payDto.setPayTotalPrice(Integer.parseInt(req.getParameter("payTotalPrice")));
			
			
			PayDao payDao = new PayDao();
			payDto.setPayOrderNo(payDao.getSequence());
			
			payDao.addPaymentHistory(payDto);
			bookingsDao.delete(bookingOrderNo);
			
			// 주문번호 받을 시 사용
			resp.sendRedirect(req.getContextPath()+"/pay/pay_success.jsp?payOrderNo="+payDto.getPayOrderNo());
		}
		
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}