package semi.servlet.pay;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.PayDao;

@WebServlet(urlPatterns = "/pay/cancel.kh")
public class PayCencelServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			//준비 
			int payOrderNo = Integer.parseInt(req.getParameter("payOrderNo"));
			
			//처리
			PayDao payDao = new PayDao();
			boolean success = payDao.delete(payOrderNo);
			
			//출력
			if(success) {
				resp.sendRedirect("list.jsp");	
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