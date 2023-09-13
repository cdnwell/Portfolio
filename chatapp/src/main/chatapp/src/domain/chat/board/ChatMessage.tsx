import classes from "./ChatMessage.module.scss";

import { Message } from "../main/ChatInput";
import { useSelector } from "react-redux";
import { UserPropsType } from "../main/ChatBoard";
import { animalColorConfirm } from "../../../global/utils/colorUtil";

const ChatMessage = ({ message }: { message: Message[] }) => {
  const { userId } = useSelector(
    (state: { user: UserPropsType }) => ({ userId : state.user.userId })
  );

  return (
    <>
      {message &&
        message.map((item, idx) => {
          const messageColor = animalColorConfirm(item.userAnimal);

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
