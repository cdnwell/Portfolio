import classes from "./ChatBoard.module.scss";

import { useEffect, useRef, useState } from "react";
import { useSelector } from "react-redux";
import axios from "../../../global/config/axiosInstance";
import * as StompJs from "@stomp/stompjs";

import ChatMessage from "../board/ChatMessage";
import ChatStomp from "../stomp/ChatStomp";

interface ChatReduxType {
  chat : { content: string, clientId: string, }[];
}

interface ChatMessageType {
  content: string;
  clientId: string;
};

const ChatBoard = () => {
  const [message, setMessage] = useState<ChatMessageType[]>([]);

  // 1. redux에 있는 메시지 ChatMessage 컴포넌트에 넘겨주기
  const storedMessage = useSelector((state: ChatReduxType) => state.chat);

  useEffect(() => {
    setMessage(storedMessage);
  }, [storedMessage]);

  return (
    <div className={classes.chat_board_root}>
      {message && <ChatMessage message={message} />}
      {/* <ChatStomp /> */}
    </div>
  );
};

export default ChatBoard;
