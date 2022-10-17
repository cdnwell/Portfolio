<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/register.css">
    <style>
        @font-face {
            font-family: Reminder;
            src: url(fonts/ReminderCautionDemoRegular.woff) format('woff');
        }

        * {
            margin: 0;
            padding: 0;
        }

        body {
            display: flex;
            flex-direction: column;
        }

        .body_image {
            width: 100%;
            height: 600px;
            overflow: hidden;
            position: relative;
        }

        .item {
            width: 100%;
            min-width: 1000px;
            display: none;
            filter: brightness(75%);
        }

        .body_image div {
            display: inline;
            position: absolute;
        }

        .body_image_text {
            color: white;
            font-size: 20px;
            width: 40%;
            height: 20%;
            position: absolute;
            left: 30%;
            bottom: 0;
            text-align: center;
        }

        .body_image_text p:first-of-type {
            font-weight: bold;
        }

        .image_text_eng {
            font-family: 'Reminder';
            font-size: 40px;
        }

        .image_text_kor {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }




        #section {
            padding: 100px 0;
            display: flex;
            flex-direction: column;
        }

        .section_title {
            width: 40%;
            padding: 30px;
            border: 1px solid #131C2B;
            border-radius: 3px;
            align-self: center;
            text-align: center;
        }

        .section_title_btn {
            align-self: center;
            margin-top: 60px;
        }

        .section_title_btn>button {

            width: 200px;
            padding: 10px;
            border: 1px solid #131C2B;
            border-radius: 5px;
            color: white;
            background-color: #131C2B;
        }

        .map_box {
            align-self: center;
            display: flex;
            flex-direction: row;
            width: 60%;
            padding: 60px 0;
        }   

        #map {
            
            width: 60%;
            height: 600px;
            border-radius: 10px;
            border: 1px solid #131C2B;
        }

        .map_explain {
            margin-top: 80px;
            margin-left: 5%;
            width: 35%;
            padding: 3px;
        }

        .map_bold {
            font-size: 22px;
            font-family: Reminder;
        }

        .section_recommend{
            align-self: center;
            width: 60%;
            padding-top: 60px;
        }

        .section_recommend fieldset{
            padding: 15px;
            border-radius: 5px;
            border: 1px solid #b7b7b7;
        }

        .section_recommend legend{
            font-size: 20px;
            font-weight: bold;
        }

        /* 추천 이미지 3개 담은 박스 */
        .recommend_box{
            padding: 60px 0;
            
            display: flex;            
            flex-direction: column;
        }

        .recommend_box > div > div{
            width: 30%;
            margin-left: 3%;
            margin-top: 50px;
            border-radius: 5px;
            display: flex;
            flex-direction: column;
        }
        
        .recommend_box > div > div > div:last-of-type{
            display: flex;
            flex-direction: row;
            width: 100%;
            height: 100%;
        }

        .recommend_box > div > div > div:last-of-type > a:last-of-type{
            border-left: 1px solid #b7b7b7;
        }

        .recommend_box img{
            width: 100%;
            height: 265px;
            min-height: 210px;
            border-bottom: 1px solid #b7b7b7;
            border-radius: 5px;
        }

        .recommend_box a{
            align-self: center;
            display: inline-block;
            box-sizing: border-box;
            width: 50%;
            text-decoration: none;
            color: #131C2B;
            padding: 5px;
            text-align: center;
        }

        .recommend_box a:hover{
            font-weight: bold;
        }

        .recommend_row1,
        .recommend_row2,
        .recommend_row3{
            display: flex;
            flex-direction: row;
        }

        .section_image_explain{
            align-self: center;
            width: 60%;
            padding : 60px 0;
            display: flex;
            flex-direction: row;
            position: relative;
            height: 665px;
        }

        .explain_image{
            width: 75%;
            
        }
        
        .explain_image img:first-of-type{
            position: absolute;
            /*설명 이미지 박스 줄어들 때 높이가 줄어들지 않고 가로만 줄어듦*/
            width: 72%;
            height: 545px;
            border-radius: 5px;
        }

        .explain_image img:nth-child(2),
        .explain_image img:nth-child(3),
        .explain_image img:nth-child(4)
        {
            position: absolute;
            width: 20%;
            height: 135px;
            bottom: 200px;
        }   
        
        .explain_image img:nth-child(2){
            left: 2%;
            border-radius: 5px;
            filter: brightness(60%);
            cursor: pointer;
        }

        .explain_image img:nth-child(3){
            left: 26%;
            border-radius: 5px;
            filter: brightness(60%);
            cursor: pointer;
        }

        .explain_image img:nth-child(4){
            left: 50%;
            border-radius: 5px;
            filter: brightness(60%);
            cursor: pointer;
        }

        .explain_text{
            width: 25%;
            padding: 15px;
        }


        


        #login {
            position: fixed;
            top: 200px;
            left: calc(50% - 200px);
            background-color: white;
            border: 1px solid #131C2B;
            border-radius: 10px;
            width: 400px;
            height: 400px;
            z-index: 50;

            box-shadow: rgba(0, 0, 0, 0.5) 0 0 0 9999px;

            display: none;
        }

        #login_frm {
            position: relative;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100%;
            width: 100%;
        }

        #login_frm img:hover{
            filter: brightness(80%);
        }

        .login_img_box {
            text-align: center;
            height: 120px;
            display: flex;
            flex-direction: row;
            
        }

        .login_img_box img{
            display: inline-block;
            width: 125px;
            margin-left: -50px;
        }

        .login_box_p {
            margin-left: -25px;
            align-self: center;
            font-size: 24px;
            font-weight: bold;
        }

        #login_frm input {
            width: 240px;
            padding: 10px;
            border-radius: 0;
            border: 1px solid black;
            outline: none;
        }

        #login_frm input:first-of-type {
            border-bottom: none;
        }

        #login_frm button {
            margin-top: 20px;
            width: 264px;
            padding: 10px;
            border: 1px solid #131C2B;
            background-color: white;
            border-radius: 5px;
        }

        #login_frm button:hover {
            background-color: #131C2B;
            color: white;
        }

        #custom-login-btn img {
            position: absolute;
            left: calc(50% - 133px);
            margin-top: 7px;
            width: 265px;
            height: 41px;
        }

        #naver_id_login img{
            position: absolute;
            width: 265px;
            left: calc(50% - 133px);
            margin-top: 57px;
            height: 41px;
        }

        #naver_id_login img:hover{
            filter: brightness(80%);
        }

        /*
            body에 속성을 추가해 스크롤이 안되게 hidden 클래스를 추가
        */
        .hidden {
            height: 100%;
            min-height: 100%;
            overflow: hidden !important;
            touch-action: none;
        }

        /*
            max-width : 768px
            모바일에 최적화
        */
    </style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b76a0ecb195913e883fb1984fe078269"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <!-- register.js는 registerF가 항상 실행되는 함수이기 때문에 먼저 실행되어야 한다. -->
    <script src="js/register.js"></script>
    <!-- registerF.js에는 항상 실행되어야 하는 함수가 들어가있다. -->
    <script src="js/registerF.js"></script>
    <script src="js/loginF.js"></script>
    <!-- 
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
     -->
    <script>
        function scroll_menu() {
            var scrollTop = $(this).scrollTop();
            $('#header').css('display', 'flex');

            if (scrollTop == 0) {
                $('#header').removeClass('fade_in');
                $('#header').addClass('fade_out');
            } else {
                $('#header').removeClass('fade_out');
                $('#header').addClass('fade_in');
            }
        };
       

        $(function () {
            $('#naver_id_login img').attr('src','img/header/naver_login_btn.png');
            Kakao.init('b76a0ecb195913e883fb1984fe078269');

            //다시 로딩 되었을 경우 현재 위치를 바탕으로 scroll_menu 함수를 실행하여
            //위의 메뉴바를 그려줍니다.
            scroll_menu();

            var img_item = $('.item');
            var image_length = img_item.length;
            var imgNum = 0;
            img_item.eq(imgNum).css('display', 'block');

            setInterval(fade_rotate, 9000);

            function fade_rotate() {
                if (imgNum >= image_length - 1) {
                    imgNum = 0;
                    img_item.eq(image_length - 1).css('display', 'none');
                    img_item.eq(0).css('display', 'block');
                } else {
                    imgNum++;
                    img_item.eq(imgNum - 1).css('display', 'none');
                    img_item.eq(imgNum).css('display', 'block');
                }
            };

            //scroll시 메뉴 배경화면 투명-흰색 변경
            $(window).scroll(scroll_menu);
            
            var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
            var options = { //지도를 생성할 때 필요한 기본 옵션
                center: new kakao.maps.LatLng(37.56191333778759, 126.9763673607519), //지도의 중심좌표.
                level: 10 //지도의 레벨(확대, 축소 정도)
            };

            var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

            var marker_pos_x1 = 37.75619984585285;
            var marker_pos_y1 = 127.37832518475497;
            var markerPosition = new kakao.maps.LatLng(marker_pos_x1, marker_pos_y1);

            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });

            // 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(map);

            var iwContent = '<div style="padding:5px;">픽베리 산속 농장<br><a href="https://map.kakao.com/link/map/픽베리 산속 농장,' + marker_pos_x1 + ',' + marker_pos_y1 + '" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/픽베리 산속 농장,' + marker_pos_x1 + ',' + marker_pos_y1 + '" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                iwPosition = new kakao.maps.LatLng(marker_pos_x1, marker_pos_y1); //인포윈도우 표시 위치입니다

            // 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({
                position: iwPosition,
                content: iwContent
            });

            // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
            infowindow.open(map, marker);

            //메인 이미지 전환 자바스크립트
            var image_main =$('.explain_image img:nth-child(1)');
            var image_first = $('.explain_image img:nth-child(2)');
            var image_second = $('.explain_image img:nth-child(3)');
            var image_third = $('.explain_image img:nth-child(4)');

            image_first.hover(function(){
                image_first.css('filter','brightness(100%)');
                image_main.attr('src','img/fruit_set1.jpg');
            },function(){
                image_first.css('filter','brightness(60%)');
            });

            image_second.hover(function(){
                image_second.css('filter','brightness(100%)');
                image_main.attr('src','img/fruit_set2.jpg');
            },function(){
                image_second.css('filter','brightness(60%)');
            });

            image_third.hover(function(){
                image_third.css('filter','brightness(100%)');
                image_main.attr('src','img/fruit_set3.jpg');
            },function(){
                image_third.css('filter','brightness(60%)');
            });

            
            
        });
    </script>
</head>

<body>
    <jsp:include page="template/header.jsp"></jsp:include>
    <div class="body_image">
        <img src="img/rotate/grape_green_light.jpg" class="item">
        <img src="img/rotate/apple_big.jpg" class="item">
        <img src="img/rotate/blueberry.jpg" class="item">
        <img src="img/rotate/peach.jpg" class="item">
        <img src="img/rotate/orange.jpg" class="item">
        <div class="body_image_text">
            <p class="image_text_eng">Fresh Produce</p>
            <p class="image_text_kor">신선한 상품이 준비되어있습니다.</p>
        </div>
    </div>
    <div id="section">
        <div class="section_title">
            <h3>픽 베리가 갓 따온 신선한 과일·야채를 집앞까지 배송해드립니다.</h3>
        </div>
        <div class="section_title_btn">
            <button style="cursor: pointer;">매장찾기</button>
        </div>
        
        <div class="section_recommend">
            <fieldset>
                <legend>추천 과일</legend>
                <span><i>· 이번 주 추천(recommend)</i></span><br>
                <span> <span style="color: red;">사과</span> · <span style="color: purple;">포도</span> · <span style="color: rgb(255, 166, 0);">오렌지</span> </span>
            </fieldset>
            <div class="recommend_box">
                <div class="recommend_row1">
                    <div class="recommend_fruit1">
                        <div class="recommend_image_box1">
                            <img src="img/apple.jpg">
                            <div></div>
                        </div>
                        <div class="recommend_anchor1">
                            <a href="#">구매하기</a>
                            <a href="#">담기</a>
                        </div>
                    </div>
                    <div class="recommend_fruit2">
                        <div class="recommend_image_box2">
                            <img src="img/grape.jpg">
                            <div></div>
                        </div>
                        <div class="recommend_anchor2">
                            <a href="#">구매하기</a>
                            <a href="#">담기</a>
                        </div>
                    </div>
                    <div class="recommend_fruit3">
                        <div class="recommend_image_box3">
                            <img src="img/orange.jpg">
                            <div></div>
                        </div>
                        <div class="recommend_anchor3">
                            <a href="#">구매하기</a>
                            <a href="#">담기</a>
                        </div>
                    </div>
                </div>
                <div class="recommend_row2">
                    <div class="recommend_fruit4">
                        <div class="recommend_image_box4">
                            <img src="img/avocado.jpg">
                            <div></div>
                        </div>
                        <div class="recommend_anchor4">
                            <a href="#">구매하기</a>
                            <a href="#">담기</a>
                        </div>
                    </div>
                    <div class="recommend_fruit5">
                        <div class="recommend_image_box5">
                            <img src="img/garnet.jpg">
                            <div></div>
                        </div>
                        <div class="recommend_anchor5">
                            <a href="#">구매하기</a>
                            <a href="#">담기</a>
                        </div>
                    </div>
                    <div class="recommend_fruit6">
                        <div class="recommend_image_box6">
                            <img src="img/lime.jpg">
                            <div></div>
                        </div>
                        <div class="recommend_anchor6">
                            <a href="#">구매하기</a>
                            <a href="#">담기</a>
                        </div>
                    </div>
                </div>
                <div class="recommend_row3">
                    <div class="recommend_fruit7">
                        <div class="recommend_image_box7">
                            <img src="img/pear.jpg">
                            <div></div>
                        </div>
                        <div class="recommend_anchor7">
                            <a href="#">구매하기</a>
                            <a href="#">담기</a>
                        </div>
                    </div>
                    <div class="recommend_fruit8">
                        <div class="recommend_image_box8">
                            <img src="img/fig.jpg">
                            <div></div>
                        </div>
                        <div class="recommend_anchor8">
                            <a href="#">구매하기</a>
                            <a href="#">담기</a>
                        </div>
                    </div>
                    <div class="recommend_fruit9">
                        <div class="recommend_image_box9">
                            <img src="img/melon.jpg">
                            <div></div>
                        </div>
                        <div class="recommend_anchor9">
                            <a href="#">구매하기</a>
                            <a href="#">담기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="section_image_explain">
            <div class="explain_image">
                <img src="img/fruit_set1.jpg">
                <img src="img/fruit_set1.jpg">
                <img src="img/fruit_set2.jpg">
                <img src="img/fruit_set3.jpg">
            </div>
            <div class="explain_text">
                <p>
                <h2 class="explain_text_eng">Fresh Produce</h2>
                    픽 베리에서는 오늘 따온 재료만 배송하고 있습니다. 정오 전까지 주문할 시 당일까지 배송이 완료됩니다. 
                    다양한 과일을 맛보실 수 있도록 지방 곳곳에 농장이 있습니다. <br>
                </p>
            </div>
        </div>

        <div class="map_box">
            <div id="map"></div>
            <div class="map_explain">
                <p>
                    <b class="map_bold">Pick Berry</b><br><br>
                    픽 베리는 다양한 과일을 재배하여 상품으로 드리기 위해 전국 각지에 농장을 만들었습니다.
                    농장은 산속에도 위치하고 있고 넓은 평야 지대에도 위치하고 있습니다. <br>
                     다양한 과일 뿐만 아니라 싸게 많은 분들에게 과일을 공급해드리기 위해 농장은 지점도 많지만
                      넓은 땅도 갖고 있습니다.

                </p>
            </div>
        </div>
    </div>
    
    <jsp:include page="template/footer.jsp"></jsp:include>

</body>

</html>