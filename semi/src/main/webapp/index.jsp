<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>
    /*swiper 버튼 하얀색으로 변경*/
    .swiper-pagination-bullet-active { 
        background: white;
    }

    .zindex{
        z-index: 2;
    }
</style>
 <!--jquery cdn-->
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

 <script type="text/javascript">
$(function(){
        var swiper = new Swiper('.swiper', {
        loop: true, //순환 모드
        autoplay:{ //자동재생
            delay:5000, //슬라이드 자동재생 시 교체시간(ms)
        },
        //이펙트 효과 지정
        effect:'fade',
        // If we need pagination
        pagination: {
            el: '.swiper-pagination',
            clickable: true
        },
        });

        var swiper_mainroom = new Swiper('.swiper_mainroom', {
        loop: true, //순환 모드
        //이펙트 효과 지정
        effect:'fade',
        // If we need pagination
        pagination: {
            el: '.swiper-pagination',
            clickable: true
        },
        });
     });
</script>

<!-- header -->
<jsp:include page="/template/header.jsp"></jsp:include>

            <!--메인 에니메이션 영역-->
            <!--슬라이드 이미지 변경 예정-->
            <section>
                    <div class="swiper">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                            	<div class="image-box image-thumbnail">
                                <img src="<%=request.getContextPath()%>/image/main_image1.jpg" width="100%" height="100%">
                                </div>
                            </div>
                            <div class="swiper-slide">
                            	<div class="image-box image-thumbnail">
                              <img src="<%=request.getContextPath()%>/image/main_image2.jpg" width="100%" height="100%">
                                   </div>
                            </div>
                            <div class="swiper-slide">
                                  <div class="image-box image-thumbnail">
                              <img src="<%=request.getContextPath()%>/image/main_image3.jpg" width="100%" height="100%">
                                  </div>
                            </div>
                            <div class="swiper-slide">
                                 <div class="image-box image-thumbnail">
                                <img src="<%=request.getContextPath()%>/image/main_image4.jpg" width="100%" height="100%">
                                   </div>
                            </div>
                            ...
                        </div>
                        <div class="swiper-pagination"></div>
                        </div>
                    </div>
                    </div>
                </div>
            </section>

<!-- 예약/검색 바 영역 (지우기로함) -->
           
<!--             <div class="container w800 m50"> -->
<!--                 <div class="row float-container"> -->
<!--                     <div class="float-left layer-4"> -->
<!--                                         <div class="row m10"> -->
<!--                         <select name="roomtype" class="form-input fill"> -->
<!--                             <option value="" disabled selected>객실타입을 선택하세요</option> -->
<!--                             <option value="#">스탠다드룸</option> -->
<!--                             <option value="#">디럭스룸</option> -->
<!--                             <option value="#">프리미어룸</option> -->
<!--                             <option value="#">스위트룸</option> -->
<!--                         </select> -->
                        
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="float-left layer-4"> -->
<!--                     <div class="row m10"> -->
<!--                         <label>&nbsp;&nbsp;&nbsp;체크인</label> -->
<!--                         <input type="date" name="check-in"> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="float-left layer-4"> -->
<!--                                         <div class="row m10"> -->
<!--                         <label>&nbsp;체크아웃</label> -->
<!--                         <input type="date" name="check-out"> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="float-left layer-4"> -->
<!--                                      <div class="row m10"> -->
<%--                         <a href="<%=request.getContextPath()%>/bookings/add.jsp"><input type="submit" name="roomcheck"  class="link link-btn"  value="search"></a> --%>
<!--                     </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 </div> -->
     

            <!--객실 이미지 소개 영역-->
            <section>         
            <div class="container m50">
            	<div class="row">
                    <h1>&nbsp;&nbsp;&nbsp;ROOM</h1>
                    </div>
                    <div class="row">
                    <a href="<%=request.getContextPath()%>/Roomcollection/Standard.jsp"  class="link">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VIEW MORE ></a>
                </div>
                
                        <!--객실 이미지 에니메이션 영역-->
            <!--슬라이드 이미지 변경 예정-->
                <div class="swiper swiper_mainroom back-box">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <img src="<%=request.getContextPath()%>/image/standard.jpg" width="120%" height="120%">
                            <a href="<%=request.getContextPath()%>/hotelintroduce/list.jsp" class="link zindex">view more ></a>
                        </div>
                        <div class="swiper-slide">
                          <img src="<%=request.getContextPath()%>/image/deluxe.jpg" width="120%" height="120%">
                        </div>
                        <div class="swiper-slide">
                          <img src="<%=request.getContextPath()%>/image/premier.jpg" wdth="120%" height="120%">
                        </div>
                        <div class="swiper-slide">
                            <img src="<%=request.getContextPath()%>/image/suit.jpg" width="120%" height="120%">
                        </div>
                    </div>
                        <!-- 슬라이드 이동 버튼 영역 -->
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                    </div>
                </div>
        </section>

        <!--부대시설 표시 영역-->
        <section>
            <div class="row m10">
            <h1>&nbsp;&nbsp;&nbsp;AMENITIES</h1>
            </div>
            <div>
                <a href="<%=request.getContextPath()%>/amenities/pool.jsp" class="link">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VIEW MORE ></a>
            </div>

            <div class="row float-container">
                <div class="float-left layer-3">
            <div class="container w500 m20 box-container box">
                <div class="imagebox image-thumbnail">
                <img src="<%=request.getContextPath()%>/image/main_image11.jpg" width="500px" height="300px">
                </div>
                </div>
            </div>
                <div class="float-left layer-3">
            <div class="container w500 m20 box-container box">
                <div class="imagebox image-thumbnail">
                <img src="<%=request.getContextPath()%>/image/main_image22.jpg"width="500px" height="300px">
                </div>
                </div>
            </div> 
                <div class="float-left layer-3">
            <div class="container w500 m20 box-container box">
                <div class="imagebox image-thumbnail">
                <img src="<%=request.getContextPath()%>/image/main_image33.jpg" width="500px" height="300px">
                </div>
                </div>
            </div>
         </div>
        </section>

 
 <!-- footer -->
<jsp:include page="/template/footer.jsp"></jsp:include>