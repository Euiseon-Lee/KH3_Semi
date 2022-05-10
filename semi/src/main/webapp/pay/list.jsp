<%@page import="semi.beans.PayDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.PayDao"%>
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
    	PayDao payDao = new PayDao();
    	List<PayDto> list;
    	if(search){
    		//list = qaDao.selectList(type, keyword);
    		list = payDao.selectListByPaging(p, s, type, keyword);
    	}
    	else{
    		//list = qaDao.selectList();
    		list = payDao.selectListByPaging(p, s);
    	}
    %>
    
    <!-- 숫자 링크 -->
    <%
    	int count;
    	if(search){//검색 결과 수 
    		count = payDao.countByPaging(type, keyword);
    	}
    	else{//목록 결과 수
    		count = payDao.countByPaging();
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
	 	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제내역 목록 페이지</title>
</head>
<body>
<div>
<h1>결제 내역</h1>
</div>

<div>	
	<table>
		<thead>
			<tr>
				<th>주문번호</th>
				<th>체크인</th>
				<th>체크아웃</th>
				<th>객실타입</th>
				<th>객실번호</th>
				<th>인원</th>

			</tr>
		</thead>
		<tbody>
			<%for(PayDto payDto: list){ %>
				<tr>
					<td><%=payDto.getPayOrderNo() %></td>
					<td>
					<a href="detail.jsp?payOrderNo=<%=payDto.getPayCheckIn() %>"><%=payDto.getPayCheckIn() %></a>
					</td>
					<td><%=payDto.getPayCheckOut() %></td>
					<td><%=payDto.getPayRoomType() %></td>
					<td><%=payDto.getPayRoomNo() %></td>
					<td><%=payDto.getPayPeopleNum() %></td>
				</tr>
			<%} %>
		</tbody>
		</table>
	</div>
	
	<!-- 페이지 -->
	<div>
	<!-- 이전 버튼 -->
		<%if(p>1){ %>
			<%if(search){ %>
				<a href="list.jsp?p=1&s=<%=s %>&type=<%=type %>&keyword=<%=keyword %>">&laquo;</a>
			<%}else{ %>
				<a href="list.jsp?p=1&s=<%=s %>">&laquo;</a>
			<%} %>
		<%} %>
		<%if(startBlock > 1){ %>
			<%if(search){ %>
			<a href="list.jsp?p=<%=startBlock-1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&lt;</a>
			<%} else { %>
			<a href="list.jsp?p=<%=startBlock-1%>&s=<%=s%>">&lt;</a>
			<%} %>
		<%} %>
		<!-- 숫자 링크 영역 -->
		<%for(int i=startBlock; i <= endBlock; i++){ %>
			<%if(search){ %>
				<%if(i == p){ %>
				<a href="list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>	
				<%} else { %>
				<a href="list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>
				<%} %>
			<%} else { %>
				<%if(i == p){ %>
				<a href="list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>	
				<%} else { %>
				<a href="list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
				<%} %>
			<%} %>
		<%} %>
		
		<!-- 다음 버튼 -->
		<%if(endBlock < lastPage){ %>
			<%if(search){ %>
			<a href="list.jsp?p=<%=endBlock+1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&gt;</a>
			<%} else { %>
			<a href="list.jsp?p=<%=endBlock+1%>&s=<%=s%>">&gt;</a>
			<%} %>
		<%} %>
		
		<%if(p < lastPage){ %>
			<%if(search){ %>
			<a href="list.jsp?p=<%=lastPage%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&raquo;</a>
			<%} else { %>
			<a href="list.jsp?p=<%=lastPage%>&s=<%=s%>">&raquo;</a>
			<%} %>
		<%} %>
	</div>

	<div>
	<a href="detail.jsp?payOrderNo="<%=request.getContextPath()%>">메인으로 이동</a>
</div>
</body>
</html>
