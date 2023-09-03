import classes from "./ChatInput.module.scss";

import { useState, useEffect } from "react";
import { useDispatch } from "react-redux";

import * as StompJs from "@stomp/stompjs";
import { BiRightArrow } from "react-icons/bi";
import { chatActions, userActions } from "../../../global/reducers";
import { BACKEND_URL } from "../../../global/config/constant";

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

  const dispatch = useDispatch();

  // menu color
  const chatMenuColor = userAnimal === 'Bear' ? '#c03546' 
                        : userAnimal === 'Bird' ? '#ff7473' 
                        : userAnimal === 'Dog' ? '#ffc952'
                        : userAnimal === 'Dolphin' ? '#47b8e0'
                        : 'black';

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

    enterChatRoom();

    // 컴포넌트가 언마운트될 때 WebSocket 연결 해제
    return () => {
      if (client.connected) {
        client.deactivate();
      }
    };
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

  // const connect = () => {
  //   if (stompClient) {
  //     stompClient.activate();
  //     enterChatRoom();
  //     console.log('stomp client entered!');
  //   }
  // };

  // const disconnect = () => {
  //   if (stompClient && stompClient.connected) {
  //     stompClient.deactivate();
  //     setConnected(false);
  //     console.log("Disconnected");
  //   }
  // };

  const sendName = () => {
    console.log('stompClient', stompClient);
    console.log('connected', stompClient?.connected);

    if (stompClient && stompClient.connected) {
      stompClient.publish({
        destination: "/app/hello",
        body: JSON.stringify({ message: inputMessage, clientId, userAnimal }),
      });
    } else {
      console.error("STOMP connection not available");
    }
  };

  const handleInputMessage = (event: React.ChangeEvent<HTMLInputElement>) => {
    setInputMessage(event.target.value);
    // console.log(event.target.value);
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
