import classes from "./ChatEmoticonImages.module.scss";

import { useState } from "react";
import { SELECTED_EMOTICON } from "../enum/ChatEnum";

import TypingCatGif from '@assets/gif/emoticon/cat-worker/AYXecFwQxRbaho7J.5.gif';
import GoOfficeCatGif from '@assets/gif/emoticon/cat-worker/goofficecat.gif';
import GoHomeCatGif from '@assets/gif/emoticon/cat-worker/gohomecat.gif';
import { useDispatch } from "react-redux";
import { emoticonActions } from "../../../global/reducers/emoticon";

const ChatEmoticonImages = ({ selectedEmoticon } : { selectedEmoticon : string; }) => {
    const dispatch = useDispatch();

    const [selectedEmo, setSelectedEmo] = useState(SELECTED_EMOTICON.OFFICE_CAT);
    
    const images = selectedEmo === SELECTED_EMOTICON.OFFICE_CAT ? [ TypingCatGif, GoOfficeCatGif, GoHomeCatGif ]
                    : '';

    const emoTypingClicked = (event: any) => {
        console.log('타자 치는 고양이~');
        console.log(event.target.src);
        const imageSrc = event.target.src;
        dispatch(emoticonActions.setEmoticon(imageSrc));       
    };

    return <div className={classes.emo_img_div}>
        { images && images.map(item => {
            return <img className={classes.emo_img} src={item} onClick={emoTypingClicked} />
        }) }
    </div>
}

export default ChatEmoticonImages;