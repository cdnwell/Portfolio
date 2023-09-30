import { useDispatch } from "react-redux";
import classes from "./ChatEmoticon.module.scss";
import { emoticonActions } from "../../../global/reducers/emoticon";

const ChatEmoticon = ({ src, className } : { src : string; className: string; }) => {
    const dispatch = useDispatch();

    const emoCloseClickHandler = () => {
        dispatch(emoticonActions.setEmoticon(''));
    }

    return (
        <div className={`${classes.emo_div} ${className}`}>
            <button className={classes.emo_close_btn} onClick={emoCloseClickHandler}>X</button>
            <img src={src} className={classes.emo_img} alt="선택한 이모티콘" />
        </div>
    );
}

export default ChatEmoticon;