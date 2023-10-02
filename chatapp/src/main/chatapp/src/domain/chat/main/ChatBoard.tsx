import classes from "./ChatBoard.module.scss";

import { useEffect, useState } from "react";
import { useSelector } from "react-redux";

import ChatMessage from "../board/ChatMessage";
import { Message } from "./ChatInput";
import ChatEmoticon from "../board/ChatEmoticon";

export interface UserPropsType {
  userId: string;
  userAnimal: string;
};

const ChatBoard = ({ messages } : { messages : Message[]}) => {
  const [message, setMessage] = useState<Message[]>([]);

  // 1. redux에 있는 메시지 ChatMessage 컴포넌트에 넘겨주기
  let storedMessage = useSelector((state: { chat : Message[] }) => state.chat );
  let userInfo = useSelector((state : { user : { userId: string; userAnimal: string; } }) => state.user );
  let emoticon = useSelector((state: { emoticon: { src: string; }}) => state.emoticon.src);

  useEffect(() => {
    if(!message || message.length === 0) 
      setMessage([...storedMessage]);
    else
      setMessage([...messages]);
  }, [storedMessage, messages]);

  useEffect(() => {
    console.log('user Info :', userInfo);
  }, [userInfo]);

  useEffect(() => {
    console.log('emoticon src :', emoticon);
  }, [emoticon]);

  return (
    <div className={classes.chat_board_root}>
      {message && <ChatMessage message={message} />}
      {emoticon && <ChatEmoticon className={classes.emo_component} src={emoticon} />}
    </div>
  );
};

export default ChatBoard;
