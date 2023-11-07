import classes from "./RegisterBox.module.scss";

import PasswordField from "./password/PasswordField";
import RegProfile from "./profile/RegProfile";

import { AiFillCloseCircle } from "react-icons/ai";
import {useNavigate} from "react-router-dom";
import {ChangeEvent, useEffect, useState} from "react";

const invalidIdComment = "아이디는 숫자 혹은 영어로 이루어 져야합니다.";
const invalidPwComment = "비밀번호가 같지않습니다.";

const RegisterBox = () => {
    const [id, setId] = useState<string>("");
    const [isInvalidId, setIsInvalidId] = useState<boolean>(false);
    const [firstPw, setFirstPw] = useState<string>("");
    const [secondPw, setSecondPw] = useState<string>("");
    const [isInvalidPw, setIsInvalidPw] = useState<boolean>(false);

    const navigate = useNavigate();

    const onCloseBtnHandler = () => {
        navigate(-1);
    }

    const onIdInputHandler = (event: ChangeEvent<HTMLInputElement>) => {
        const id = event.target.value;
        setId(id);
    }

    const onPwInputHandler = (event: ChangeEvent<HTMLInputElement>, pwSetter: React.Dispatch<React.SetStateAction<string>>) => {
        const pw = event.target.value;
        pwSetter(pw);
    }

    useEffect(() => {
        console.log('first pw :', firstPw);
        console.log('second pw :', secondPw);
    }, [firstPw, secondPw]);

    const onLoginSubmit = () => {
        setIsInvalidId(!idValidator(id));
        setIsInvalidPw(!pwValidator(firstPw, secondPw));
    }

    const idValidator = (id: string): boolean => {
        const idReg = /^[a-zA-Z0-9]+$/;
        return idReg.test(id);
    }

    const pwValidator = (firstPw: string, secondPw: string): boolean => {
        return firstPw === secondPw;
    }


    return (
        <div className={classes.register_div}>
            <AiFillCloseCircle className={classes.reg_close_btn} onClick={onCloseBtnHandler} />
            <RegProfile />
            <div className={classes.reg_id_div}>
                <p className={classes.id_p}>
                    아이디
                </p>
                <input type="text" placeholder="아이디를 입력해주세요." onChange={onIdInputHandler} maxLength={15} />
                <span className={classes.id_span}>{isInvalidId ? invalidIdComment : ""}</span>
            </div>
            <div className={classes.reg_pw_div}>
                <p className={classes.pw_p}>
                    비밀번호
                </p>
                <PasswordField placeholder="∗∗∗∗∗∗" pwHandler={(event) => onPwInputHandler(event, setFirstPw)} />
                <span className={classes.pw_span}>{isInvalidPw ? invalidPwComment : ""}</span>
            </div>
            <div className={classes.re_pw_div}>
                <p className={classes.pw_p}>
                    비밀번호 재입력
                </p>
                <PasswordField placeholder="∗∗∗∗∗∗" pwHandler={(event) => onPwInputHandler(event, setSecondPw)} />
            </div>
            <div className={classes.reg_name_div}>
                <p className={classes.name_p}>닉네임</p>
                <input type="text" placeholder="닉네임을 입력해주세요." />
            </div>
            <div className={classes.reg_permit_btn}>
                <button className={classes.reg_btn} onClick={onLoginSubmit}>제출</button>
            </div>
        </div>
    )
}

export default RegisterBox;