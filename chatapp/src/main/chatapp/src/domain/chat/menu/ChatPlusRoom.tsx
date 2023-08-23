import classes from './ChatPlusRoom.module.scss';

import { AiOutlinePlusCircle } from 'react-icons/ai';

const ChatPlusRoom = ({ userAnimal } : { userAnimal : string; } ) => {
    const chatMenuColor = userAnimal === 'Bear' ? '#c03546' 
                        : userAnimal === 'Bird' ? '#ff7473' 
                        : userAnimal === 'Dog' ? '#ffc952'
                        : userAnimal === 'Dolphin' ? '#47b8e0'
                        : 'black';

    return <div className={classes.chat_plus_room_div} style={{ backgroundColor : chatMenuColor }}>
        <p className={classes.chat_plus_room_p}>채팅방 추가</p>
        <AiOutlinePlusCircle className={classes.chat_plus_room_icon} />
    </div>
}

export default ChatPlusRoom;