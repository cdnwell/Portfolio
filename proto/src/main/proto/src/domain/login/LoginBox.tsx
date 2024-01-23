import classes from "./LoginBox.module.scss";
import LoginInput from "./input/LoginInput.tsx";
import LoginButton from "./button/LoginButton.tsx";
import LoginAnchor from "./a/LoginAnchor.tsx";

export const LOGIN_ANCHOR = {
    REGISTER: '회원가입'
    , FIND_ID_PW: '아이디/비밀번호 찾기'
} as const;

const LoginBox = ({ anchorMsgSender }) => {
    const anchorMsgSender = (msg: string) => {

    };

    return (
        <div className={classes.login_box}>
            <h1 className={classes.login_title_h1}>Proto Login</h1>
            <div className={classes.login_input_box}>
                <LoginInput title={'ID'} type={'text'} />
                <LoginInput title={'Password'} type={'password'} />
                <LoginButton placeholder={'로그인'} />
                <div className={classes.login_anchor_box}>
                    <LoginAnchor placeholder={LOGIN_ANCHOR.REGISTER} anchorMsgSender={anchorMsgSender}/>
                    <LoginAnchor placeholder={LOGIN_ANCHOR.FIND_ID_PW} anchorMsgSender={anchorMsgSender} />
                </div>
            </div>
        </div>
    );
}

export default LoginBox;