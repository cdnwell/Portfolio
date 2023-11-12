import classes from "./RegisterBox.module.scss";

import PasswordField from "./password/PasswordField";
import RegProfile from "./profile/RegProfile";

import { AiFillCloseCircle } from "react-icons/ai";
import {useNavigate} from "react-router-dom";
import {ChangeEvent, useRef, useState} from "react";

import axios from "@/global/config/axiosInstance.ts";

const invalidIdMsg = "아이디는 숫자 혹은 영어로 이루어 져야합니다.";
const emptyPwMsg = "비밀번호를 입력해주세요.";
const shortPwMSg = "비밀번호는 5-20글자로 입력해주세요.";
const notEqualPwMsg = "비밀번호가 같지않습니다.";
const invalidNickMsg = "닉네임은 영어, 숫자, 완성된 한글이어야 합니다.";

const RegisterBox = () => {
    const [id, setId] = useState<string>("");
    const [isInvalidId, setIsInvalidId] = useState<boolean>(false);
    const [firstPw, setFirstPw] = useState<string>("");
    const [secondPw, setSecondPw] = useState<string>("");
    const [isInvalidPw, setIsInvalidPw] = useState<boolean>(false);
    const [isEmptyPw, setIsEmptyPw] = useState<boolean>(false);
    const [isPwLengthShort ,setIsPwLengthShort] = useState<boolean>(false);
    const [nick, setNick] = useState<string>('');
    const [isInvalidNick, setIsInvalidNick] = useState<boolean>(false);
    const [img, setImg] = useState<string>('');

    const navigate = useNavigate();
    const idInputRef = useRef<HTMLInputElement>(null);
    const nickInputRef = useRef<HTMLInputElement>(null);

    const onCloseBtnHandler = () => {
        navigate(-1);
    }

    const onIdInputHandler = (event: ChangeEvent<HTMLInputElement>) => {
        const id = event.target.value;
        if (idInputRef.current && id.length > 15){
            idInputRef.current.value = idInputRef.current.value.slice(0,15);
        }
        if (idInputRef.current)
            setId(idInputRef.current.value);
    }

    const onPwInputHandler = (pw: string, pwSetter: React.Dispatch<React.SetStateAction<string>>) => {
        pwSetter(pw);
    }

    const isIdValid = (id: string): boolean => {
        const idReg = /^[a-zA-Z0-9]+$/;
        return idReg.test(id);
    }

    const isPwNotEmpty = (firstPw: string, secondPw: string): boolean => {
        return firstPw.length !== 0 && secondPw.length !== 0;
    }

    const isPwMoreThanFive = (firstPw: string, secondPw: string):boolean => {
        return firstPw.length >= 5 || secondPw.length >= 5;
    }

    const isPwEqual = (firstPw: string, secondPw: string): boolean => {
        return firstPw === secondPw;
    }

    const isNickValid = (nick: string): boolean => {
        const regex = /^[a-zA-Z가-힣0-9]+$/;
        return regex.test(nick);
    }

    const isInputValid = (): boolean => {
        const validatorArr = [
            { validator: isIdValid, params: [id], statusFunc: setIsInvalidId }
            , { validator: isPwNotEmpty, params: [firstPw, secondPw], statusFunc: setIsEmptyPw }
            , { validator: isPwMoreThanFive, params: [firstPw, secondPw], statusFunc: setIsPwLengthShort}
            , { validator: isPwEqual, params: [firstPw, secondPw], statusFunc: setIsInvalidPw }
            , { validator: isNickValid, params: [nick], statusFunc: setIsInvalidNick}
        ]
        let isAllValid = true;

        for(const item of validatorArr) {
            const { validator, params, statusFunc } = item;
            // @ts-ignore
            const isValid = validator.apply(null, params);
            if(!isValid) {
                statusFunc(true);
                isAllValid = false;
            } else {
                statusFunc(false);
            }
        }

        return isAllValid;
    }

    const onNickInputHandler = (event: ChangeEvent<HTMLInputElement>) => {
        const nick = event.target.value;
        if (nickInputRef.current && nick.length > 15){
            nickInputRef.current.value = nickInputRef.current.value.replace(/\s/g, '');
            nickInputRef.current.value = nickInputRef.current.value.slice(0,15);
        }
        if (nickInputRef.current)
            setNick(nickInputRef?.current?.value);
    }

    const onLoginSubmit = () => {
        if(!isInputValid()) return console.log('invalid!');

        const user = {
            id      : id
            , pw    : firstPw
            , nick  : nick
            , img   : img
        }

        axios.post('/user', user)
            .then(res => {
                const { code, msg } = res.data;

                if(code >= 200 || code < 400) {
                    alert(msg);
                } else {
                    alert(msg)
                }

                // navigate("/login");
            })
            .catch(_ => alert("회원가입 중 오류가 발생했습니다."))
    }

    const onSendImg = (img: string) => {
        setImg(img);
    }

    return (
        <div className={classes.register_div}>
            <AiFillCloseCircle className={classes.reg_close_btn} onClick={onCloseBtnHandler} />
            <RegProfile onSendImg={onSendImg} />
            <div className={classes.reg_id_div}>
                <p className={classes.id_p}>
                    아이디
                </p>
                <input type="text" placeholder="아이디를 입력해주세요." onChange={onIdInputHandler} ref={idInputRef} />
                <span className={classes.id_span}>{isInvalidId ? invalidIdMsg : ""}</span>
            </div>
            <div className={classes.reg_pw_div}>
                <p className={classes.pw_p}>
                    비밀번호
                </p>
                <PasswordField placeholder="∗∗∗∗∗∗" onSendPw={(pw) => onPwInputHandler(pw, setFirstPw)} />
                <span className={classes.pw_span}>
                    { isEmptyPw
                        ? emptyPwMsg
                        : isInvalidPw
                        ? notEqualPwMsg
                        : isPwLengthShort
                        ? shortPwMSg
                        : '' }
                </span>
            </div>
            <div className={classes.re_pw_div}>
                <p className={classes.pw_p}>
                    비밀번호 재입력
                </p>
                <PasswordField placeholder="∗∗∗∗∗∗" onSendPw={(pw) => onPwInputHandler(pw, setSecondPw)} />
            </div>
            <div className={classes.reg_name_div}>
                <p className={classes.name_p}>닉네임</p>
                <input type="text" placeholder="닉네임을 입력해주세요." onChange={onNickInputHandler} ref={nickInputRef} />
                <span className={classes.nick_span}>{isInvalidNick ? invalidNickMsg : ""}</span>
            </div>
            <div className={classes.reg_permit_btn}>
                <button className={classes.reg_btn} onClick={onLoginSubmit}>제출</button>
            </div>
        </div>
    )
}

export default RegisterBox;