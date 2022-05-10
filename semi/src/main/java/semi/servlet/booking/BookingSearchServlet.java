package semi.servlet.booking; 
import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.BookingDao;
import semi.beans.BookingDto;


@WebServlet(urlPatterns = "/booking/search.kh")
public class BookingSearchServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String keyword = req.getParameter("bookingRoomType");
		
			boolean isSearch = keyword != null;
			BookingDao bookingDao = new BookingDao();
			
			List<BookingDto> list;
			
			if(isSearch) {//검색어가 있으면
				list = bookingDao.selectList(keyword); 
			}
			else {
				list = Collections.emptyList();
			}
			
		}  catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
			
		}
	}
}