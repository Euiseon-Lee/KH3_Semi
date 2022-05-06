package semi.servlet.hotelintroduce;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.HotelIntroduceDao;
import semi.beans.HotelIntroduceDto;

@WebServlet(urlPatterns = "/hotelIntroduce/edit.kh")
public class HotelIntroduceEditServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
				req.setCharacterEncoding("UTF-8");
				//호텔 객체 생성후  데이터 넣기
				HotelIntroduceDto hotelIntroduceDto = new HotelIntroduceDto();
				hotelIntroduceDto.setHotelIntroduceNo(Integer.parseInt(req.getParameter("hotelIntroduceNo")));
				hotelIntroduceDto.setHotelIntroduceHead(req.getParameter("hotelIntroduceHead"));
				hotelIntroduceDto.setHotelIntroduceContent(req.getParameter("hotelIntroduceContent"));
				hotelIntroduceDto.setHotelIntroduceWriter(req.getParameter("hotelIntroduceWriter"));
				
				//호텔 수정 처리
				HotelIntroduceDao hotelIntroduceDao = new HotelIntroduceDao();
				boolean success = hotelIntroduceDao.update(hotelIntroduceDto);
				
				if(success) {
					resp.sendRedirect("detail.jsp?hotelIntroduceNo="+hotelIntroduceDto.getHotelIntroduceNo());
					
				}else {
					resp.sendError(404);
				}
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
			
	}

}
