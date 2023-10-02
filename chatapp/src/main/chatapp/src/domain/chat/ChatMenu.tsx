import classes from './ChatMenu.module.scss';
import { useState } from "react";
import { useSelector } from 'react-redux';

import { UserPropsType } from './main/ChatBoard';
import { animalColorConfirm } from '../../global/utils/colorUtil';

import { AiOutlineArrowUp, AiOutlineArrowDown } from "react-icons/ai";
import ChatEmoticonImages from './menu/ChatEmoticonImages';
import ChatEmoticonMenu from './menu/ChatEmoticonMenu';
import { SELECTED_EMOTICON } from './enum/ChatEnum';

const ChatMenu = () => {
    const [isFolded, setIsFolded] = useState(false);
    const [selMenu, setSelMenu] = useState(SELECTED_EMOTICON.OFFICE_CAT);
 
    // 1. redux에 있는 유저 동물가져오기 
    let userAnimal = useSelector((state : { user : UserPropsType}) => state.user.userAnimal);

    const chatMenuColor = animalColorConfirm(userAnimal);

    const emoFoldClicked = () => {
        setIsFolded((prev) => !prev);
    };

    const handleClickedEmoMenu = (menu: string) => {
        setSelMenu(menu);
        console.log('menu :', menu);
        setIsFolded(false);
    }

    return <div className={classes.chat_menu_div} style={{ backgroundColor : chatMenuColor }}>
        { !isFolded && <ChatEmoticonImages selectedEmoticon={selMenu} />  }
        { isFolded &&  <ChatEmoticonMenu handleClickedEmoMenu={handleClickedEmoMenu} /> }
        <div className={classes.emo_fold_div} onClick={emoFoldClicked} >
            {!isFolded 
                ? <AiOutlineArrowUp/> 
                : <AiOutlineArrowDown/> }
            
        </div>
    </div>
}

export default ChatMenu;