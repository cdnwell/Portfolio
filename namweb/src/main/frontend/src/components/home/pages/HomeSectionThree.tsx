import classes from "./HomeSectionThree.module.scss";

import { useState, useEffect } from "react";

import sky_background from "../../../assets/images/background/sky/diego-ph-vTitvl4O2kE-unsplash.jpg";
import { Link } from "react-router-dom";

const HomeSectionThree = () => {
    const screenHeight = screen.height;
    const screenHeightStyle = screen.height * 2 / 3;
    const p1 = "차량 예약 소개";
    const p2 = "예약을 하시려면, 아래 버튼을 클릭해주세요.";

    const [isHide, setIsHide] = useState(true);

    const updateScroll = () => {
        const scrollY = window.scrollY;

        // console.log('scrollY', scrollY);
        // console.log('screenHeight', screenHeight * 2 + screenHeight / 2)
        if (scrollY > screenHeight * 2 + screenHeight / 2) {
            setIsHide(false);
            console.log('true entered');
            console.log('isHide', isHide);
        } else {
            setIsHide(true);
            console.log('false entered');
            console.log('isHide', isHide);
        }
    }

    useEffect(()=>{
        window.addEventListener('scroll', updateScroll);
        // return () => window.removeEventListener('scroll', updateScroll);
    })

    const classHide = isHide ? classes.hide : '';

    return <div className={classes.home_section_three} style={{height : screenHeightStyle, backgroundImage : `url(${sky_background})`}}>
        <div className={`${classes.home_section_p_box} ${classHide}`}>
            <p className={classes.home_section_p1}>{p1}</p>
            <p className={classes.home_section_p2}>{p2}</p>
            <Link to="/book" className={classes.home_section_book_btn}>예약하기</Link>
        </div>
    </div>
}

export default HomeSectionThree;