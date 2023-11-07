import classes from "./PasswordField.module.scss";

import {ChangeEvent, useState} from "react";

import { AiOutlineEye } from "react-icons/ai";

interface PasswordFieldProps {
    placeholder: string;
    pwHandler: (event: ChangeEvent<HTMLInputElement>) => void;
}

const PasswordField : React.FC<PasswordFieldProps>  = ({ placeholder, pwHandler }) => {
    const [isPasswordShown, setPasswordShown] = useState<boolean>(false);

    const togglePasswordVisiblity = () => {
        setPasswordShown(!isPasswordShown);
    }


    return (
    <div className={classes.pw_wrapper}>
        <input type={isPasswordShown ? "text" : "password"} placeholder={placeholder} onChange={pwHandler} maxLength={15} />
        <AiOutlineEye className={classes.pw_eye_icon} onClick={togglePasswordVisiblity} />
    </div>
    );
}

export default PasswordField;