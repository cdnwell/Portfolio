import classes from "./HomeSectionOne.module.scss";

import { useEffect, useState } from "react";

import constructor_site from "../../../assets/images/constructor_site/constructor_site_bg02.jpg";

const HomeSectionOne = () => {
    const screenHeight = screen.height;
    const p1 = "건설 현장은 건물, 다리, 도로 등을 건설하기 위한 공간입니다. 건설 현장에서는 건축, 구조, 전기, 기계, 토목 등 다양한 분야의 전문가들이 협력하여 건축물을 만들어냅니다.";
    const p2 = "건설 현장에서는 철근, 시멘트, 블록 등의 건축자재를 사용하며, 크레인, 굴착기, 굴뚝 등의 건설기계가 활용됩니다. 건설 현장에서는 안전에 대한 중요성이 강조되며, 안전모, 안전화, 안전조치 등이 철저하게 준비됩니다.";
    const p3 = "건설 현장에서 일하는 사람들은 건축공, 전기기술자, 기계공, 안전관리자 등 다양한 직종이 있습니다. 건설 현장에서는 매일 다양한 일정과 문제가 발생하며, 이를 해결하기 위해 현장 관리자와 현장 작업자들이 협력하여 일합니다.";
    const p4 = "건설 현장은 공사 기간 동안 매우 바쁜 공간이지만, 건축물이 완성된 후에는 사람들이 사용하는 공간으로 변합니다. 따라서 건설 현장에서의 작업은 미래를 위한 투자라는 측면에서 매우 중요합니다.";

    const [isHide, setIsHide] = useState(true);

    const updateScroll = () => {
        const scrollY = window.scrollY;
        if (scrollY > screenHeight / 3) {
            setIsHide(false);
        } else {
            setIsHide(true);
        }
    }

    useEffect(()=>{
        window.addEventListener('scroll', updateScroll);
    })

    const classHide = isHide ? classes.hide : '';

    return <div className={classes.home_section_one} style={{height : screenHeight}}>
        <div className={`${classes.home_section_p_div} ${classHide}`}>
            <p className={classes.home_section_one_p_box}>
                <p className={classes.home_section_one_p1}>{p1}</p>
                <p className={classes.home_section_one_p2}>{p2}</p>
                <p className={classes.home_section_one_p3}>{p3}</p>
                <p className={classes.home_section_one_p4}>{p4}</p>
            </p>
        </div>
        <div className={`${classes.home_section_img_div} ${classHide}`}>
            <img src={constructor_site} className={classes.home_section_img} alt="공사 현장.jpg" />
        </div>
    </div>
};

export default HomeSectionOne;