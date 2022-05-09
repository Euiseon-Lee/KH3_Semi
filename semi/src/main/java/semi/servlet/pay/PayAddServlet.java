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
			PayDto payDto = new PayDto();
			
			payDto.setPayOrderNo(Integer.parseInt(req.getParameter("pay_order_no")));
			payDto.setPayRoomNo(Integer.parseInt(req.getParameter("pay_room_no")));
			payDto.setPayPeopleNum(Integer.parseInt(req.getParameter("pay_peoplenum")));
			payDto.setPayRoomType(req.getParameter("pay_roomtype"));
			payDto.setPayBedType(req.getParameter("pay_bedtype"));
			payDto.setPayCheckIn(Date.valueOf(req.getParameter("pay_checkin")));
			payDto.setPayCheckOut(Date.valueOf(req.getParameter("pay_checkout")));
			payDto.setPayExtraBedNum(Integer.parseInt(req.getParameter("pay_extrabednum")));
			payDto.setPayPoolPeopleNum(Integer.parseInt(req.getParameter("pay_poolpeoplenum")));
			payDto.setPayPoolUseDate(Date.valueOf(req.getParameter("pay_poolusedate")));
			payDto.setPayRestPeopleNum(Integer.parseInt(req.getParameter("pay_restpeoplenum")));
			payDto.setPayRestUseDate(Date.valueOf(req.getParameter("pay_restusedate")));
			payDto.setPayRestMealType(req.getParameter("pay_restmealtype"));
			
			PayDao payDao = new PayDao();
			payDao.add(payDto);
			
			resp.sendRedirect("add_finish.jsp");
	
		}
		
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}