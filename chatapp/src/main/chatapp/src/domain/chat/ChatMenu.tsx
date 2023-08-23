import classes from './ChatMenu.module.scss';
import { UserPropsType } from './main/ChatBoard';

import ChatPlusRoom from './menu/ChatPlusRoom';
import { useSelector } from 'react-redux';

const ChatMenu = () => {
    // 1. redux에 있는 유저 동물가져오기 
    let userAnimal = useSelector((state : { user : UserPropsType}) => state.user.userAnimal);

    const chatMenuColor = userAnimal === 'Bear' ? '#c03546' 
                        : userAnimal === 'Bird' ? '#ff7473' 
                        : userAnimal === 'Dog' ? '#ffc952'
                        : userAnimal === 'Dolphin' ? '#47b8e0'
                        : 'black';

    return <div className={classes.chat_menu_div} style={{ backgroundColor : chatMenuColor }}>
        <ChatPlusRoom userAnimal={userAnimal} />
    </div>
}

export default ChatMenu;