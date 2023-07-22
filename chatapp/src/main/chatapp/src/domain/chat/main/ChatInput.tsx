import classes from './ChatInput.module.scss';

import { BiRightArrow } from 'react-icons/bi';

const ChatInput = () => {
    return (
        <div className={classes.chat_type_input_div}>
            <div className={classes.chat_type_input_wrapper}>
                <input type="text" className={classes.chat_type_input} placeholder='채팅 내용을 입력해주세요.' />
                <BiRightArrow className={classes.chat_type_enter_btn} />
            </div>
        </div>
    );
}

export default ChatInput;