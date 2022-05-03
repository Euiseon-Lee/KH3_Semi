package semi.servlet.qa;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.QaDao;
import semi.beans.QaDto;

@WebServlet(urlPatterns = "/qa/write.kh")
public class QaWriteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			QaDto qaDto = new QaDto();
			qaDto.setQaTitle(req.getParameter("qaTitle"));
			qaDto.setQaContent("qaContent");
			
			QaDao qaDao = new QaDao();
			qaDto.setQaNo(qaDao.getSequence());
			
			if(req.getParameter("superNo") == null) {
				qaDto.setGroupNo(qaDto.getQaNo());
				qaDto.setSuperNo(0);
				qaDto.setDepth(0);
			}
			else {
				int superNo = Integer.parseInt(req.getParameter("superNo"));
				QaDto originDto = qaDao.selectOne(superNo);
				qaDto.setGroupNo(originDto.getGroupNo());
				qaDto.setSuperNo(originDto.getQaNo());//==superNo
				qaDto.setDepth(originDto.getDepth() + 1);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
