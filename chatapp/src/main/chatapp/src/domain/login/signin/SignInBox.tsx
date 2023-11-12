import { Link } from "react-router-dom";
import classes from "./SignInBox.module.scss";
import axios from "@/global/config/axiosInstance.ts";
import {ChangeEvent, useRef, useState} from "react";

const SignInBox = () => {
    const [id, setId] = useState<string>('');
    const [pw, setPw] = useState<string>('');
    const idRef = useRef<HTMLInputElement>(null);
    const pwRef = useRef<HTMLInputElement>(null);

    const onInputIdChange = (event: ChangeEvent<HTMLInputElement>) => {
        const id = event.target.value;
        if (idRef.current && id.length > 15)
            idRef.current.value = idRef.current.value.slice(0, 15);
        if (idRef.current)
            setId(idRef.current.value);
    }

    const onInputPwChange = (event: ChangeEvent<HTMLInputElement>) => {
        const pw = event.target.value;
        if (pwRef.current && pw.length > 20)
            pwRef.current.value = pwRef.current.value.slice(0, 15);
        if (pwRef.current)
            setPw(pwRef.current.value);
    }

    const onSingIn = () => {
        if(id.trim().length === 0 || pw.trim().length === 0) return alert('로그인 정보를 입력해주세요.');

        console.log('id :', id);
        console.log('pw :', pw);

        axios.post("/user/signIn", {
            id
            , pw
        }).
        then(res => {
            console.log(res);
        })
        .catch(error => {
            console.log(error);
        })
    }

    return (
        <div className={classes.sign_in_div}>
            <div className={classes.sign_id_div}>
                <div className={`${classes.id_legend} ${id ? classes.id_input_focused : ''}`}>ID</div>
                <input type="text" className={classes.sign_id_input} onChange={onInputIdChange} ref={idRef}/>
            </div>
            <div className={classes.sign_pw_div}>
                <div className={`${classes.pw_legend} ${pw ? classes.pw_input_focused : ''}`}>Password</div>
                <input type="password" className={classes.sign_pw_input} onChange={onInputPwChange} ref={pwRef} />
            </div>
            <div className={classes.sign_btn_div}>
                <button className={classes.sign_btn} onClick={onSingIn}>SIGN IN</button>
            </div>
            <div className={classes.btn_menu_div}>
                <div className={classes.reg_btn_div}>
                    <Link to="/register" className={classes.reg_btn}>회원가입</Link>
                </div>
                <div className={classes.bf_btn_div}>
                    <Link to="/login" className={classes.bf_btn}>이전으로</Link>
                </div>
            </div>
            <div className={classes.find_user_div}>
                <span>Id/pw 찾기</span>
            </div>
            <div className={classes.water_mark_div}>
                <span className={classes.water_span}>
                ⓒ 2023. cdnwell all rights reserved.
                </span>
            </div>
        </div>
    );
}

export default SignInBox;