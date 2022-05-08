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
			
			PayDto payDto = new PayDto();
			
			payDto.setPayOrderNo(Integer.parseInt(req.getParameter("payOrderNo")));
			payDto.setPayMemberId(req.getParameter("payMemberId"));
			payDto.setPayRoomNo(Integer.parseInt(req.getParameter("payRoomNo")));
			payDto.setPayPeopleNum(Integer.parseInt(req.getParameter("payPeopleNum")));
			payDto.setPayRoomType(req.getParameter("payRoomType"));
			payDto.setPayBedType(req.getParameter("payBedtType"));
			payDto.setPayCheckIn(Date.valueOf(req.getParameter("payCheckIn")));
			payDto.setPayCheckOut(Date.valueOf(req.getParameter("payCheckOut")));
			payDto.setPayRoomRates(Integer.parseInt(req.getParameter("payRoomRates")));
			payDto.setPayExtraBedNum(Integer.parseInt(req.getParameter("payExtrabedNum")));
			payDto.setPayOrderNo(Integer.parseInt(req.getParameter("payOrderNo")));
			payDto.setPayPoolPeopleNum(Integer.parseInt(req.getParameter("pay_poolpeoplenum")));
			payDto.setPayPoolUseDate(Date.valueOf(req.getParameter("pay_poolusedate")));
			payDto.setPayRestPeopleNum(Integer.parseInt(req.getParameter("pay_restpeoplenum")));
			payDto.setPayRestUseDate(Date.valueOf(req.getParameter("pay_restusedate")));
			payDto.setPayRestMealType(req.getParameter("pay_restmealtype"));
			
			PayDao payDao = new PayDao();
			payDto.setPayOrderNo(payDao.getSequence());
			payDao.add(payDto);
			resp.sendRedirect("detail.jsp?PayOrderNo="+payDto.getPayOrderNo());
		}
		
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}