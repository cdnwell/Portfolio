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

  useEffect(() => {
    setMessage(storedMessage);
    // console.log('stored message', storedMessage);
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
