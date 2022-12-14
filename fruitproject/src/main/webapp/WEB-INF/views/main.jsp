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

        /* ?????? ????????? 3??? ?????? ?????? */
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
            /*?????? ????????? ?????? ????????? ??? ????????? ???????????? ?????? ????????? ?????????*/
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
            body??? ????????? ????????? ???????????? ????????? hidden ???????????? ??????
        */
        .hidden {
            height: 100%;
            min-height: 100%;
            overflow: hidden !important;
            touch-action: none;
        }

        /*
            max-width : 768px
            ???????????? ?????????
        */
    </style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b76a0ecb195913e883fb1984fe078269"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <!-- register.js??? registerF??? ?????? ???????????? ???????????? ????????? ?????? ??????????????? ??????. -->
    <script src="js/register.js"></script>
    <!-- registerF.js?????? ?????? ??????????????? ?????? ????????? ???????????????. -->
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

            //?????? ?????? ????????? ?????? ?????? ????????? ???????????? scroll_menu ????????? ????????????
            //?????? ???????????? ???????????????.
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

            //scroll??? ?????? ???????????? ??????-?????? ??????
            $(window).scroll(scroll_menu);
            
            var container = document.getElementById('map'); //????????? ?????? ????????? DOM ????????????
            var options = { //????????? ????????? ??? ????????? ?????? ??????
                center: new kakao.maps.LatLng(37.56191333778759, 126.9763673607519), //????????? ????????????.
                level: 10 //????????? ??????(??????, ?????? ??????)
            };

            var map = new kakao.maps.Map(container, options); //?????? ?????? ??? ?????? ??????

            var marker_pos_x1 = 37.75619984585285;
            var marker_pos_y1 = 127.37832518475497;
            var markerPosition = new kakao.maps.LatLng(marker_pos_x1, marker_pos_y1);

            // ????????? ???????????????
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });

            // ????????? ?????? ?????? ??????????????? ???????????????
            marker.setMap(map);

            var iwContent = '<div style="padding:5px;">????????? ?????? ??????<br><a href="https://map.kakao.com/link/map/????????? ?????? ??????,' + marker_pos_x1 + ',' + marker_pos_y1 + '" style="color:blue" target="_blank">???????????????</a> <a href="https://map.kakao.com/link/to/????????? ?????? ??????,' + marker_pos_x1 + ',' + marker_pos_y1 + '" style="color:blue" target="_blank">?????????</a></div>', // ?????????????????? ????????? ???????????? HTML ??????????????? document element??? ???????????????
                iwPosition = new kakao.maps.LatLng(marker_pos_x1, marker_pos_y1); //??????????????? ?????? ???????????????

            // ?????????????????? ???????????????
            var infowindow = new kakao.maps.InfoWindow({
                position: iwPosition,
                content: iwContent
            });

            // ?????? ?????? ?????????????????? ???????????????. ????????? ??????????????? marker??? ???????????? ????????? ?????? ?????? ???????????????
            infowindow.open(map, marker);

            //?????? ????????? ?????? ??????????????????
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
            <p class="image_text_kor">????????? ????????? ????????????????????????.</p>
        </div>
    </div>
    <div id="section">
        <div class="section_title">
            <h3>??? ????????? ??? ?????? ????????? ????????????????? ???????????? ?????????????????????.</h3>
        </div>
        <div class="section_title_btn">
            <button style="cursor: pointer;">????????????</button>
        </div>
        
        <div class="section_recommend">
            <fieldset>
                <legend>?????? ??????</legend>
                <span><i>?? ?????? ??? ??????(recommend)</i></span><br>
                <span> <span style="color: red;">??????</span> ?? <span style="color: purple;">??????</span> ?? <span style="color: rgb(255, 166, 0);">?????????</span> </span>
            </fieldset>
            <div class="recommend_box">
                <div class="recommend_row1">
                    <div class="recommend_fruit1">
                        <div class="recommend_image_box1">
                            <img src="img/apple.jpg">
                            <div></div>
                        </div>
                        <div class="recommend_anchor1">
                            <a href="#">????????????</a>
                            <a href="#">??????</a>
                        </div>
                    </div>
                    <div class="recommend_fruit2">
                        <div class="recommend_image_box2">
                            <img src="img/grape.jpg">
                            <div></div>
                        </div>
                        <div class="recommend_anchor2">
                            <a href="#">????????????</a>
                            <a href="#">??????</a>
                        </div>
                    </div>
                    <div class="recommend_fruit3">
                        <div class="recommend_image_box3">
                            <img src="img/orange.jpg">
                            <div></div>
                        </div>
                        <div class="recommend_anchor3">
                            <a href="#">????????????</a>
                            <a href="#">??????</a>
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
                            <a href="#">????????????</a>
                            <a href="#">??????</a>
                        </div>
                    </div>
                    <div class="recommend_fruit5">
                        <div class="recommend_image_box5">
                            <img src="img/garnet.jpg">
                            <div></div>
                        </div>
                        <div class="recommend_anchor5">
                            <a href="#">????????????</a>
                            <a href="#">??????</a>
                        </div>
                    </div>
                    <div class="recommend_fruit6">
                        <div class="recommend_image_box6">
                            <img src="img/lime.jpg">
                            <div></div>
                        </div>
                        <div class="recommend_anchor6">
                            <a href="#">????????????</a>
                            <a href="#">??????</a>
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
                            <a href="#">????????????</a>
                            <a href="#">??????</a>
                        </div>
                    </div>
                    <div class="recommend_fruit8">
                        <div class="recommend_image_box8">
                            <img src="img/fig.jpg">
                            <div></div>
                        </div>
                        <div class="recommend_anchor8">
                            <a href="#">????????????</a>
                            <a href="#">??????</a>
                        </div>
                    </div>
                    <div class="recommend_fruit9">
                        <div class="recommend_image_box9">
                            <img src="img/melon.jpg">
                            <div></div>
                        </div>
                        <div class="recommend_anchor9">
                            <a href="#">????????????</a>
                            <a href="#">??????</a>
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
                    ??? ??????????????? ?????? ?????? ????????? ???????????? ????????????. ?????? ????????? ????????? ??? ???????????? ????????? ???????????????. 
                    ????????? ????????? ????????? ??? ????????? ?????? ????????? ????????? ????????????. <br>
                </p>
            </div>
        </div>

        <div class="map_box">
            <div id="map"></div>
            <div class="map_explain">
                <p>
                    <b class="map_bold">Pick Berry</b><br><br>
                    ??? ????????? ????????? ????????? ???????????? ???????????? ????????? ?????? ?????? ????????? ????????? ??????????????????.
                    ????????? ???????????? ???????????? ?????? ?????? ?????? ???????????? ???????????? ????????????. <br>
                     ????????? ?????? ?????? ????????? ?????? ?????? ???????????? ????????? ?????????????????? ?????? ????????? ????????? ?????????
                      ?????? ?????? ?????? ????????????.

                </p>
            </div>
        </div>
    </div>
    
    <jsp:include page="template/footer.jsp"></jsp:include>

</body>

</html>