package semi.servlet.qa;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.QaDao;
import semi.beans.QaDto;

@WebServlet(urlPatterns = "/qa/edit.kh")
public class QaEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			QaDto qaDto = new QaDto();
			qaDto.setQaNo(Integer.parseInt(req.getParameter("qaNo")));
			qaDto.setQaTitle(req.getParameter("qaTitle"));
			qaDto.setQaPublic(req.getParameter("qaPublic"));
			qaDto.setQaContent(req.getParameter("qaContent"));
			
			QaDao qaDao = new QaDao();
			boolean success = qaDao.update(qaDto);
			
			if(success) {
				resp.sendRedirect("detail.jsp?qaNo="+qaDto.getQaNo());
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
