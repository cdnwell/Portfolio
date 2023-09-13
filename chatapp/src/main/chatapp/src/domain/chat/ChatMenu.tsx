import classes from './ChatMenu.module.scss';
import { useSelector } from 'react-redux';

import { UserPropsType } from './main/ChatBoard';
import { animalColorConfirm } from '../../global/utils/colorUtil';

const ChatMenu = () => {
    // 1. redux에 있는 유저 동물가져오기 
    let userAnimal = useSelector((state : { user : UserPropsType}) => state.user.userAnimal);

    const chatMenuColor = animalColorConfirm(userAnimal);

    return <div className={classes.chat_menu_div} style={{ backgroundColor : chatMenuColor }}>
        
    </div>
}

export default ChatMenu;