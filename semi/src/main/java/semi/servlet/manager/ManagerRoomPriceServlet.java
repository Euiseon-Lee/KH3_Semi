package semi.servlet.manager;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.RoomsDao;
import semi.beans.RoomsDto;

@WebServlet(urlPatterns = "/manager/roomedit.kh")
public class ManagerRoomPriceServlet extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		RoomsDto roomsDto = new RoomsDto();
		roomsDto.setRoomType(req.getParameter("roomType"));
		roomsDto.setPeakSeason(Integer.parseInt(req.getParameter("peakSeason")));
		roomsDto.setOffSeason(Integer.parseInt(req.getParameter("offSeason")));
		
		RoomsDao roomsDao = new RoomsDao();
		boolean success = roomsDao.update(roomsDto);
		
		if(success) {
			resp.sendRedirect("rooms.jsp");
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
