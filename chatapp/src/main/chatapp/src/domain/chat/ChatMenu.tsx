import classes from './ChatMenu.module.scss';
import { useState } from "react";
import { useDispatch, useSelector } from 'react-redux';

import { UserPropsType } from './main/ChatBoard';
import { animalColorConfirm } from '../../global/utils/colorUtil';

import TypingCatGif from '../../assets/gif/emoticon/cat-worker/AYXecFwQxRbaho7J.5.gif'
import GoOfficeCatGif from '../../assets/gif/emoticon/cat-worker/goofficecat.gif';
import GoHomeCatGif from '../../assets/gif/emoticon/cat-worker/gohomecat.gif';

import { emoticonActions } from '../../global/reducers/emoticon';

import { AiOutlineArrowUp, AiOutlineArrowDown } from "react-icons/ai";

const ChatMenu = () => {
    const [isFolded, setIsFolded] = useState(false);
 
    // 1. redux에 있는 유저 동물가져오기 
    let userAnimal = useSelector((state : { user : UserPropsType}) => state.user.userAnimal);
    const dispatch = useDispatch();

    const chatMenuColor = animalColorConfirm(userAnimal);

    const emoTypingClicked = (event: any) => {
        console.log('타자 치는 고양이~');
        console.log(event.target.src);
        const imageSrc = event.target.src;
        dispatch(emoticonActions.setEmoticon(imageSrc));       
    };

    const emoFoldClicked = () => {
        setIsFolded((prev) => !prev);
    };

    return <div className={classes.chat_menu_div} style={{ backgroundColor : chatMenuColor }}>
        {!isFolded && <img className={classes.emo_typing_cat} src={TypingCatGif} alt="타자 치는 고양이" onClick={emoTypingClicked} />}
        {!isFolded && <img className={classes.emo_typing_cat} src={GoOfficeCatGif} alt="회사가는 고양이" onClick={emoTypingClicked} />}
        {!isFolded && <img className={classes.emo_typing_cat} src={GoHomeCatGif} alt="집가는 고양이" onClick={emoTypingClicked} />}
        <div className={classes.emo_fold_div} onClick={emoFoldClicked} >
            {!isFolded 
                ? <AiOutlineArrowUp/> 
                : <AiOutlineArrowDown/> }
            
        </div>
    </div>
}

export default ChatMenu;