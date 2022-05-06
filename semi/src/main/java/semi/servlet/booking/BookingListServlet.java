package semi.servlet.booking;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.BookingDao;
import semi.beans.BookingDto;

	@WebServlet(urlPatterns = "/booking/list.kh")
	public class BookingListServlet extends HttpServlet{
		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			try {
				
				BookingDao bookingDao = new BookingDao();
				List<BookingDto> list = bookingDao.selectList();
				
				
				resp.setContentType("text/plain; charset=UTF-8");
				for(BookingDto bookingDto : list) {
					resp.getWriter().println(bookingDto);
				}
			}
			catch(Exception e) {
				e.printStackTrace();
				resp.sendError(500);
			}
		}
	}

