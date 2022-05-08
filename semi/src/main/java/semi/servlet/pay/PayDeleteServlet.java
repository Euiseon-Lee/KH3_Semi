package semi.servlet.pay;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.PayDao;


@WebServlet(urlPatterns = "/pay/delete.kh")
public class PayDeleteServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			//준비 
			int PayOrderNo = Integer.parseInt(req.getParameter("pay_order_no"));
			
			//처리
			PayDao payDao = new PayDao();
			boolean result = payDao.delete(PayOrderNo);
			
			//출력
			if(result) {
				resp.sendRedirect("mypage.jsp");
				
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