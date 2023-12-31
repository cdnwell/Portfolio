import classes from "./Login.module.scss";
import LoginBox from "../../domain/login/LoginBox.tsx";

const Login = () => {
    return (
    <div className={classes.login_page}>
        <LoginBox />
    </div>
    );
}

export default Login;