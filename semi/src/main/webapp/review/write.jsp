<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action = "write.azure" method ="post">
		<div>
		
			<div>
				<h1>후기 게시판 (디자인 전)</h1>
			</div>
			
			<div>
				<input type="text" name="reviewTitle" 
					placeholder="제목을 입력해주세요"
					autocomplete="off" required>	
			</div>
			
			<div>
				<label> 별점
					<select>
						<option value="">선택해주세요</option>
						<option value="1">1점</option>
						<option value="2">2점</option>
						<option value="3">3점</option>
						<option value="4">4점</option>
						<option value="5">5점</option>
					</select>
				</label>	
			</div>
			
			<div>
				<textarea name="reviewContent" rows = "15"
					placeholder="내용을 입력해주세요"
					autocomplete="off" required></textarea>
			</div>

			<div>
				<button type="submit">등록</button>
			</div>
			
			<div>
				<a href="list.jsp">목록</a>
			</div>
					
		</div>
	</form>

</body>
</html>