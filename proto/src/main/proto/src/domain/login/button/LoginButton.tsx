import classes from "./LoginButton.module.scss";

const LoginButton = ({ placeholder }: { placeholder: string; }) => {
    return (
        <div className={classes.login_btn_div}>
            <button className={classes.login_btn}>{placeholder}</button>
        </div>
    );
}

export default LoginButton;