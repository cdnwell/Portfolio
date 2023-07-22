import classes from './ChatMain.module.scss';
import ChatBoard from './main/ChatBoard';

import ChatInput from './main/ChatInput';


const ChatMain = () => {
    return <div className={classes.chat_main_div}>
        <ChatBoard />
        <ChatInput />
    </div>
}

export default ChatMain;