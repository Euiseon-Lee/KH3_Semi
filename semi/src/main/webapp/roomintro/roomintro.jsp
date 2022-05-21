<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header -->
<jsp:include page="/template/header.jsp"></jsp:include>
  
  
    <style>
    
     /*.hotel {
        background-color:  	#F5DEB3;
    }
    
    .hotel__description {
        display: inline-block;
        width: 45rem;
        margin-top: 5rem;
        margin-bottom: 6rem;
    }
      
    .hotel__description > h2 {
        font-size: 2.5rem;
        margin-bottom: 0.8rem;
    }
      
    .hotel__description > p {
        font-size: 1.2rem;
        line-height: 1.8rem;
    }
    
    
    
    .rooms {
        justify-content: space-evenly;
    }

    */
   

  
    .rooms__img {
        width: 25rem;
        height: 15rem;
        margin-bottom: 1rem;
        cursor: pointer;
        box-shadow: 0.5rem 1rem 1rem rgba(0,0,0, .4);
    }

    /* .rooms__container > h3 {
        font-size: 1.6rem;
        font-weight: 400;
        margin-bottom: 0.4rem;
        
      }*/
      
       /*자식선택자만 적용 */
      .rooms__container > p { 
        font-size: 1.1rem;
        line-height: 1.5rem;
        margin-bottom: 1.0rem;
      }
      
      .rooms__button {
        height: 2.0rem;
        width: 3.5rem;
        padding: 0.3rem;
        font-size: 0.5rem;
        font-weight: bold;
        background:  whitesmoke;
        border: 1px solid black;
        box-shadow: 2px 5px 6px #000;
        cursor: pointer;
        outline: none;
        transition: all 0.12s ease-in-out;
       
      }
      
      .rooms__button:hover {
        background-color: white;
      }
      
      .rooms__button:active {
        background-color: gray;
        box-shadow: 1px 3px 4px #000;
        transform: translate(3px);
      }
        
     .rooms__standard{
        float:left;
  	    
      }

      .rooms__deluxe{
        float: right;
	 
      }

      .rooms__suite{
        float: right;
       
      }
      
      .rooms__premier{
        
        float: left;
        
      }
      
    </style>
    
</head>
<body>
    
    <!-- Rooms -->
    <section class="hotel">
       <div class="hotel__wrapper">
        <div class="hotel__description">
          <p>
          </p>
        </div>
        </div>
        <div class="rooms">
          <div class="rooms__standard rooms__container">
            <div>
            <img
              class="rooms__img"
              src="<%=request.getContextPath()%>/image/standard.jpg"
            />
            <h3>스탠다드</h3>
            <p>
              스탠다드에 대한 설명 
            </p>
            <button class="rooms__button">예약하기</button>
            </div>
          </div>

          <div class="rooms__deluxe rooms__container">
            <div>
            <img
              class="rooms__img"
              src="<%=request.getContextPath()%>/image/deluxe.jpg"
            />
            <h3>디럭스</h3>
            <p>
              디럭스에 대한 설명 
            </p>
            <button class="rooms__button">예약하기</button>
            </div>
          </div>
			
          <div class="rooms__premier rooms__container">
            <img
              class="rooms__img"
              src="<%=request.getContextPath()%>/image/premier.jpg"
            />
            <h3>프리미어</h3>
            <p>
              프리미어에 대한 설명 
            </p>
            <button class="rooms__button">예약하기</button>
          </div>

          <div class="rooms__suite rooms__container">
            <img
              class="rooms__img"
              src="<%=request.getContextPath()%>/image/suite.jpg"
            />
            <h3>스위트</h3>
            <p>
              스위트에 대한 설명 
            </p>
            <button class="rooms__button">예약하기</button>
          </div>
        </div>
      </section>
    

 <!-- footer -->
<jsp:include page="/template/footer.jsp"></jsp:include>