<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header -->
<jsp:include page="/template/header.jsp"></jsp:include>

<style>
        .book{
        background: linear-gradient(rgba(0, 0, 0, 0.85), rgba(0, 0, 0, 0.85)),url("image/stanadard.jpg") center/cover no-repeat;
        color:  #fff;
        padding: 40px 60px;
        }

        .book-form{
            display: grid;
        }
        .form-item{
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .book-form input[type = "submit"]{
            margin: 18px 0 0 0;
            background: darkblue;
            color:   #fff;
            border: 1px solid #fff;
        }

        .book-form label, .book-form input{
            width: 100%;
        }

        .book-form {
            font-weight: 600;
            word-spacing: 5px;
        }

        .book-form label{
            font-weight:600;
            word-spacing: 5px;
            padding-bottom: 8px;
        }

        .book-form input:focus{
            outline:0;
            box-shadow:0 0 7px rgba(0, 0, 0, 0.4);
        }

        @media(min-width: 768px){
            .book-form{
                grid-template-columns: repeat(2, 1fr);
                grid-gap: 24px
            }


        @media(min-width: 1170px){
            .book-form{
                grid-template-columns: repeat(3, 1fr);
            }

        @media(min-width: 1370px) {
            .book-form{
                grid-template-columns: 2fr 2fr 1fr 1fr 1fr 2fr;
            }
            .book{
                height: 40vh;
                display: grid;
            }
        } 

        @media(max-width: 500px){};
            .book{
                padding-left: 20px;
                padding-right: 20px;
            }
        }
    </style>
</head>
<body>
    <div class = "book">
        <form class = "book-form">
            <div class = "form-item">
                <label for = "checkin-date">Check In Date: </label>
                <input type = "date" id = "chekin-date">
            </div>
            <div class = "form-item">
                <label for = "checkout-date">Check Out Date: </label>
                <input type = "date" id = "chekout-date">
            </div>
            <div class = "form-item">
                <label for = "adult">Adults: </label>
                <input type = "number" min = "1" value = "1" id = "adult">
            </div>
            <div class = "form-item">
                <label for = "children">Children: </label>
                <input type = "number" min = "1" value = "1" id = "children">
            </div>
            <div class = "form-item">
                <label for = "rooms">Rooms: </label>
                <input type = "number" min = "1" value = "1" id = "rooms">
            </div>
            <div class = "form-item">
                <input type = "submit" class = "btn" value = "Book Now">
            </div>
        </form>
    </div>

</body>





 <!-- footer -->
<jsp:include page="/template/footer.jsp"></jsp:include>