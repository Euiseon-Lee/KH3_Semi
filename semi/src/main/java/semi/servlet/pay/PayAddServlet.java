package semi.servlet.pay;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.PayDao;
import semi.beans.PayDto;

@WebServlet(urlPatterns = "/pay/add.kh")
public class PayAddServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html; charset=utf-8");
			
			// ID 불러오기
			String memberId = (String) req.getSession().getAttribute("login");
			
			PayDto payDto = new PayDto();
			
			payDto.setPayOrderNo(Integer.parseInt(req.getParameter("payOrderNo")));
			payDto.setPayMemberId(req.getParameter("payMemberId"));
			payDto.setPayRoomNo(Integer.parseInt(req.getParameter("payRoomNo")));
			payDto.setPayPeople(Integer.parseInt(req.getParameter("payPeopleNum")));
			payDto.setPayRoomtype(req.getParameter("payRoomType"));
			payDto.setPayCheckIn(Date.valueOf(req.getParameter("payCheckIn")));
			payDto.setPayCheckOut(Date.valueOf(req.getParameter("payCheckOut")));
			//더 추가 필요
			
			PayDao payDao = new PayDao();
			payDto.setPayOrderNo(payDao.getSequence());
			
			payDao.addPaymentHistory(payDto);
			
			// 주문번호 받을 시 사용
//			resp.sendRedirect("pay_success.jsp?PayOrderNo="+payDto.getPayOrderNo());
			resp.sendRedirect("pay_success.jsp");
		}
		
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}