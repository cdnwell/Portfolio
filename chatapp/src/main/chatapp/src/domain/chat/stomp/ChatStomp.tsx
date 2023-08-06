import React, { useState, useEffect } from 'react';
import * as StompJs from '@stomp/stompjs';

interface Message {
    content: string;
    clientId: string;
}

const StompClientExample: React.FC = () => {
  const [stompClient, setStompClient] = useState<StompJs.Client | null>(null);
  const [connected, setConnected] = useState<boolean>(false);
  const [greetings, setGreetings] = useState<Message[]>([]);
  const [name, setName] = useState<string>('');
  const [clientId, setClientId] = useState<string | null>(null);

  useEffect(() => {
    // WebSocket 연결 설정
    const brokerURL = 'ws://localhost:9700/chat';
    const client = new StompJs.Client({ brokerURL });

    client.onConnect = (frame) => {
      setConnected(true);
      console.log('Connected: ' + frame);
      client.subscribe('/topic/greetings', (greeting) => {
        const messageContent = JSON.parse(greeting.body);
        console.log('message content', messageContent);
        setGreetings((prevGreetings) => [...prevGreetings, { content: messageContent.content, clientId: messageContent.clientId }]);
      });
    };

    client.onWebSocketError = (error) => {
      console.error('Error with WebSocket', error);
    };

    client.onStompError = (frame) => {
      console.error('Broker reported error: ' + frame.headers['message']);
      console.error('Additional details: ' + frame.body);
    };

    setStompClient(client);

    // 컴포넌트가 언마운트될 때 WebSocket 연결 해제
    return () => {
      if (client.connected) {
        client.deactivate();
      }
    };
  }, []);

  const enterChatRoom = () => {
    // 채팅방에 입장할 때 난수 생성 (0 이상 9999 이하의 정수)
    const randomClientId = Math.floor(Math.random() * 10000000) + '';
    setClientId(randomClientId);
  };

  const connect = () => {
    if (stompClient) {
      stompClient.activate();
      enterChatRoom();
    }
  };

  const disconnect = () => {
    if (stompClient && stompClient.connected) {
      stompClient.deactivate();
      setConnected(false);
      console.log('Disconnected');
    }
  };

  const sendName = () => {
    if (stompClient && stompClient.connected) {
      stompClient.publish({
        destination: '/app/hello',
        body: JSON.stringify({ name, clientId }),
      });

    } else {
      console.error('STOMP connection not available');
    }
  };

  return (
    <div>
      <form onSubmit={(e) => e.preventDefault()}>
        <label>
          Name:
          <input type="text" value={name} onChange={(e) => setName(e.target.value)} />
        </label>
        <button type="button" onClick={connect} disabled={connected}>
          Connect
        </button>
        <button type="button" onClick={disconnect} disabled={!connected}>
          Disconnect
        </button>
        <button type="button" onClick={sendName} disabled={!connected}>
          Send
        </button>
      </form>
      {connected && (
        <div>
          <h3>Conversation:</h3>
          <table>
            <tbody>
              {greetings.map((greeting, index) => (
                <tr key={index}>
                  <td>{greeting.clientId === clientId ? 'You: ' : ''}{ greeting.content }</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
};

export default StompClientExample;
