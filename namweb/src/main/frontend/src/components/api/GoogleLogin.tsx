import google_btn from "../../assets/images/icons/google_btn.png";

import classes from "./GoogleLogin.module.scss";

const GoogleLogin = () => {
    return <div>
        <img src={google_btn} className={classes.google_btn} alt="구글 로그인.png" />
    </div>
}

export default GoogleLogin;