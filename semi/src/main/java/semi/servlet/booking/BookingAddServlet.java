package semi.servlet.booking;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.BookingDao;
import semi.beans.BookingDto;

@WebServlet(urlPatterns = "/booking/add.kh")
public class BookingAddServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			req.setCharacterEncoding("UTF-8");
			BookingDto bookingDto = new BookingDto();
			
			bookingDto.setBooking_order_no(Integer.parseInt(req.getParameter("booking_order_no")));
			bookingDto.setBooking_room_no(Integer.parseInt(req.getParameter("booking_room_no")));
			bookingDto.setBooking_peoplenum(Integer.parseInt(req.getParameter("booking_peoplenum")));
			bookingDto.setBooking_roomtype(req.getParameter("booking_roomtype"));
			bookingDto.setBooking_bedtype(req.getParameter("booking_bedtype"));
			bookingDto.setBooking_checkin(Date.valueOf(req.getParameter("booking_checkin")));
			bookingDto.setBooking_checkout(Date.valueOf(req.getParameter("booking_checkout")));
			bookingDto.setBooking_extrabednum(Integer.parseInt(req.getParameter("booking_extrabednum")));
			bookingDto.setBooking_poolpeoplenum(Integer.parseInt(req.getParameter("booking_poolpeoplenum")));
			bookingDto.setBooking_poolusedate(Date.valueOf(req.getParameter("booking_poolusedate")));
			bookingDto.setBooking_restpeoplenum(Integer.parseInt(req.getParameter("booking_restpeoplenum")));
			bookingDto.setBooking_restusedate(Date.valueOf(req.getParameter("Booking_restusedate")));
			bookingDto.setBooking_restmealtype(req.getParameter("Booking_restmealtype"));
		
			
			BookingDao bookingDao = new BookingDao();
			bookingDao.add(bookingDto);
			
			resp.sendRedirect("add_finish.jsp");
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}