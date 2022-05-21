package semi.servlet.bookings;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.BookingsDao;
import semi.beans.BookingsDto;
@WebServlet(urlPatterns =  "/bookings/delete.kh")
public class bookingsDeleteServlet extends HttpServlet {
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		
			//준비
			int bookingOrderNo = Integer.parseInt(req.getParameter("bookingOrderNo"));
			//삭제(예약번호를 이용해 삭제)
			BookingsDao bookingsDao = new BookingsDao();
			boolean success = bookingsDao.delete(bookingOrderNo);
			
			
			//출력
			if(success) {
				resp.sendRedirect(req.getContextPath()+"/bookings/bookingsList.jsp");
			}else {
				resp.sendError(404);
			}
		
	}catch(Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}
	
}
}
