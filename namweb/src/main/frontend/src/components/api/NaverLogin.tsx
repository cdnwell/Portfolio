import naver_btn from "../../assets/images/icons/naver_btn.png";

import classes from "./NaverLogin.module.scss";

const NaverLogin = () => {
    return <div>
        <img src={naver_btn} className={classes.naver_btn} alt="네이버 로그인.png" />
    </div>
}

export default NaverLogin;