import classes from "./ChatBoard.module.scss";

import { useEffect, useRef, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import axios from "../../../global/config/axiosInstance";
import * as StompJs from "@stomp/stompjs";

import ChatMessage from "../board/ChatMessage";
import ChatStomp from "../stomp/ChatStomp";
import { chatActions } from "../../../global/reducers";

interface ChatReduxType {
  content: string, clientId: string
};

interface ChatMessageType {
  content: string;
  clientId: string;
};

const ChatBoard = () => {
  const [message, setMessage] = useState<ChatMessageType[]>([]);

  // 1. redux에 있는 메시지 ChatMessage 컴포넌트에 넘겨주기
  let storedMessage = useSelector((state: { chat : ChatReduxType[]}) => state.chat );

  useEffect(() => {
    setMessage(storedMessage);
    console.log('stored message', storedMessage);
  }, [storedMessage]);

  // const dispatch = useDispatch();

  // const digMessage = dispatch(chatActions.digMessage());

  // console.log(digMessage);

  return (
    <div className={classes.chat_board_root}>
      {message && <ChatMessage message={message} />}
      {/* <ChatStomp /> */}
    </div>
  );
};

export default ChatBoard;
