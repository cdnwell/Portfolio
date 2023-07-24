import classes from "./ChatMessage.module.scss";

import ChatMessageType from "../types/ChatMessageType";

const ChatMessage = ({ message }: ChatMessageType) => {
  return (
    <>
      {message &&
        message.map((item, idx) => {
          return (
            <div className={classes.chat_board_message_root} key={idx}>
              <p>{item.message}</p>
            </div>
          );
        })}
    </>
  );
};

export default ChatMessage;
