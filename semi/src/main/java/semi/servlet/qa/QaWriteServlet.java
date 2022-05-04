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
			qaDto.setQaPublic(req.getParameter("qaPublic"));
			qaDto.setQaContent(req.getParameter("qaContent"));
			
			QaDao qaDao = new QaDao();
			qaDto.setQaNo(qaDao.getSequence());
			
			qaDto.setQaWriter("testuser"); // 테스트용 작성자 세선에서 불러와야 함
			
			if(req.getParameter("superNo") == null ) {
				qaDto.setGroupNo(qaDto.getQaNo());
				qaDto.setSuperNo(0);
				qaDto.setDepth(0);
			}
			else {
				int superNo = Integer.parseInt(req.getParameter("superNo"));
				QaDto originDto = qaDao.selectOne(superNo);
				qaDto.setGroupNo(originDto.getGroupNo());
				qaDto.setSuperNo(originDto.getQaNo());
				qaDto.setDepth(originDto.getDepth()+1);
			}
			
			qaDao.insert(qaDto);
			
			resp.sendRedirect("detail.jsp?qaNo="+qaDto.getQaNo());
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}