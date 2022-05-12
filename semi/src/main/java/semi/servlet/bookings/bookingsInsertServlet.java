package semi.servlet.bookings;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.BookingsDao;
import semi.beans.BookingsDto;
@WebServlet(urlPatterns = "/bookings/add.kh")
public class bookingsInsertServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			BookingsDto bookingsDto = new BookingsDto();
			
			bookingsDto.setBookingRoomType(req.getParameter("bookingRoomType"));
			bookingsDto.setBookingPeople(Integer.parseInt(req.getParameter("bookingPeople")));
			bookingsDto.setBookingRoomNo(Integer.parseInt(req.getParameter("bookingRoomNo")));
			bookingsDto.setBookingCheckin(req.getParameter("bookingCheckIn"));
			bookingsDto.setBookingCheckout(req.getParameter("bookingCheckOut"));
			bookingsDto.setBookingMemberId((String)req.getSession().getAttribute("login"));
			
			
//			예약 테이블 등록
			BookingsDao bookingsDao = new BookingsDao();
			bookingsDao.insert(bookingsDto);
//			가장 최근 등록된 예약주문번호 불러오기
			int TopSequence = bookingsDao.selectSequence();
			//예약 등록과 동시에 결제페이지로 객실번호주면서 이동
			resp.sendRedirect(req.getContextPath()+"/pay/pay.jsp?bookingOrderNo="+TopSequence);
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	
	}


}

