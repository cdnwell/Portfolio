import classes from "./PasswordChange.module.scss";

const PasswordChange = () => {
    return <form action="">
    <label htmlFor="password">
        기존 비밀번호
        <input type="password" id="password" />
    </label>
    <label htmlFor="passwordRe">
        변경할 비밀번호
        <input type="text" id="passwordRe" />
    </label>
    </form>
}

export default PasswordChange;