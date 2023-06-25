import classes from "./LoginBox.module.scss";

const LoginBox = () => {
    return <div className={classes.login_box}>
        <div>
            <h1 className={classes.login_title_h1}>
                <span>Memo</span><span className={classes.login_title_span_p}>P</span>
            </h1>
        </div>
        <div className={classes.login_input_wrapper}>
            <input type="text" placeholder="ID 혹은 Eamil을 입력해주세요." />
            <input type="text" placeholder="비밀번호를 입력해주세요." />
        </div>
        <div className={classes.login_btn_wrapper}>
            <button className={classes.login_btn}>로그인</button>
        </div>
    </div>
}

export default LoginBox;