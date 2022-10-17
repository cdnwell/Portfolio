<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="login">
        <form id="login_frm">
            <div class="login_img_box">
                <img src="img/header/pick_berry_logo.png" class="login_frm_img">
                <p class="login_box_p">로그인</p>
            </div>
            <input type="text" class="login_frm_id" placeholder="아이디를 입력해주세요.">
            <input type="password" class="login_frm_pass" placeholder="비밀번호를 입력해주세요">
            <button type="button" style="cursor: pointer;" class="login_btn_frm">로그인</button>
            <a id="custom-login-btn" href="javascript:loginWithKakao()">
                <img src="img/header/kakao_login_large_wide.png" width="222" alt="카카오 로그인 버튼" />
            </a>
            <a id="naver_id_login" href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=1gT6ptILkTkiIXDqGrGi&redirect_uri=http://127.0.0.1:9999/naverLogin"><img src="img/header/naver_login_btn.png"/></a>
        </form>
    </div>
    <script type="text/javascript">
        function loginWithKakao() {
        	Kakao.Auth.authorize({
        		redirectUri : 'http://127.0.0.1:9999/kakaoLogin'	
        	});
        }
    </script>
    <div id="register">
        <form id="register_frm">
            <p class="register_title">Pick Berry</p>
            <p class="register_title_p">회원가입</p>
            <div class="register_id_box">
                <span>아이디</span> <input type="text" placeholder="아이디를 입력해주세요">
                <div class="id_chk"></div>
                <a class="id_chk_btn" style="cursor: pointer;">아이디 중복확인</a>
            </div>
            <div class="password_boxes">
                <div class="password_box1">
                    <span>비밀번호</span> <input type="password" placeholder="비밀번호를 입력해주세요">
                </div>
                <div class="password_box2">
                <span>확인</span> <input type="password" placeholder="비밀번호를 다시 입력해주세요">
                </div>
                <div class="pass_chk"></div>
            </div>
            <div class="register_nick_box">
                닉네임 <input type="text" placeholder="닉네임을 입력해주세요">
                <a class="nick_chk_btn" style="cursor: pointer;">닉네임 중복확인</a>
                <div class="nick_chk"></div>
            </div>
            <div class="register_email_box">
                이메일 <input type="text" placeholder="이메일을 입력해주세요" class="email_input">
                <select name="email_address" class="email_sel">
                    <option value="1">@naver.com</option>
                    <option value="2">@hanmail.net</option>
                    <option value="3">@gmail.com</option>
                </select>
                <div class="email_chk"></div>
            </div>
            <div class="register_btn_box">
                <button type="button" class="register_btn_two" style="cursor: pointer;">회원 등록</button>
                <button type="reset" class="reset_btn" style="cursor: pointer;">초기화</button>
            </div>
        </form>
    </div>
    <div id="header" class="fade_out">
        <div class="header_logo">
            <a href="main">
                <img src="img/header/pick_berry_logo.png" class="logo_img" title="Pick Berry">
            </a>
        </div>
        <div class="header_list_box">
            <ul>
                <li>
                    <a href="info">
                        소개글
                    </a>
                </li>
                <li>
                    <a href="buy">
                        상품구매
                    </a>
                </li>
                <li>
                    <a href="qna" class="qna_anchor">
                        문의하기
                    </a>
                </li>
            </ul>
        </div>
        <div class="header_login_box fade_out">
            <ul>
            <c:choose>
            	<c:when test="${sessionScope.email == null || sessionScope.nickname == null}">
	                <li>
	                    <a class="login_btn layerPop" style="cursor: pointer;">
	                        로그인
	                    </a>
	                </li>
	                <li>
	                    <a class="register_btn layerPop" style="cursor: pointer;">
	                        회원가입
	                    </a>
	                </li>
                </c:when>
                <c:otherwise>
                	<li>
	                	<a class="login_txt">
	                		${sessionScope.nickname } 로그인
	                	</a>
                	</li>
                	<li>
                		<c:if test="${sessionScope.kakaoToken != null }">
		                	<a class="logout_txt" href="kakaoLogout">
		                		로그아웃
		                	</a>
	                	</c:if>
	                	<c:if test="${sessionScope.naverToken != null }">
		                	<a class="logout_txt" href="naverLogout">
		                		로그아웃
		                	</a>
	                	</c:if>
	                	<c:if test="${sessionScope.localToken != null }">
	                		<a class="logout_txt" href="localLogout">
	                			로그아웃
	                		</a>
	                	</c:if>
                	</li>
                </c:otherwise>
             </c:choose>
                <li>
                    <a href="#">
                        <img src="img/header/shopping-cart.png" class="cart_img" title="장바구니">
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <script>
	    function kakaoLogout() {
	    	var nickname = '${sessionScope.nickname}';
	    	if (!Kakao.Auth.getAccessToken()) {
	    		  console.log('Not logged in.');
	    		  return;
    		}
    		Kakao.Auth.logout(function() {
    		  console.log(Kakao.Auth.getAccessToken());
    		});
	  	}
    </script>