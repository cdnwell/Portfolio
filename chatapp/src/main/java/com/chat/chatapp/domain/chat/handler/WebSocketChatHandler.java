package com.chat.chatapp.domain.chat.handler;

import com.chat.chatapp.domain.chat.dto.ChatDTO;
import com.chat.chatapp.domain.chat.dto.ChatMessageDTO;
import com.chat.chatapp.domain.chat.dto.ChatRoom;
import com.chat.chatapp.domain.chat.service.ChatService;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Slf4j
@RequiredArgsConstructor
@Component
public class WebSocketChatHandler extends TextWebSocketHandler {

    private final ObjectMapper mapper;
    private final ChatService service;

    protected void handleTextMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
//        String payload = (String) message.getPayload();
//        log.info("payload {}", payload);
//        ChatDTO dto = mapper.readValue(payload, ChatDTO.class);
//        log.info("session {}", dto.toString());
//        ChatRoom room = service.findRoomById(dto.getRoomId());
//        log.info("room {}", room.toString());
//
//        room.handleAction(session, dto, service);
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        log.info(session + " 클라이언트 접속");
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        log.info(session + " 클라이언트 접속 해제");
    }

}
