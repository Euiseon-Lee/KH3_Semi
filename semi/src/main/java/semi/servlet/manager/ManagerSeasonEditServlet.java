package semi.servlet.manager;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.SeasonDao;
import semi.beans.SeasonDto;

@WebServlet(urlPatterns = "/manager/edit.kh")
public class ManagerSeasonEditServlet extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		SeasonDto seasonDto = new SeasonDto();
		seasonDto.setSeasonNo(Integer.parseInt(req.getParameter("seasonNo")));
		seasonDto.setSeasonStartString(req.getParameter("seasonStart"));
		seasonDto.setSeasonEndString(req.getParameter("seasonEnd"));
		
		SeasonDao seasonDao = new SeasonDao();
		boolean success = seasonDao.update(seasonDto);
		
		if(success) {
			resp.sendRedirect("season.jsp");
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
