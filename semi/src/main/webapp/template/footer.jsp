<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 구글 폰트 CDN -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/layout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/commons.css">

</section>

             
                <!--footer 영역-->
                <!--footer에 가로배치로 sns 이동 이미지링크 추가예정임-->
            <footer>
                    <div class="flex-container">
                            <div class="image-wrapper display-center">
                            <a href="<%=request.getContextPath()%>"> <!--로고 누르면 메인으로 이동-->
                            <img src="<%=request.getContextPath()%>/image/logo_004.png" width="200px" height="200px"></a>
                            </div>
                            <div class="content-wrapper">
                                <div class="row">
                            <br>
                            소개   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="<%=request.getContextPath()%>/hotelIntroduce/list.jsp"  class="link">호텔소개</a>&nbsp;&nbsp;
                                |&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/hotelIntroduce/detail.jsp?hotelIntroduceNo=2" class="link">호텔정보</a>&nbsp;&nbsp;
                                |&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/hotelIntroduce/detail.jsp?hotelIntroduceNo=3" class="link">층별안내도</a>&nbsp;&nbsp;
                                |&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/hotelIntroduce/detail.jsp?hotelIntroduceNo=4" class="link">사이트맵</a>
                            </div>

                            <div class="row">
                             이용약관  &nbsp;&nbsp; &nbsp;&nbsp;<a harf ="#" class="link">개인정보처리방침</a>&nbsp;&nbsp;
                                |&nbsp;&nbsp;<a harf ="#" class="link">홈페이지이용약관</a>&nbsp;&nbsp;
                                |&nbsp;&nbsp;<a harf ="#" class="link">숙박약관</a>
                            </div>
                
                        <div class="row">
                                <pre class="footer-text-bottom">
   <hr>
㈜AZURE

제주특별자치도 서귀포시 중문관광로 72번길 75 (우) 63535
TEL 064-735-5114 FAX. 064-753-5415

© 2022 AZURE HOTELS & RESORTS CO., LTD All rights reserved.
                                </pre>
                        </div>
                    </div>
            </footer>
            
</main>
</body>
</html>