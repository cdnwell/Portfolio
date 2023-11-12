import classes from "./PasswordField.module.scss";

import {ChangeEvent, useRef, useState} from "react";

import { AiOutlineEye } from "react-icons/ai";

interface PasswordFieldProps {
    placeholder: string;
    onSendPw: (pw: string) => void;
}

const PasswordField : React.FC<PasswordFieldProps>  = ({ placeholder, onSendPw }) => {
    const [isPasswordShown, setPasswordShown] = useState<boolean>(false);
    const pwInputRef = useRef<HTMLInputElement>(null);

    const togglePasswordVisiblity = () => {
        setPasswordShown(!isPasswordShown);
    }

    const onPwInputHandler = (event: ChangeEvent<HTMLInputElement>) => {
        const pw = event.target.value;
        if (pwInputRef.current && pw.length > 20) {
            pwInputRef.current.value = pwInputRef.current.value.slice(0, 15);
        }
        if (pwInputRef.current)
            onSendPw(pwInputRef.current.value);
    }

    return (
    <div className={classes.pw_wrapper}>
        <input type={isPasswordShown ? "text" : "password"} placeholder={placeholder} onChange={onPwInputHandler} ref={pwInputRef} />
        <AiOutlineEye className={classes.pw_eye_icon} onClick={togglePasswordVisiblity} />
    </div>
    );
}

export default PasswordField;