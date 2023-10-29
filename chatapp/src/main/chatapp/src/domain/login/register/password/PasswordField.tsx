import classes from "./PasswordField.module.scss";

import { useState } from "react";

import { AiOutlineEye } from "react-icons/ai";

interface PasswordFieldProps {
    placeholder : string;
}

const PasswordField : React.FC<PasswordFieldProps>  = ({ placeholder }) => {
    const [isPasswordShown, setPasswordShown] = useState<boolean>(false);
    
    const togglePasswordVisiblity = () => {
        setPasswordShown(!isPasswordShown);
    }

    return (
    <div className={classes.pw_wrapper}>
        <input type={isPasswordShown ? "text" : "password"} placeholder={placeholder} />
        <AiOutlineEye className={classes.pw_eye_icon} onClick={togglePasswordVisiblity} />
    </div>
    );
}

export default PasswordField;