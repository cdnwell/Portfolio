import classes from './ChatPlusRoom.module.scss';

import { AiOutlinePlusCircle } from 'react-icons/ai';

const ChatPlusRoom = () => {
    return <div className={classes.chat_plus_room_div}>
        <p className={classes.chat_plus_room_p}>채팅방 추가</p>
        <AiOutlinePlusCircle className={classes.chat_plus_room_icon} />
    </div>
}

export default ChatPlusRoom;