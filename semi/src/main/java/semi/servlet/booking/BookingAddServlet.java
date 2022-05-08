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
			resp.setCharacterEncoding("UTF-8");
			
			BookingDto bookingDto = new BookingDto();
			
		//	bookingDto.setBookingOrderNo(Integer.parseInt(req.getParameter("bookingOrderNo")));
		//	bookingDto.setBookingRoomNo(Integer.parseInt(req.getParameter("bookingRoomNo")));
			bookingDto.setBookingRoomNo(202);
			bookingDto.setBookingPeopleNum(Integer.parseInt(req.getParameter("bookingPeopleNum")));
			bookingDto.setBookingRoomType(req.getParameter("bookingRoomType"));
			bookingDto.setBookingBedType(req.getParameter("bookingBedType"));
			bookingDto.setBookingCheckIn(Date.valueOf(req.getParameter("bookingCheckIn")));
			bookingDto.setBookingCheckOut(Date.valueOf(req.getParameter("bookingCheckOut")));
			bookingDto.setBookingExtrabedNum(Integer.parseInt(req.getParameter("bookingExtrabedNum")));
			bookingDto.setBookingPoolPeopleNum(Integer.parseInt(req.getParameter("bookingPoolPeopleNum")));
			bookingDto.setBookingPoolUseDate(Date.valueOf(req.getParameter("bookingPoolUseDate")));
			bookingDto.setBookingRestPeopleNum(Integer.parseInt(req.getParameter("bookingRestPeopleNum")));
			bookingDto.setBookingRestUseDate(Date.valueOf(req.getParameter("bookingRestUseDate")));
			bookingDto.setBookingRestMealType(req.getParameter("bookingRestMealType"));
		
			
			BookingDao bookingDao = new BookingDao();
			
			bookingDto.setBookingOrderNo(bookingDao.getSequence());
			bookingDao.add(bookingDto);
			
			
			resp.sendRedirect("pay.jsp"); // 
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}