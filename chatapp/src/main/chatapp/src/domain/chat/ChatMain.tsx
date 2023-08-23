import { useSelector } from 'react-redux';
import classes from './ChatMain.module.scss';
import ChatBoard, { UserPropsType } from './main/ChatBoard';

import ChatInput from './main/ChatInput';


const ChatMain = () => {
    const userAnimal = useSelector((state : { user : UserPropsType }) => state.user.userAnimal )

    return <div className={classes.chat_main_div}>
        <ChatBoard />
        <ChatInput userAnimal={userAnimal} />
    </div>
}

export default ChatMain;