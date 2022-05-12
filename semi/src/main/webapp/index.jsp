<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header -->
<jsp:include page="/template/header.jsp"></jsp:include>

            <!--메인 에니메이션 영역-->
            <!--슬라이드 이미지 변경 예정-->
            <section>
                    <div class="swiper">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <img src="<%=request.getContextPath()%>image/main_image1.jpg" width="100%" height="100%">
                            </div>
                            <div class="swiper-slide">
                              <img src="<%=request.getContextPath()%>image/main_image2.jpg" width="100%" height="100%">
                            </div>
                            <div class="swiper-slide">
                              <img src="<%=request.getContextPath()%>image/main_image3.jpg" width="100%" height="100%">
                            </div>
                            <div class="swiper-slide">
                                <img src="<%=request.getContextPath()%>image/main_image4.jpg" width="100%" height="100%">
                            </div>
                            ...
                        </div>
                        <div class="swiper-pagination"></div>
                        </div>
                    </div>
                    </div>
                </div>
            </section>

            <!--예약/검색 바 영역-->
            <section>
            <div class="container w800">
                <div class="row float-container">
                    <div class="float-left layer-4">
                        <select name="roomtype" class="form-input fill">
                            <option value="" disabled selected>객실타입을 선택하세요</option>
                            <option value="#">스탠다드룸</option>
                            <option value="#">디럭스룸</option>
                            <option value="#">프리미어룸</option>
                            <option value="#">스위트룸</option>
                        </select>
                    </div>
                    <div class="float-left layer-4">
                        <label>체크인</label>
                        <input type="date" name="check-in">
                    </div>
                    <div class="float-left layer-4">
                        <label>체크아웃</label>
                        <input type="date" name="check-out">
                    </div>
                    <div class="float-left layer-4">
                        <input type="submit" name="roomcheck" value="검색">
                    </div>
                </div>
                </div>
            </section>

            <!--객실 이미지 소개 영역-->
            <setion>
                <div class="container w800">객실이미지</div>
                <div class="row">

                </div>

            </setion>

 
 <!-- footer -->
<jsp:include page="/template/footer.jsp"></jsp:include>