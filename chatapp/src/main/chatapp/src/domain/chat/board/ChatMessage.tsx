import classes from "./ChatMessage.module.scss";

import ChatMessageType from "../types/ChatMessageType";
import { Message } from "../main/ChatInput";

const ChatMessage = ({ message }: { message : Message[]}) => {
  return (
    <>
      {message &&
        message.map((item, idx) => {
          return (
            <div className={classes.chat_board_message_root} key={idx}>
              <p>{item.content}</p>
            </div>
          );
        })}
    </>
  );
};

export default ChatMessage;
