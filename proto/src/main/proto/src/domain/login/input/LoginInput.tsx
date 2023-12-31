import classes from "./LoginInput.module.scss";
import {useState} from "react";

const idMoveClass = classes.move;

const LoginInput = ({ inputTitle, type }) => {
    const [value, setValue] = useState<string>('');
    const [className, setClassName] = useState<string>('');

    const inputClickHandler = () => {
        setClassName(idMoveClass);
    }

    const inputBlurHandler = () => {
        if(value.length === 0)
            setClassName('');
    }

    const inputChangeHandler = (event) => {
        const val = event.target.value;
        setValue(val);
    }

    return (
        <div className={classes.login_root}>
            <p className={`${classes.login_p} ${className}`}>{inputTitle}</p>
            <input type={type}
                   className={classes.login_input}
                   onClick={inputClickHandler}
                   onBlur={inputBlurHandler}
                   onChange={inputChangeHandler}
            />
        </div>
    )
}

export default LoginInput;