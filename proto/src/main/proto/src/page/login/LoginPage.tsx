import classes from "./LoginPage.module.scss";

import {useState} from "react";

import LoginBox from "../../domain/login/LoginBox.tsx";

const LoginPage = () => {
    const [pageState, setPageState] = useState<string>('');

    const anchorMsgSender = (msg: string) => {
        setPageState(msg);
    }

    return (
        <div className={classes.login_page}>
            <LoginBox anchorMsgSender={anchorMsgSender} />
        </div>
    );
}

export default LoginPage;