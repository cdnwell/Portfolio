import classes from './ChatMain.module.scss';
import { useSelector } from 'react-redux';

import ChatBoard, { UserPropsType } from './main/ChatBoard';
import ChatInput, { Message } from './main/ChatInput';
import { useState } from 'react';


const ChatMain = () => {
    const userAnimal = useSelector((state : { user : UserPropsType }) => state.user.userAnimal )
    const [message, setMessage] = useState<Message[]>();
    
    const handleMessages = (messages : Message[]) => {
        setMessage([...messages]);
    }

    return <div className={classes.chat_main_div}>
        <ChatBoard messages={message ?? []} />
        <ChatInput userAnimal={userAnimal} handleMessages={handleMessages} />
    </div>
}

export default ChatMain;