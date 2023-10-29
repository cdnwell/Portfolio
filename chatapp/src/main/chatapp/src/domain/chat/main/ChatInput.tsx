import classes from "./ChatInput.module.scss";

import { useState, useEffect, useRef } from "react";
import { useDispatch, useSelector } from "react-redux";

import * as StompJs from "@stomp/stompjs";
import { BiRightArrow } from "react-icons/bi";
import { BACKEND_URL } from "../../../global/config/constant";
import { animalColorConfirm } from "../../../global/utils/colorUtil";
import { emoticonActions } from "../../../global/reducers/emoticon";
import { chatActions } from "@/global/reducers/chat";
import { userActions } from "@/global/reducers/user";

export interface Message {
  content: string;
  clientId: string;
  userAnimal: string;
  emoticon: string;
  pubTime: string;
};

const ChatInput = ({ userAnimal, handleMessages } : { userAnimal : string; handleMessages : (messages : Message[]) => void }) => {
  const [stompClient, setStompClient] = useState<StompJs.Client | null>(null);
  const [message, setMessage] = useState<Message[]>([]);
  const [inputMessage, setInputMessage] = useState<string>('');
  // const [clientId, setClientId] = useState<string | null>(null);
  const inputRef = useRef<HTMLInputElement | null>(null);

  const dispatch = useDispatch();

  const hasUserId = useSelector((state: { user : { userId: string; }}) => state.user.userId );
  const messages = useSelector((state : { chat : Message[]}) => state.chat );
  const emoticonSrc = useSelector((state: { emoticon : { src: string; }}) => state.emoticon.src );
  
  // menu color
  const chatMenuColor = animalColorConfirm(userAnimal);

  // --- init --- //
  useEffect(() => {
    // WebSocket 연결 설정
    const brokerURL = `ws://${BACKEND_URL}:9700/chat`;
    const client = new StompJs.Client({ brokerURL });

    client.onConnect = (frame) => {
      console.log("Connected: " + frame);
      client.subscribe("/topic/greetings", (greeting) => {
        const messageContent = JSON.parse(greeting.body);
        console.log("message content", messageContent);
        console.log('user animal', userAnimal);
        // **메세지 순서를 바꿔 아래에서 위로 올라가는 메세지 구현
        setMessage((prevMessage) => [
          {
            content: messageContent.content,
            clientId: messageContent.clientId,
            userAnimal: messageContent.userAnimal,
            emoticon: messageContent.emoticon,
            pubTime: messageContent.pubTime,
          },
          ...prevMessage,
        ]);
      });
    };

    client.onWebSocketError = (error) => {
      console.error("Error with WebSocket", error);
    };

    client.onStompError = (frame) => {
      console.error("Broker reported error: " + frame.headers["message"]);
      console.error("Additional details: " + frame.body);
    };

    setStompClient(client);

    client.activate();

    if(!hasUserId) {
      console.log('entered chat rooms !');
      enterChatRoom();
    }

    // 컴포넌트가 언마운트될 때 WebSocket 연결 해제
    return () => {
      if (client.connected) {
        client.deactivate();
      }
    };
  }, []);

  // 전역 객체에 리스너 추가(키가 입력 되었을 경우, focus가 안되있다면 input에 focus를 한다.)
  useEffect(()=>{
    window.addEventListener('keydown', handleKeyPress);

    return () => {
      window.removeEventListener('keydown', handleKeyPress);
    }
  }, []);

  const handleKeyPress = (event: KeyboardEvent) => {
    if (event.key) {
      inputRef.current?.focus();
    }
  };

  // session 처리의 핵심
  // 처음 session message 있는지 확인
  useEffect(() => {
    if(messages)
      setMessage([...messages]);
  }, []);

  // message - dispatch로 redux에 저장
  // action에 들어갈 message는 누적되기 때문에 [...action]으로 저장해주어야 한다.
  useEffect(() => {
    dispatch(chatActions.storeMessage(message));
    console.log('message storing', message);
    handleMessages([...message]);
  },[message]);

  const enterChatRoom = () => {
    // 채팅방에 입장할 때 난수 생성 (0 이상 9999999 이하의 정수)
    const randomClientId = String(Math.floor(Math.random() * 10000000));
    dispatch(userActions.setUserId(randomClientId));
    console.log(randomClientId);
  };

  const sendMessage = () => {
    console.log('stompClient', stompClient);
    console.log('connected', stompClient?.connected);
    
    if(!inputMessage || inputMessage.trim().length === 0) return;
    
    let currentTime: string = String(new Date());
    const currentTimeArr: string[] = currentTime.split(" ")[4].split(":");
    const current: string = currentTimeArr[0] + ":" + currentTimeArr[1];

    if (stompClient && stompClient.connected) {
      stompClient.publish({
        destination: "/app/hello",
        body: JSON.stringify({ content: inputMessage, clientId: hasUserId, userAnimal, emoticon: emoticonSrc, pubTime: current }),
      });
      console.log('emoticon src :', emoticonSrc);
      dispatch(chatActions.storeMessage([{ message: inputMessage, clientId: hasUserId, userAnimal }]));
      setInputMessage('');
      dispatch(emoticonActions.setEmoticon(''));
    } else {
      console.error("STOMP connection not available");
    }
  };

  const handleInputMessage = (event: React.ChangeEvent<HTMLInputElement>) => {
    setInputMessage(event.target.value);
  };

  const enterSendMessage = (event: React.KeyboardEvent<HTMLInputElement>) => {
    if (event.key === 'Enter') {
      sendMessage();
    }
  };

  return (
    <div className={classes.chat_type_input_div}>
      <div className={classes.chat_type_input_wrapper}>
        <input
          type="text"
          className={classes.chat_type_input}
          value={inputMessage}
          onChange={handleInputMessage}
          onKeyDown={enterSendMessage}
          ref={inputRef}
        />
        <BiRightArrow
          className={classes.chat_type_enter_btn}
          style={{ backgroundColor : chatMenuColor }}
          onClick={sendMessage}
        />
      </div>
    </div>
  );
};

export default ChatInput;
