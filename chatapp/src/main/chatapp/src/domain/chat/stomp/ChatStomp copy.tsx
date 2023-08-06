import React, { useState, useEffect } from 'react';
import { Client, Message } from "@stomp/stompjs";
import SockJS from 'sockjs-client';
import { BACKEND_ENDPOINT } from '../../../global/config/constant';

const ChatStomp: React.FC = () => {
    const [stompClient, setStompClient] = useState<Client | null>(null);
    const [message, setMessage] = useState<string[]>([""]);
    const [isConnected, setIsConnected] = useState(false);

    useEffect(() => {
        // Stomp 클라이언트 생성 및 초기화
        // const stomp = new Client({
            // brokerURL : 'ws://127.0.0.1:9700/gs-guide-websocket',
            // connectHeaders: {
            //     "auth-token": "spring-chat-auth-token"
            // },
            // onConnect: (frame) => {
            //     setConnected(true);
            //     console.log('연결됨: ' + frame);
            //     stomp.subscribe('/topic/greetings', (greeting) => {
            //         showGreeting(JSON.parse(greeting.body).content);
            //     });
            // },
            // onStompError: (frame) => {
            //     console.error('브로커 오류: ' + frame.headers['message']);
            //     console.error('추가 정보: ' + frame.body);
            // },
            // onWebSocketError: (error) => {
            //     console.error('웹소켓 오류: ', error);
            // },
        // });
        
        // setStompClient(stomp);

        // 이벤트 리스너 설정
        // stomp.onConnect = (frame) => {
        //     setConnected(true);
        //     console.log('연결됨: ' + frame);
        //     stomp.subscribe('/topic/greetings', (greeting) => {
        //         showGreeting(JSON.parse(greeting.body).content);
        //     });
        // };

        // stomp.onWebSocketError = (error) => {
        //     console.error('웹소켓 오류: ', error);
        // }

        // stomp.onStompError = (frame) => {
        //     console.error('브로커 오류: ' + frame.headers['message']);
        //     console.error('추가 정보: ' + frame.body);
        // };

        wsSubscribe();

        console.log('stomp is running');
    }, []);

    function setConnected (connected: boolean) {
        // 여기서 필요한 UI 업데이트 처리를 그대로 유지합니다.
        setIsConnected(connected);
    }

    // function connect() {
    //     if (stompClient) {
    //         stompClient.activate();
    //     }
    // }

    // function disconnect() {
    //     if (stompClient) {
    //         stompClient.deactivate();
    //     }
    //     setConnected(false);
    //     console.log('연결 해제됨');
    // }

    function sendName() {
        if (stompClient) {
            client.publish({
                destination: '/app/hello',
                body: JSON.stringify({ name : (document.getElementById('name') as HTMLInputElement).value })
            });
        }
    }

    function showGreeting(message: string) {
        setMessage((prev) => [...prev, message]);
    }

    const client = new Client({
        brokerURL: 'ws://127.0.0.1:9700/chat',
        onConnect: () => {
            client.subscribe('/topic/greetings', (greeting) => {
                showGreeting(JSON.parse(greeting.body).content);
            });
        }
    });

    // client.activate();

    const wsSubscribe = () => {
        client.activate();
        setConnected(true);
        setStompClient(client);
        // client.onConnect = () => {
        //     client.subscribe('/topic/greetings', (greeting) => {
        //         showGreeting(JSON.parse(greeting.body).content);
        //     });
        // }
    }

    const wsDisconnect = () => {
        client.deactivate();
        setConnected(false);
    }

    return (
        <div>
            <form onSubmit={(e) => e.preventDefault()}>
                <button id="connect" onClick={wsSubscribe} disabled={isConnected}>
                    연결하기
                </button>
                <button id="disconnect" onClick={wsDisconnect} disabled={!isConnected}>
                    연결 해제하기
                </button>
                <button id="send" onClick={sendName}>
                    이름 보내기
                </button>
                <input type="text" id="name" placeholder="이름을 입력하세요." />
                <div id="conversation">
                    {/* 대화 내용을 표시할 부분 */}
                    {message && message.map((item, idx) => <p key={idx}>{item}</p>)}
                </div>
            </form>
        </div>
    )
}

export default ChatStomp;