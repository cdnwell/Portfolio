import classes from './ChatBoard.module.scss';

import { useEffect, useRef, useState } from 'react';
import axios from '../../../global/config/axiosInstance';

import ChatMessage from '../board/ChatMessage';
import ChatStomp from '../stomp/ChatStomp';

const ChatBoard = () => {
    const [message, setMessage] = useState();

    useEffect(()=> {
        axios.get("/test")
            .then((response: any) => {
                console.log('response', response);
                console.log('response.data', response.data);
                
                const data = response.data;

                setMessage(data);
            });
    },[]);

    return <div className={classes.chat_board_root}>
        {/* {message && <ChatMessage message={message} />} */}
        <ChatStomp />
    </div>
}

export default ChatBoard;