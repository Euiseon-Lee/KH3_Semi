/*
 * package semi.servlet.booking;
 * 
 * import java.io.IOException;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.annotation.WebServlet; import javax.servlet.http.HttpServlet;
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse;
 * 
 * import semi.beans.BookingDao; import semi.beans.BookingDto;
 * 
 * @WebServlet(urlPatterns = "/booking/detail.kh") public class
 * BookingDetailServlet extends HttpServlet{
 * 
 * @Override protected void service(HttpServletRequest req, HttpServletResponse
 * resp) throws ServletException, IOException { try {
 * 
 * 
 * String bookingRoomType = req.getParameter("bookingRoomType");
 * 
 * BookingDao bookingDao = new BookingDao(); BookingDto bookingDto =
 * bookingDao.selectOne(bookingRoomType);
 * 
 * 
 * resp.setContentType("text/plain; charset=UTF-8");
 * 
 * if(bookingDto == null) {
 * 
 * resp.sendRedirect(); } else { resp.getWriter().println("no : " +
 * bookingtDto.getNo());
 * 
 * } } catch(Exception e) { e.printStackTrace(); resp.sendError(500); } }
 */