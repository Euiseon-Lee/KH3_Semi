package semi.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.QaDao;
import semi.beans.QaDto;

@WebFilter(urlPatterns = {
		
})
public class BoardOwnerFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
 		HttpServletResponse resp = (HttpServletResponse) response;
		try {
			//관리자는 모든 기능 가능
			String memberGrade = (String) req.getSession().getAttribute("auth");
			if(memberGrade.equals("관리자")) {
				chain.doFilter(request, response);
				return;
			}
			
			//작성자 본인 확인
			String memberId =(String)req.getSession().getAttribute("login");
			int qaNo = Integer.parseInt(req.getParameter("qaNo"));
			
			QaDao qaDao = new QaDao();
			QaDto qaDto = qaDao.selectOne(qaNo);
			if(memberId.equals(qaDto.getQaWriter())) {
				chain.doFilter(request, response);
			}
			else {
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
