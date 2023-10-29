import { Link } from "react-router-dom";
import classes from "./SignInBox.module.scss";

const SignInBox = () => {
    return (
        <div className={classes.sign_in_div}>
            <div className={classes.sign_id_div}>
                <div className={classes.id_legend}>ID</div>
                <input type="text" className={classes.sign_id_input} />
            </div>
            <div className={classes.sign_pw_div}>
                <div className={classes.pw_legend}>Password</div>
                <input type="password" className={classes.sign_pw_input} />
            </div>
            <div className={classes.sign_btn_div}>
                <button className={classes.sign_btn}>SIGN IN</button>
            </div>
            <div className={classes.btn_menu_div}>
                <div className={classes.reg_btn_div}>
                    <Link to="/register" className={classes.reg_btn}>회원가입</Link>
                </div>
                <div className={classes.bf_btn_div}>
                    <Link to="/login" className={classes.bf_btn}>이전으로</Link>
                </div>
            </div>
            <div className={classes.find_user_div}>
                <span>Id/pw 찾기</span>
            </div>
            <div className={classes.water_mark_div}>
                <span className={classes.water_span}>
                ⓒ 2023. cdnwell all rights reserved.
                </span>
            </div>
        </div>
    );
}

export default SignInBox;