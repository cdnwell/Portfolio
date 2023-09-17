import classes from "./ChatBoard.module.scss";

import { useEffect, useState } from "react";
import { useSelector } from "react-redux";

import ChatMessage from "../board/ChatMessage";
import { Message } from "./ChatInput";

export interface UserPropsType {
  userId: string;
  userAnimal: string;
};

const ChatBoard = () => {
  const [message, setMessage] = useState<Message[]>([]);

  // 1. redux에 있는 메시지 ChatMessage 컴포넌트에 넘겨주기
  let storedMessage = useSelector((state: { chat : Message[]}) => state.chat );
  let userInfo = useSelector((state : { user : { userId: string; userAnimal: string; } }) => state.user );

  useEffect(() => {
    setMessage([...storedMessage]);
    console.log('stored message', storedMessage);
  }, [storedMessage]);

  useEffect(() => {
    console.log('user Info :', userInfo);
  }, [userInfo]);

  return (
    <div className={classes.chat_board_root}>
      {message && <ChatMessage message={message} />}
    </div>
  );
};

export default ChatBoard;
