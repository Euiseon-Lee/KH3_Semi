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
			
			bookingDto.setBookingOrderNo(Integer.parseInt(req.getParameter("booking_order_no")));
			bookingDto.setBookingRoomNo(Integer.parseInt(req.getParameter("booking_room_no")));
			bookingDto.setBookingPeopleNum(Integer.parseInt(req.getParameter("booking_peoplenum")));
			bookingDto.setBookingRoomType(req.getParameter("booking_roomtype"));
			bookingDto.setBookingBedType(req.getParameter("booking_bedtype"));
			bookingDto.setBookingCheckIn(Date.valueOf(req.getParameter("booking_checkin")));
			bookingDto.setBookingCheckOut(Date.valueOf(req.getParameter("booking_checkout")));
			bookingDto.setBookingExtrabedNum(Integer.parseInt(req.getParameter("booking_extrabednum")));
			bookingDto.setBookingPoolPeopleNum(Integer.parseInt(req.getParameter("booking_poolpeoplenum")));
			bookingDto.setBookingPoolUseDate(Date.valueOf(req.getParameter("booking_poolusedate")));
			bookingDto.setBookingRestPeopleNum(Integer.parseInt(req.getParameter("booking_restpeoplenum")));
			bookingDto.setBookingRestUseDate(Date.valueOf(req.getParameter("Booking_restusedate")));
			bookingDto.setBookingRestMealType(req.getParameter("Booking_restmealtype"));
		
			
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