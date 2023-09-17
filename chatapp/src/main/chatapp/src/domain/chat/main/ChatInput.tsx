import classes from "./ChatInput.module.scss";

import { useState, useEffect, useRef } from "react";
import { useDispatch, useSelector } from "react-redux";

import * as StompJs from "@stomp/stompjs";
import { BiRightArrow } from "react-icons/bi";
import { chatActions, userActions } from "../../../global/reducers";
import { BACKEND_URL } from "../../../global/config/constant";
import { animalColorConfirm } from "../../../global/utils/colorUtil";

export interface Message {
  content: string;
  clientId: string;
  userAnimal: string;
}

const ChatInput = ({ userAnimal } : { userAnimal : string; }) => {
  const [stompClient, setStompClient] = useState<StompJs.Client | null>(null);
  const [message, setMessage] = useState<Message[]>([]);
  const [inputMessage, setInputMessage] = useState<string>('');
  const [clientId, setClientId] = useState<string | null>(null);
  const inputRef = useRef<HTMLInputElement | null>(null);

  const dispatch = useDispatch();

  const hasUserId = useSelector((state: { user : { userId: string; }}) => state.user.userId );
  const messages = useSelector((state : { chat : Message[]}) => state.chat );

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
        setMessage((prevMessage) => [
          ...prevMessage,
          {
            content: messageContent.content,
            clientId: messageContent.clientId,
            userAnimal: messageContent.userAnimal,
          },
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
  },[message]);

  const enterChatRoom = () => {
    // 채팅방에 입장할 때 난수 생성 (0 이상 9999999 이하의 정수)
    const randomClientId = String(Math.floor(Math.random() * 10000000));
    dispatch(userActions.setUserId(randomClientId));
    setClientId(randomClientId);
    console.log(randomClientId);
  };

  const sendName = () => {
    console.log('stompClient', stompClient);
    console.log('connected', stompClient?.connected);
    if(!inputMessage || inputMessage.trim().length === 0) return;

    if (stompClient && stompClient.connected) {
      stompClient.publish({
        destination: "/app/hello",
        body: JSON.stringify({ message: inputMessage, clientId: hasUserId, userAnimal }),
      });
      dispatch(chatActions.storeMessage([{ message: inputMessage, clientId: hasUserId, userAnimal }]));
      setInputMessage('');
    } else {
      console.error("STOMP connection not available");
    }
  };

  const handleInputMessage = (event: React.ChangeEvent<HTMLInputElement>) => {
    setInputMessage(event.target.value);
  };

  const enterSendMessage = (event: React.KeyboardEvent<HTMLInputElement>) => {
    if (event.key === 'Enter') {
      sendName();
    }
  };

  return (
    <div className={classes.chat_type_input_div}>
      <div className={classes.chat_type_input_wrapper}>
        <input
          type="text"
          className={classes.chat_type_input}
          placeholder="채팅 내용을 입력해주세요."
          value={inputMessage}
          onChange={handleInputMessage}
          onKeyDown={enterSendMessage}
          ref={inputRef}
        />
        <BiRightArrow
          className={classes.chat_type_enter_btn}
          style={{ backgroundColor : chatMenuColor }}
          onClick={sendName}
        />
      </div>
    </div>
  );
};

export default ChatInput;
