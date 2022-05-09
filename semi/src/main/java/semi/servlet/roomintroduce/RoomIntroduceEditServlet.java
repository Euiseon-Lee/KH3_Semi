package semi.servlet.roomintroduce;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.RoomIntroduceDao;
import semi.beans.RoomIntroduceDto;

@WebServlet(urlPatterns = "/roomIntroduce/edit.kh")
public class RoomIntroduceEditServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
				req.setCharacterEncoding("UTF-8");
				//호텔 객체 생성후  데이터 넣기  
				RoomIntroduceDto roomIntroduceDto = new RoomIntroduceDto();
				roomIntroduceDto.setRoomIntroduceNo(Integer.parseInt(req.getParameter("roomIntroduceNo")));
				roomIntroduceDto.setRoomIntroduceHead(req.getParameter("roomIntroduceHead"));
				roomIntroduceDto.setRoomIntroduceContent(req.getParameter("roomIntroduceContent"));
				roomIntroduceDto.setRoomIntroduceWriter(req.getParameter("roomIntroduceWriter"));
				
				//호텔 수정 처리
				RoomIntroduceDao roomIntroduceDao = new RoomIntroduceDao();
				boolean success = roomIntroduceDao.update(roomIntroduceDto);
				
				if(success) {
					resp.sendRedirect("detail.jsp?roomIntroduceNo="+roomIntroduceDto.getRoomIntroduceNo());
					
				}else {
					resp.sendError(404);
				}
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
			
	}

}
