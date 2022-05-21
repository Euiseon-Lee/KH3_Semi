<%@page import="semi.beans.QaDao"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.QaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		
		//페이지 관련 파라미터 수신
		int p;
		try{
			p= Integer.parseInt(request.getParameter("p"));
			if(p <= 0) throw new Exception();
		}
		catch(Exception e){
			p = 1;
		}
		
		int s;
		try{
			s = Integer.parseInt(request.getParameter("s"));
			if(s <= 0) throw new Exception();
		}
		catch(Exception e){
			s = 10;
		}
    %>
    
    <%
    	boolean search = type != null && keyword != null;
    	QaDao qaDao = new QaDao();
    	List<QaDto> list;
    	if(search){
    		//list = qaDao.selectList(type, keyword);
    		list = qaDao.selectListByPaging(p, s, type, keyword);
    	}
    	else{
    		//list = qaDao.selectList();
    		list = qaDao.selectListByPaging(p, s);
    	}
    %>
    
    <!-- 숫자 링크 -->
    <%
    	int count;
    	if(search){//검색 결과 수 
    		count = qaDao.countByPaging(type, keyword);
    	}
    	else{//목록 결과 수
    		count = qaDao.countByPaging();
    	}
    	
    	//블록 크기
    	int lastPage = (count + s - 1) / s;
    	
    	//페이지 당 게시글 수
    	int blockSize = 10;
    	
    	int endBlock = (p + blockSize - 1) / blockSize * blockSize;
    	int startBlock = endBlock - (blockSize - 1);
    	
    	if(endBlock > lastPage){
    		endBlock = lastPage;
    	}
    %>
    <%
    	//목록으로 돌아올 경우 비밀번호 세션 삭제
    	request.getSession().removeAttribute("password");
    %>
 
<jsp:include page="/template/header.jsp"></jsp:include>
<div class="container w850 m10">
	<div class="row center m40">
		<h1>Q/A 게시판</h1>
	</div>
	
	<div class="right m10">
		<a href="<%=request.getContextPath() %>/qa/write.jsp" class="link link-btn link-btn:hover">문의하기</a>
	</div>
	
	<div class="row center">
		<table class="table table-underline table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th width="40%">제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<%for(QaDto qaDto : list){ %>
				<tr>
					<td><%=qaDto.getQaNo() %></td>
					<td>
					<%-- 답글 depth 띄어쓰기 처리 --%>
					<div align="left">
					<%if(qaDto.getDepth()>0) {%>
						<%for(int i=0; i<qaDto.getDepth(); i++){ %>
						&nbsp;&nbsp;&nbsp;&nbsp;
							<%} %>
						<img src="<%=request.getContextPath()%>/image/reply.png" width="20" height="20">
						<%} %>
						<%if(qaDto.getQaPublic()==null){ %>
					<a class="link link-hover" href="<%=request.getContextPath()%>/qa/detail.jsp?qaNo=<%=qaDto.getQaNo()%>&groupNo=<%=qaDto.getGroupNo()%>"><%=qaDto.getQaTitle() %></a>
					<%}else{ %>
					<img src="<%=request.getContextPath() %>/image/locked.png" width="20" height="20">
					<a class="link link-hover" href="<%=request.getContextPath()%>/qa/detail.jsp?qaNo=<%=qaDto.getQaNo()%>&groupNo=<%=qaDto.getGroupNo()%>"><%=qaDto.getQaTitle() %></a>
					<%} %>
					</td>
					</div>
					<td><%=qaDto.getQaWriter() %></td>
					<td><%=qaDto.getQaWritedate() %></td>
					<td><%=qaDto.getQaReadcount() %></td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
	
	<!-- 페이지 -->
	<div class="row center m20 pagination">
	<!-- 이전 버튼 -->
		<%if(p>1){ %>
			<%if(search){ %>
				<a href="<%=request.getContextPath()%>/qa/list.jsp?p=1&s=<%=s %>&type=<%=type %>&keyword=<%=keyword %>">&laquo;</a>
			<%}else{ %>
				<a href="<%=request.getContextPath()%>/qa/list.jsp?p=1&s=<%=s %>">&laquo;</a>
			<%} %>
		<%} %>
		<%if(startBlock > 1){ %>
			<%if(search){ %>
			<a href="<%=request.getContextPath()%>/qa/list.jsp?p=<%=startBlock-1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&lt;</a>
			<%} else { %>
			<a href="<%=request.getContextPath()%>/qa/list.jsp?p=<%=startBlock-1%>&s=<%=s%>">&lt;</a>
			<%} %>
		<%} %>
		<!-- 숫자 링크 영역 -->
		<%for(int i=startBlock; i <= endBlock; i++){ %>
			<%if(search){ %>
				<%if(i == p){ %>
				<a class="active" href="<%=request.getContextPath()%>/qa/list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>	
				<%} else { %>
				<a href="<%=request.getContextPath()%>/qa/list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>
				<%} %>
			<%} else { %>
				<%if(i == p){ %>
				<a class="active" href="<%=request.getContextPath()%>/qa/list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>	
				<%} else { %>
				<a href="<%=request.getContextPath()%>/qa/list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
				<%} %>
			<%} %>
		<%} %>
		
		<!-- 다음 버튼 -->
		<%if(endBlock < lastPage){ %>
			<%if(search){ %>
			<a href="<%=request.getContextPath()%>/qa/list.jsp?p=<%=endBlock+1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&gt;</a>
			<%} else { %>
			<a href="<%=request.getContextPath()%>/qa/list.jsp?p=<%=endBlock+1%>&s=<%=s%>">&gt;</a>
			<%} %>
		<%} %>
		
		<%if(p < lastPage){ %>
			<%if(search){ %>
			<a href="<%=request.getContextPath()%>/qa/list.jsp?p=<%=lastPage%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&raquo;</a>
			<%} else { %>
			<a href="<%=request.getContextPath()%>/qa/list.jsp?p=<%=lastPage%>&s=<%=s%>">&raquo;</a>
			<%} %>
		<%} %>
		
	</div>
	<!-- 검색창 -->
	<div class="row center m10">
		<form action="list.jsp" method="get">
			<select name ="type" class="form-input input-round">
				<option value ="qa_title">제목</option>
				<option value="qa_content">내용</option>
			</select>
			<input type ="search" name="keyword" placeholder="검색어를 입력해주세요" required autocomplete="off">
			<button type ="submit" class="btn btn-primary">검색</button>
		</form>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>