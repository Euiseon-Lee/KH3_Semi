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

	 	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제내역 목록 페이지</title>
</head>
<body>

	<!-- 확인용 세션찍기 -->
	<h3>login = <%= login %></h3>
	<h3>memberId = <%= payMemberId %></h3>


<div>
	<h1>결제 내역</h1>
</div>

<div>	
	<table border ="1">
		<thead>
			<tr>
				<th>주문번호</th>
				<th>객실유형</th>
				<th>체크인</th>
				<th>체크아웃</th>
				<th>인원</th>
				<th>결제 금액</th>
				<th>리뷰 작성하러가기</th>
			</tr>
		</thead>
		<tbody>
			<%for(PayDto payDto: list){ %>
				<tr>
					<td>
						<a href="detail.jsp?payOrderNo=<%=payDto.getPayOrderNo() %>">
							<%=payDto.getPayOrderNo() %>번
						</a>
					</td>
					<td><%=payDto.getPayRoomtype()%> [<%=payDto.getPayRoomNo() %>호]</td>
					<td><%=payDto.getPayCheckIn() %></td>
					<td><%=payDto.getPayCheckOut() %></td>
					<td><%=payDto.getPayPeople() %></td>
					<td><%=payDto.getPayTotalPrice() %></td>
					<td>
						<a href = "<%=request.getContextPath()%>/review/write.jsp?payOrderNo=<%=payDto.getPayOrderNo()%>" >리뷰 작성하러가기</a>	
					</td>
				</tr>
			<%} %>
		</tbody>
		</table>
	</div>
	
	<!-- 페이지 -->
	<div>
	<!-- 이전 버튼 -->
		<%if(p>1){ %>
			<a href="list.jsp?p=1&s=<%=s %>">&laquo;</a>
		<%} %>
		<%if(startBlock > 1){ %>
			<a href="list.jsp?p=<%=startBlock-1%>&s=<%=s%>">&lt;</a>
		<%} %>
		<!-- 숫자 링크 영역 -->
		<%for(int i=startBlock; i <= endBlock; i++){ %>
			<%if(i == p){ %>
				<a href="list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>	
			<%} else { %>
				<a href="list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
			<%} %>
		<%} %>
		
		<!-- 다음 버튼 -->
		<%if(endBlock < lastPage){ %>
			<a href="list.jsp?p=<%=endBlock+1%>&s=<%=s%>">&gt;</a>
		<%} %>
		
		<%if(p < lastPage){ %>
			<a href="list.jsp?p=<%=lastPage%>&s=<%=s%>">&raquo;</a>
		<%} %>
	</div>

	<div>
	<a href="<%=request.getContextPath()%>/index.jsp">메인으로 이동</a>
</div>
</body>
</html>
