import classes from './LoginBox.module.scss'

import { useNavigate } from "react-router-dom";

const LoginBox = () => {
    const navigate = useNavigate();

    const goToChat = () => {
        navigate("/Chat");
    }

    return (
        <div className={classes.login_div}>
            <div className={classes.login_title_div}>
                <h3>chat</h3>
            </div>
            <div className={classes.login_id_input_div}>
                <input type="text" className={classes.login_id_input} placeholder='id or email' />
            </div>
            <div className={classes.login_pw_input_div}>
                <input type="password" className={classes.login_pw_input} placeholder='password' />
            </div>
            <div className={classes.login_btn_div}>
                <button className={classes.login_btn} onClick={goToChat}>Login</button>
            </div>
        </div>
    )
}

export default LoginBox;