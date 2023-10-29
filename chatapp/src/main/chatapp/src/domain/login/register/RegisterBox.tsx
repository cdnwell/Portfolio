import classes from "./RegisterBox.module.scss";

import PasswordField from "./password/PasswordField";
import RegProfile from "./profile/RegProfile";

const RegisterBox = () => {
    return (
        <div className={classes.register_div}>
            <RegProfile />
            <div className={classes.reg_id_div}>
                <p className={classes.id_p}>
                    이메일
                </p>
                <input type="text" placeholder="example@mail.com" />
            </div>
            <div className={classes.reg_pw_div}>
                <p className={classes.pw_p}>
                    비밀번호
                </p>
                <PasswordField placeholder="∗∗∗∗∗∗" />
            </div>
            <div className={classes.re_pw_div}>
                <p className={classes.pw_p}>
                    비밀번호 재입력
                </p>
                <PasswordField placeholder="∗∗∗∗∗∗" />
            </div>
            <div className={classes.reg_name_div}>
                <p className={classes.name_p}>닉네임</p>
                <input type="text" placeholder="nick" />
            </div>
            <div className={classes.reg_permit_btn}>
                <button className={classes.reg_btn}>제출</button>
            </div>
        </div>
    )
}

export default RegisterBox;