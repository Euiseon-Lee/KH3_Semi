package semi.servlet.pay;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.PayDao;
import semi.beans.PayDto;

	@WebServlet(urlPatterns = "/pay/list.kh")
	public class PayListServlet extends HttpServlet{
		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			try {
				
				PayDao payDao = new PayDao();
				List<PayDto> list = payDao.selectList();
				
				
				resp.setContentType("text/plain; charset=UTF-8");
				for(PayDto payDto : list) {
					resp.getWriter().println(payDto);
				}
			}
			catch(Exception e) {
				e.printStackTrace();
				resp.sendError(500);
			}
		}
	}