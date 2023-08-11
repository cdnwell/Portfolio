import classes from "./ChatMessage.module.scss";

import ChatMessageType from "../types/ChatMessageType";
import { Message } from "../main/ChatInput";
import { useSelector } from "react-redux";

const ChatMessage = ({ message }: { message: Message[] }) => {
  const userId = useSelector(
    (state: { user: { userId: string } }) => state.user.userId
  );

  const isMyMessage = (clientId: string) => {
    return clientId === userId
      ? classes.chat_board_message_mine
      : classes.chat_board_message_others;
  };

  return (
    <>
      {message &&
        message.map((item, idx) => {
          return (
            <div
              className={`${classes.chat_board_message_root} ${
                item.clientId === userId
                  ? classes.chat_board_message_mine
                  : classes.chat_board_message_others
              }`}
              key={idx}
            >
              <p>{item.content}</p>
            </div>
          );
        })}
    </>
  );
};

export default ChatMessage;
