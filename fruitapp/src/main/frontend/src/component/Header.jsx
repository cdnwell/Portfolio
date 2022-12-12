import React from 'react';
import '../css/header.css';

function Header() {
    return (
        <div id='header'>
            <div className='header_logo'>
                <img 
                style={{cursor : 'pointer'}}
                src='img/header/pick_berry_logo.png'
                ></img>
            </div>
            <div className='header_list_box'>
                <ul>
                    <li>
                        <span>소개글</span>
                    </li>
                    <li>
                        <span>상품구매</span>
                    </li>
                    <li>
                        <span>문의하기</span>
                    </li>
                </ul>
            </div>
            <div className='header_login_box'>
                <ul>
                    <li>
                        <span className='login_btn'>로그인</span>
                    </li>
                    <li>
                        <span className='register_btn'>로그아웃</span>
                    </li>
                    <li>
                        <img 
                            className='cart_img'
                            src='img/header/shopping-cart.png'></img>
                    </li>
                </ul>
            </div>
        </div>
    );
}

export default Header;