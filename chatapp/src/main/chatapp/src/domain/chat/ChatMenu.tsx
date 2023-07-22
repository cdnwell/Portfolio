import classes from './ChatMenu.module.scss';
import ChatPlusRoom from './menu/ChatPlusRoom';

const ChatMenu = () => {
    return <div className={classes.chat_menu_div}>
        <ChatPlusRoom />
    </div>
}

export default ChatMenu;