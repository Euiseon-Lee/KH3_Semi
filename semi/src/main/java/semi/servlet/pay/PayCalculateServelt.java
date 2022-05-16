package semi.servlet.pay;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import semi.beans.BookingsDao;
import semi.beans.BookingsDto;
import semi.beans.SeasonDao;



public class PayCalculateServelt extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			//예약번호를 기반으로 방 번호 뽑기
			int bookingOrderNo = Integer.parseInt(req.getParameter("bookingOrderNo"));
			//int bookingOrderNo = 8;
			BookingsDto bookingsDto = new BookingsDto();
			BookingsDao bookingsDao = new BookingsDao();
			bookingsDto = bookingsDao.showDetail(bookingOrderNo);
			int bookingRoomNo = bookingsDto.getBookingRoomNo();
			
			
			//체크인&체크아웃날짜 기반으로 성수기/비성수기 찾기
			SeasonDao seasonDao = new SeasonDao();
			String checkinSeasonType = seasonDao.CheckinSeasonType(bookingOrderNo);
			String checkoutSeasonType = seasonDao.CheckoutSeasonType(bookingOrderNo);
			
			
			//1일 금액 산정 = 체크인 또는 체크아웃 중 하나라도 성수기에 포함되면
			//해당 객실의 성수기 가격을 받는다
			int price;
			if (checkinSeasonType == "peak" || checkoutSeasonType == "peak") {
				price = seasonDao.PeakSeasonPrice(bookingRoomNo);
			}
			else {
				price = seasonDao.OffSeasonPrice(bookingRoomNo);
			}
			
			
			//총 이용하는 날짜 알아내기
			int stayPeriod = seasonDao.stayPeriod(bookingOrderNo);
			
			
			//총 금액처리
			int payTotalPrice = price * stayPeriod;
			

			resp.sendRedirect("pay.jsp");
			
		}
		
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);			
		}
	}
}
