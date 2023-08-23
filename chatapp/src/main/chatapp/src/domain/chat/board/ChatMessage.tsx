import classes from "./ChatMessage.module.scss";

import ChatMessageType from "../types/ChatMessageType";
import { Message } from "../main/ChatInput";
import { useSelector } from "react-redux";
import { UserPropsType } from "../main/ChatBoard";

const ChatMessage = ({ message }: { message: Message[] }) => {
  const { userId, userAnimal } = useSelector(
    (state: { user: UserPropsType }) => ({ userId : state.user.userId, userAnimal : state.user.userAnimal })
  );

  const chatMenuColor = userAnimal === 'Bear' ? '#c03546' 
  : userAnimal === 'Bird' ? '#ff7473' 
  : userAnimal === 'Dog' ? '#ffc952'
  : userAnimal === 'Dolphin' ? '#47b8e0'
  : 'black';

  return (
    <>
      {message &&
        message.map((item, idx) => {
          const messageColor = item.userAnimal === 'Bear' ? '#c03546' 
                              : item.userAnimal === 'Bird' ? '#ff7473' 
                              : item.userAnimal === 'Dog' ? '#ffc952'
                              : item.userAnimal === 'Dolphin' ? '#47b8e0'
                              : 'black';

          return (
            <div
              className={`${classes.chat_board_message_root} ${
                item.clientId === userId
                  ? classes.chat_board_message_mine
                  : classes.chat_board_message_others
              }`}
              key={idx}
              style={{ backgroundColor : messageColor }}
            >
              <p>{item.content}</p>
            </div>
          );
        })}
    </>
  );
};

export default ChatMessage;
