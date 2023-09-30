import classes from "./ChatMessage.module.scss";

import { useEffect } from "react";

import { Message } from "../main/ChatInput";
import { useSelector } from "react-redux";
import { UserPropsType } from "../main/ChatBoard";
import { animalColorConfirm } from "../../../global/utils/colorUtil";

const ChatMessage = ({ message }: { message: Message[] }) => {
  const { userId } = useSelector(
    (state: { user: UserPropsType }) => ({ userId : state.user.userId })
  );

  useEffect(()=>{
    console.log('messages :', message);
  }, []);

  return (
    <>
      {message &&
        message.map((item, idx) => {
          const messageColor = animalColorConfirm(item.userAnimal);

          if(!item.content || item.content.trim().length === 0) return;

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
              {item.emoticon && <div className={classes.msg_emo_div}>
                <img src={item.emoticon} alt="이모티콘" />
              </div>}
              <p>{item.content}</p>
            </div>
          );
        })}
    </>
  );
};

export default ChatMessage;
