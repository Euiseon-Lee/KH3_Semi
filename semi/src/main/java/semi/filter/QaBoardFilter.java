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

import semi.beans.MemberDao;
import semi.beans.MemberDto;
import semi.beans.QaDao;
import semi.beans.QaDto;

//@WebFilter(filterName = "f3", urlPatterns = "/qa/detail.jsp")
public class QaBoardFilter implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		try {
			//req.getSession().removeAttribute("password");
			int qaNo = Integer.parseInt(req.getParameter("qaNo"));
			int groupNo = Integer.parseInt(req.getParameter("groupNo"));
			String memberId = (String) req.getSession().getAttribute("id");
			String memberCheckPw = (String)req.getSession().getAttribute("password");

			QaDao qaDao = new QaDao(); 
			QaDto qaDto = qaDao.selectOne(qaNo);
			
			MemberDao memberDao = new MemberDao();
			MemberDto memberDto = memberDao.selectOneId(memberId);
			
	        String firstWriter = qaDao.firstWriter(groupNo);
	         
			
			if (qaDto.getQaPublic() == null) {// 공개글이라면 통과
				chain.doFilter(request, response);
			} else {// 비공개글일 경우
				//관리자 확인
				String memberGrade = (String) req.getSession().getAttribute("auth");
				if (memberGrade != null && memberGrade.equals("관리자")) {
					chain.doFilter(request, response); 
				}
				// 작성자 본인 확인
				else if (memberDto != null && memberId.equals(firstWriter) && memberCheckPw != null && memberCheckPw.equals(memberDto.getMemberPw())) {
					// 세션에 저장한 비밀번호가 일치할 경우 통과
					chain.doFilter(request, response);
//				else if(memberId != null){
//					qaDto.getQaWriter()
				}else if(memberId != null && memberId.equals(firstWriter)){
					// 비밀번호 입력 페이지로 이동 -> 세션에 비밀번호를 저장
					resp.sendRedirect(req.getContextPath()+"/qa/check.jsp?qaNo="+qaNo+"&groupNo="+groupNo);
				} else {
					resp.sendRedirect(req.getContextPath()+"/qa/block.jsp");
				}
				
			} 
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}