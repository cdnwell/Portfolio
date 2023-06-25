import classes from "./Login.module.scss";

import LoginBox from "../../login/LoginBox";

const Login = () => {
    return <div className={classes.login_page}>
        <LoginBox />
    </div>
}

export default Login;