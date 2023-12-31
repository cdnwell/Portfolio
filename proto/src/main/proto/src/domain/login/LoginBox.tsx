import classes from "./LoginBox.module.scss";
import LoginInput from "./input/LoginInput.tsx";

const LoginBox = () => {
    return (
        <div className={classes.login_box}>
            <h1 className={classes.login_title_h1}>Proto Login</h1>
            <LoginInput inputTitle={'ID'} type={'text'} />
            <LoginInput inputTitle={'Password'} type={'password'} />
        </div>
    );
}

export default LoginBox;