g<%@page import="semi.beans.PayDto"%>
<%@page import="semi.beans.PayDao"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.ReviewReplyDao"%>
<%@page import="semi.beans.ReviewReplyDto"%>
<%@page import="semi.beans.MemberDto"%>
<%@page import="semi.beans.MemberDao"%>
<%@page import="semi.beans.ReviewDto"%>
<%@page import="semi.beans.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));

	//조회수 증가 코드
	ReviewDao reviewDao = new ReviewDao();
	reviewDao.plusReadcount(reviewNo);
	
	
	ReviewDto reviewDto = reviewDao.showDetail(reviewNo);

	
			
	//댓글 관리자만 수정가능한지 테스트위해 memberId 먼저 구현해놓음(한석)
	String memberId = (String)session.getAttribute("login");
	boolean isLogin = memberId != null;
	
	
	//세션이용해서 내 글인지 판단하는 코드 => 구현 완료
	boolean isOwner = memberId != null && memberId.equals(reviewDto.getReviewMemberId());	
	
	
	//작성자 아이디 및 등급 조회 코드
	String reviewWriter = reviewDto.getReviewMemberId();
	
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.selectOneId(reviewWriter);
	

	String reviewWriterGrade = memberDto.getMemberGrade();
	

	
	//관리자인지 판정하기 위한 코드 (이걸로 댓글 수정을 관리자만 가능하게 구현)
	String memberGrade = (String)session.getAttribute("auth");
	boolean isAdmin = memberGrade != null && memberGrade.equals("관리자");
	
				
	//댓글 목록 조회 코드(한석) 
	ReviewReplyDao reviewReplyDao = new ReviewReplyDao();
	// reviewDto에서 현제 jsp에 넣어져있는 reviewNo가져와서 사용함
	List<ReviewReplyDto> replylist = reviewReplyDao.selectList(reviewDto.getReviewNo());

%>    
    
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container w850 m10 center">	
	<div class="row center m40">
		<h2>[<%=reviewDto.getReviewNo()%>번 게시글]</h2>
	</div>
	
	<table class="table table-underline">
	
		<!-- 글제목, 작성자, 작성일시 및 조회수 출력 -->
		<tr>
			<td>
					<div align="left">
						<h2><%=reviewDto.getReviewTitle() %></h2>
					</div>
			</td>
		</tr>
	
		<tr>
			<td>
				<div align="right">
				<%=reviewWriter %>
				(<%= reviewWriterGrade %>)
				</div>
			</td>
		</tr>

		<tr>
			<td>
				<div align="right">
				<%=reviewDto.getReviewWritedate() %>
				조회수 <%=reviewDto.getReviewReadcount() %>
				</div>
			</td>
		</tr>
		
		
		<!-- 여기부터는 방 타입, 별점 및 글내용 출력 -->
		<tr>
			<td>[객실 타입: <%=reviewDto.getReviewRoomtype() %>] 별점 <%=reviewDto.getReviewStar() %>점</td>
		</tr>
		
		</table>
		<table class="table">
		<tr height="250">
			<td>
				<%=reviewDto.getReviewContent() %>
			</td>
		</tr>						
		</table>

		<!-- 기능 버튼 출력 -->


			<div class="right">
				<a class="link link-btn" href="list.jsp">글목록</a>
			

				<!-- 작성자 본인 또는 관리자면 수정 및 삭제 버튼 출력되도록 수정필요 !-->
				<%if(isOwner){ %>
				<a class="link link-btn" href="edit.jsp?reviewNo=<%=reviewNo%>">글수정</a>
				<a class="link link-btn" href="delete.kh?reviewNo=<%=reviewNo%>">글삭제</a>
				</div>
				<%} %>

				<%if(isAdmin){ %>
				<a class="link link-btn" href="delete.kh?reviewNo=<%=reviewNo%>">글삭제</a>
				</div>
				<%} %>
		
		
		<!-- 여기부터(댓글관련 코드-한석) 뒤에 코드끝지점 표시해놓음-->
		<!-- 댓글 작성 영역: 한석 -->
		<tr>
			<td align = "right">
			<%--작
			성할 때 공개or비공개 선택해서 나오게끔 구현(시간남으면) --%>
			<%if(isLogin){ %>
			<form action = "reply_insert.kh" method = "post">
				<input type = "hidden" name= "replyTarget" value = "<%=reviewDto.getReviewNo()%>"> 
				<textarea class="form-input fill input-round" name = "replyContent" rows ="4" cols = "95" required></textarea><br>
				<div 	align="right">
				<button type = "submit"  class="btn btn-primary">댓글 작성</button>
				</div>
			</form>
			<%}else{ %>
				
					<textarea rows = "4" cols = "70" disabled placeholder = "로그인 후 댓글 입력 가능" ></textarea>
					<input type = "submit" value = "댓글 작성" disabled>
 				
			<%}%>
			</td>
		</tr>		
		
		<!-- 댓글 목록 영역:  -->
		<tr>
			<td>
				<table  width = "95%">
					<%for(ReviewReplyDto reviewReplyDto : replylist){ %>
					<%
						//현재 로그인한 아이디본인이면서 관리자가 작성한 댓글인지 판단위한 코드
						boolean isMyReply = memberId != null && memberId.equals(reviewReplyDto.getReplyWriter());
					%>
					
					
					<!-- 수정이 가능(관리자만)한 경우라면 보여주기 위한 줄과 수정하기 위한 줄을 각각보여주자(jquery로 기능 업그레이드하자 한석아) -->
					
					<!-- 보여주기 위한 줄 -->
					<tr class = "show">
						<%--댓글 작성자 --%>
						<td width = "25%">
							<%=reviewReplyDto.getReplyWriter() %>
						</td>
						<%--댓글 작성시간 --%>
						<td width = "20%" >
							<%=reviewReplyDto.getReplyTime() %>
						</td>
						<%--댓글 내용 --%>
						<td width = "40%">
							<pre><%=reviewReplyDto.getReplyContent() %></pre>
						</td>	

						<td>
						<%--댓글 수정 이미지(본인이 쓴 댓글일때만 나오게)  --%>
						<%if(isMyReply){ %>											
						<a href = "#" class = "edit-btn">
						<img src = "<%=request.getContextPath() %>/image/edit.png" width = "20">
						</a>
						<%} %>
						<%-- 댓글 삭제 이미지(본인이 쓴 댓글일때만 나오게)--%>
						<%if(isMyReply || isAdmin){ %>
						<a href = "reply_delete.kh?replyNo=<%=reviewReplyDto.getReplyNo()%>&replyTarget=<%=reviewReplyDto.getReplyTarget()%>">
						<img src = "<%=request.getContextPath() %>/image/delete.png" width = "20">
						</a>
						<%} %>
						</td>
					</tr>
					<!--수정 할 수있도록 입력가능한 줄  -->
					<%if(isMyReply){ %>
					<tr align = "right" class = "edit">
						<td colspan = "3">
						<form action = "reply_edit.kh" method = "post">
								<input type = "hidden"  name = "replyNo" value = "<%=reviewReplyDto.getReplyNo() %>">
								<input type = "hidden" name= "replyTarget" value = "<%=reviewReplyDto.getReplyTarget()%>"> 
								<textarea name = "replyContent" rows ="2" cols = "100"><%=reviewReplyDto.getReplyContent() %></textarea><br>
								<input type ="button" value = "변경 취소" class = "cancel-btn"> 
								<input type = "submit" value = "댓글 수정">
						</form>
						</td>
					</tr>
					<%} %>
					<% } %>
				</table>
			</td>

		</tr>
		<!-- jquery이용해서 수정,취소버튼 누를시 화면 변경되게 구현 -->
			<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
		//class="edit-btn"를 클릭하면 class="show-row"를 숨기고 class="show-row" 뒷부분을 보여준다.
		$(".edit-btn").click(function(){
			$(this).parents(".show").hide();
			$(this).parents(".show").next().show();
		});
		
		//class="cancel-btn"를 클릭하면 class="edit-row"를 숨기고 class="edit-row" 앞부분을 보여준다.
		$(".cancel-btn").click(function(){
			$(this).parents(".edit").hide();
			$(this).parents(".edit").prev().show();
		});
		
		//최초에 class="edit-row"는 숨긴다.
		$(".edit").hide();
	});
</script>

		<!-- 여기까지(댓글관련 코드-한석) -->				
</div>

		
<jsp:include page="/template/footer.jsp"></jsp:include>