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

@WebFilter(urlPatterns = "/qa/detail.jsp")
public class QaBoardFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
		throws IOException, ServletException {
	 		HttpServletRequest req = (HttpServletRequest) request;
	 		HttpServletResponse resp = (HttpServletResponse) response;
			try {//공개글이라면 통과
				int qaNo = Integer.parseInt(req.getParameter("qaNo"));
				
				QaDao qaDao = new QaDao();
				QaDto qaDto = qaDao.selectOne(qaNo);
				if(qaDto.getQaPublic() == null) {
					chain.doFilter(request, response);
				}
//				else {//비공개글일 경우 //세션에서 아이디 불러와서 수정 필요
//					//관리자 확인구문 필요
//					//작성자 본인 확인
//					String memberId= (String)req.getSession().getAttribute("login");
//					if(memberId.equals(qaDto.getQaWriter())) {
//						chain.doFilter(request, response);
//					}
					else {//관리자 혹은 본인이 아닌경우
						resp.sendRedirect("check.jsp");					
					}
//				}
	}
	catch(Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}
}
}