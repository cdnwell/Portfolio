import React, { useState, useEffect } from 'react';
import StompJs from "@stomp/stompjs";
import { BACKEND_ENDPOINT } from '../../../global/config/constant';

const ChatStomp: React.FC = () => {
    const [stompClient, setStompClient] = useState<StompJs.Client | null>(null);
    const [connected, setConnected] = useState<boolean>(false);

    useEffect(() => {
        // Stomp 클라이언트 생성 및 초기화
        const stomp = new StompJs.Client({
            brokerURL: `ws://${BACKEND_ENDPOINT}/gs-guide-websocket`,
        });
        setStompClient(stomp);

        // 이벤트 리스너 설정
        stomp.onConnect = (frame) => {
            setConnected(true);
            console.log('연결됨: ' + frame);
            stomp.subscribe('/topic/greetings', (greeting) => {
                showGreeting(JSON.parse(greeting.body).content);
            });
        };

        stomp.onWebSocketError = (error) => {
            console.error('웹소켓 오류: ', error);
        }

        stomp.onStompError = (frame) => {
            console.error('브로커 오류: ' + frame.headers['message']);
            console.error('추가 정보: ' + frame.body);
        };

    }, []);

    // function setConnected (connected: boolean) {
    //     // 여기서 필요한 UI 업데이트 처리를 그대로 유지합니다.
    // }

    function connect() {
        if (stompClient) {
            stompClient.activate();
        }
    }

    function disconnect() {
        if (stompClient) {
            stompClient.deactivate();
        }
        setConnected(false);
        console.log('연결 해제됨');
    }

    function sendName() {
        if (stompClient) {
            stompClient.publish({
                destination: '/app/hello',
                body: JSON.stringify({ name : (document.getElementById('name') as HTMLInputElement).value })
            });
        }
    }

    function showGreeting(message: string) {
        //여기서 필요한 처리를 그대로 유지합니다.
    }

    return (
        <div>
            <form onSubmit={(e) => e.preventDefault()}>
                <button id="connect" onClick={connect} disabled={connected}>
                    연결하기
                </button>
                <button id="disconnect" onClick={disconnect} disabled={!connected}>
                    연결 해제하기
                </button>
                <button id="send" onClick={sendName}>
                    이름 보내기
                </button>
                <input type="text" id="name" placeholder="이름을 입력하세요." />
                <div id="conversation" style={{ display: connected ? "block" : "none" }}>
                    {/* 대화 내용을 표시할 부분 */}
                </div>
            </form>
        </div>
    )
}

export default ChatStomp;