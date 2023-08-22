import classes from "./ChatInput.module.scss";

import { useState, useEffect, useRef } from "react";
import { useDispatch, useSelector } from "react-redux";

import * as StompJs from "@stomp/stompjs";
import { BiRightArrow } from "react-icons/bi";
import { chatActions, userActions } from "../../../global/reducers";

interface ChatInputInterface {
  stompClient: StompJs.Client;
  message: string;
  clientId: string;
}

export interface Message {
  content: string;
  clientId: string;
}

const ChatInput = () => {
  const [stompClient, setStompClient] = useState<StompJs.Client | null>(null);
  const [connected, setConnected] = useState<boolean>(false);
  const [message, setMessage] = useState<Message[]>([]);
  const [inputMessage, setInputMessage] = useState<string>('');
  const [name, setName] = useState<string>("");
  const [clientId, setClientId] = useState<string | null>(null);

  const dispatch = useDispatch();

  // --- init --- //
  useEffect(() => {
    // WebSocket 연결 설정
    const brokerURL = "ws://localhost:9700/chat";
    const client = new StompJs.Client({ brokerURL });

    client.onConnect = (frame) => {
      setConnected(true);
      console.log("Connected: " + frame);
      client.subscribe("/topic/greetings", (greeting) => {
        const messageContent = JSON.parse(greeting.body);
        console.log("message content", messageContent);
        setMessage((prevMessage) => [
          ...prevMessage,
          {
            content: messageContent.content,
            clientId: messageContent.clientId,
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
    const randomClientId = Math.floor(Math.random() * 10000000) + "";
    dispatch(userActions.setUserId({ userId : randomClientId }));
    setClientId(randomClientId);
  };

  const connect = () => {
    if (stompClient) {
      stompClient.activate();
      enterChatRoom();
      console.log('stomp client entered!');
    }
  };

  const disconnect = () => {
    if (stompClient && stompClient.connected) {
      stompClient.deactivate();
      setConnected(false);
      console.log("Disconnected");
    }
  };

  const sendName = () => {
    console.log('stompClient', stompClient);
    console.log('connected', stompClient?.connected);

    if (stompClient && stompClient.connected) {
      stompClient.publish({
        destination: "/app/hello",
        body: JSON.stringify({ message: inputMessage, clientId }),
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
          onClick={sendName}
        />
        <button onClick={connect}>connect</button>
      </div>
    </div>
  );
};

export default ChatInput;
