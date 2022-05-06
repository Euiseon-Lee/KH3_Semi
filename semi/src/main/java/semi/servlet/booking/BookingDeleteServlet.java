package semi.servlet.booking;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.BookingDao;


@WebServlet(urlPatterns = "/Booking/delete.kh")
public class BookingDeleteServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			//준비 
			int booking_order_no = Integer.parseInt(req.getParameter("booking_order_no"));
			
			//처리
			BookingDao bookingDao = new BookingDao();
			boolean result = bookingDao.delete(booking_order_no);
			
			//출력
			if(result) {
				resp.sendRedirect("mypage.jsp");
				
			}
			else {
				resp.sendError(404);
			
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}