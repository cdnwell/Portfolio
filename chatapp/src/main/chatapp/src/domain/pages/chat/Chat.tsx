import classes from './Chat.module.scss';

import ChatMain from '../../chat/ChatMain';
import ChatMenu from '../../chat/ChatMenu';


const Chat = () => {
    return (
        <div className={classes.chat_div}>
            <ChatMenu />
            <ChatMain />
        </div>
    )
}

export default Chat;