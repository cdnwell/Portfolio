import classes from "./HomeSectionTwo.module.scss";

import { useState, useEffect } from "react";

import constructor from "../../../assets/images/constructor/sky-constructor-01-removebg.png";
import constructor2 from "../../../assets/images/constructor/sky1ton01-removebg.png";

const HomeSectionTwo = () => {
  const screenHeight = screen.height;
  const p1 = "스카이 차량 소개"
  const p2 = "스카이 차량(Sky Vehicle)은 건설 현장에서 사용되는 대형 기계 장비 중 하나로, 높은 작업 공간에 접근하기 위한 목적으로 설계된 차량입니다. 이 차량은 높은 지점에 위치한 구조물의 수리, 유지보수, 건설 등의 작업에 유용하게 사용됩니다.";
  const p3 = "스카이 차량은 높은 안전성과 안정성을 보장하며, 다양한 작업 환경에서 사용할 수 있습니다. 이러한 특징으로 인해 스카이 차량은 건설 현장에서 필수적인 장비 중 하나로 자리 잡고 있습니다.";

  const [isHide, setIsHide] = useState(true);

  const updateScroll = () => {
    const scrollY = window.scrollY;
    // console.log('scrollY', scrollY);
    if (scrollY > screenHeight + screenHeight / 3) {
      setIsHide(false);
    } else {
      setIsHide(true);
    }
  };

  useEffect(() => {
    window.addEventListener("scroll", updateScroll);
    // return () => window.removeEventListener("scroll", updateScroll);
  });

  const classHide = isHide ? classes.hide : "";

  return (
    <div className={classes.home_section_two} style={{ height: screenHeight }}>
      <div className={`${classes.home_section_two_img_box} ${classHide}`}>
        <img
          src={constructor}
          className={classes.home_section_img1}
          alt="스카이 장비.png"
        />
        <img
          src={constructor2}
          className={classes.home_section_img2}
          alt="스카이 장비2.png"
        />
      </div>
      <div className={`${classes.home_section_two_p_box} ${classHide}`}>
        <p className={classes.home_section_p1}>{p1}</p>
        <p className={classes.home_section_p2}>{p2}</p>
        <p className={classes.home_section_p3}>{p3}</p>
      </div>
    </div>
  );
};

export default HomeSectionTwo;
