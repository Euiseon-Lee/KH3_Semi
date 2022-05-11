<%-- <%@page import="semi.beans.BookingDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.BookingDao"%>
(Q) Product 검색 페이지

준비
<%
	request.setCharacterEncoding("UTF-8");
	String BookingRoomType = request.getParameter("BookingRoomType");
%>

처리
<%
	boolean isSearch = BookingRoomType != null && !BookingRoomType.equals("");
	BookingDao bookingDao = new BookingDao();
	List<BookingDto> list;
	if(isSearch){
		list = bookingDao.selectList(BookingRoomType);
	}
	else {
		list = bookingDao.selectList();
	}
%>

출력
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container w600 m30">

	<!-- 제목 -->
	<div class="row center">
		<h1>상품 검색</h1>	
	</div>
	
	<!-- 검색창 -->
	<div class="row center">
	
		<form action="list.jsp" method="get">

			<%if(type == null || type.equals("name")){%>
			<select name="type" class="form-input input-round">
				<option value="name" selected>이름</option>
				<option value="type">분류</option>
			</select>
			<%} else { %>
			<select name="type" class="form-input input-round">
				<option value="name">이름</option>
				<option value="type" selected>분류</option>
			</select>
			<%} %>
			
			<%if(isSearch){ %>
			<input type="search" name="keyword" class="form-input input-round" placeholder="검색어" value="<%=keyword%>">
			<%} else { %>
			<input type="search" name="keyword" class="form-input input-round" placeholder="검색어">
			<%} %>
			
			<input type="submit" value="검색" class="btn btn-primary">
		</form>
	</div>
	
	<div class="row right">
		<a href="add.jsp" class="link link-btn">등록</a>
	</div>
	
	<!-- 검색결과 -->
	<%if(list.isEmpty()){ %>
	<div class="row center">
		<h2>결과가 존재하지 않습니다</h2>
	</div>
	<%} else { %>
	<div class="row">
		<table class="table table-border">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>분류</th>
					<th>가격</th>
					<th>제조일</th>
					<th>폐기일</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody align="center">
				<%for(ProductDto productDto : list){ %>
				<tr>
					<td><%=productDto.getNo()%></td>
					<td>
						<a href="detail.jsp?no=<%=productDto.getNo()%>" class="link">
							<%=productDto.getName()%>
						</a>
					</td>
					<td>
						<a href="list.jsp?type=type&keyword=<%=productDto.getType()%>" class="link">
							<%=productDto.getType()%>
						</a>
					</td>
					<td><%=productDto.getPrice()%></td>
					<td><%=productDto.getMadeStringNotNull()%></td>
					<td><%=productDto.getExpireStringNotNull()%></td>
					<td>
						<a href="delete.kh?no=<%=productDto.getNo()%>">
							<img src="<%=request.getContextPath()%>/image/trash.jpg" width="20" height="20">
						</a>
					</td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
	<%} %>
</div> --%>