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

@WebFilter(urlPatterns = {
		"/qa/write.jsp", "/qa/write.kh",
		"/qa/edit.jsp", "/qa/edit.kh",
		"/qa/delete.kh",
		"/qa/check.jsp", "/qa/checkpw.kh",
		"/review/edit.jsp", "/review/write.jsp",
		"/review/write.kh", "/review/edit.kh", "/review/delete.kh"
})
public class LoginFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		try {
			String memberId = (String) req.getSession().getAttribute("login");
			
			if(memberId == null) {//로그인 상태가 아닐 경우
				//로그인 페이지로 이동
				resp.sendRedirect(req.getContextPath()+"/member/login.jsp");
			}
			else {
				chain.doFilter(request, response);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
