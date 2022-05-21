<%@page import="semi.beans.MemberDto"%>
<%@page import="semi.beans.PayDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.PayDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
   
    <%
 	//결제페이지 특성상 특정 아이디가 결제내역만이 나와야한다
	//어떻게 특정할것인가? payMemberId를 검색하는 조회구문이 필요하다
	//조회구문에서 사용할 String PayMemberId 부터 만들자
	//어디서 회원정보를 가져올까? = 세션에서 가져오자
	String memberId = (String)session.getAttribute("login");
	boolean login = memberId != null;
	
	String payMemberId = (String)request.getSession().getAttribute("id");
	
	%>
    <% 	   
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
    	PayDao payDao = new PayDao();
		List<PayDto> list = payDao.selectPayListByPaging(payMemberId, p, s);
    %>
    
    <!-- 숫자 링크 -->
    <%
    	// 글 총 개수
    	int count = payDao.countByPaging();
    	
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

	 	
<jsp:include page="/template/header.jsp"></jsp:include>


<div class="container w850 m10 center">
	<div class="row center m40"">
		<h1 class="title-text">결제 내역</h1>
	</div>

	<div class="row center m50">	
		<table class="table table-underline table-hover">
			<thead>
				<tr>
					<th width="10%" class="middle-text-center" style="font-weight: bold">주문번호</th>
					<th width="20%" class="middle-text-center" style="font-weight: bold">객실유형</th>
					<th width="20%" class="middle-text-center" style="font-weight: bold">체크인</th>
					<th width="20%" class="middle-text-center" style="font-weight: bold">체크아웃</th>
					<th width="10%" class="middle-text-center" style="font-weight: bold">인원</th>
					<th width="20%" class="middle-text-center" style="font-weight: bold">결제 금액</th>
				</tr>
			</thead>
			<tbody>
				<%for(PayDto payDto: list){ %>
					<tr>
						<td style=" color: rgb(39, 76, 119)">
							<a href="<%=request.getContextPath()%>/review/detail.jsp?payOrderNo=<%=payDto.getPayOrderNo() %>" class="link link-btn">
								<%=payDto.getPayOrderNo() %>번
							</a>
						</td>
						<td style=" color: rgb(39, 76, 119)"><%=payDto.getPayRoomtype()%> [<%=payDto.getPayRoomNo() %>호]</td>
						<td style=" color: rgb(39, 76, 119)"><%=payDto.getPayCheckIn() %></td>
						<td style=" color: rgb(39, 76, 119)"><%=payDto.getPayCheckOut() %></td>
						<td style=" color: rgb(39, 76, 119)"><%=payDto.getPayPeople() %></td>
						<td style=" color: rgb(39, 76, 119)"><%=payDto.getPayTotalPrice() %></td>
					</tr>
				<%} %>
			</tbody>
		</table>
	</div>
	
	<div class="row center pagination">
	<!-- 이전 버튼 -->
		<%if(p>1){ %>
			<a href="<%=request.getContextPath()%>/review/list.jsp?p=1&s=<%=s %>">&laquo;</a>
		<%} %>
		<%if(startBlock > 1){ %>
			<a href="<%=request.getContextPath()%>/review/list.jsp?p=<%=startBlock-1%>&s=<%=s%>">&lt;</a>
		<%} %>
		<!-- 숫자 링크 영역 -->
		<%for(int i=startBlock; i <= endBlock; i++){ %>
			<%if(i == p){ %>
				<a href="<%=request.getContextPath()%>/review/list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>	
			<%} else { %>
				<a href="<%=request.getContextPath()%>/review/list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
			<%} %>
		<%} %>
		
		<!-- 다음 버튼 -->
		<%if(endBlock < lastPage){ %>
			<a href="<%=request.getContextPath()%>/review/list.jsp?p=<%=endBlock+1%>&s=<%=s%>">&gt;</a>
		<%} %>
		
		<%if(p < lastPage){ %>
			<a href="<%=request.getContextPath()%>/review/list.jsp?p=<%=lastPage%>&s=<%=s%>">&raquo;</a>
		<%} %>
	</div>

</div>

<jsp:include page="/template/footer.jsp"></jsp:include>
