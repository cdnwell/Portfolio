import classes from "./LoginAnchor.module.scss";
import {LOGIN_ANCHOR} from "../LoginBox.tsx";

export const PAGE_STATE = {
    LOGIN: 0
    , REGISTER: 1
    , FIND_ID_PW: 2
} as const;

interface PAGE_STATE {
    LOGIN: number;
    REGISTER: number;
    FIND_ID_PW: number;
}

const LoginAnchor = ({ placeholder, anchorMsgSender } : {
    placeholder: string;
    anchorMsgSender: (page: PAGE_STATE) => void
}) => {

    const anchorClickHandler = () => {
        if(placeholder === LOGIN_ANCHOR.REGISTER)
            anchorMsgSender(PAGE_STATE.REGISTER);
        else if(placeholder === LOGIN_ANCHOR.FIND_ID_PW)
            anchorMsgSender(PAGE_STATE.FIND_ID_PW);
        console.log('placeholder :', placeholder);
    }

    return (
        <a
            className={classes.login_anchor}
            onClick={anchorClickHandler}
        >{placeholder}</a>
    )
}

export default LoginAnchor;