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

/**
	Filter에서는 주소에 패턴(*)을 설정할 수 있다.
	반드시 다음 규칙에 해당되어야 한다.
	[1] / 로 시작해서 * 로 끝나야 한다
			= /* : 전체
			= /member/* : 회원전체
	[2] * 로 시작해서 확장자로 끝나야 한다
			= *.jsp : 모든 JSP 페이지
			= *.kh : 모든 서블릿
			= *.png : 모든 png 이미지
 */

public class UTF8Filter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		try {
//			System.out.println("인코딩필터 실행!");
			req.setCharacterEncoding("UTF-8");
			chain.doFilter(request, response);//통과
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}