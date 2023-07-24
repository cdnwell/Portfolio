package com.chat.chatapp.domain.chat.dto;

import com.chat.chatapp.domain.chat.service.ChatService;
import lombok.Builder;
import lombok.Data;
import org.springframework.web.socket.WebSocketSession;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

@Data
public class ChatRoom {
    private String roomId;
    private String roomName;
    private long userCount;

    private HashMap<String, String> userList = new HashMap<>();

    public ChatRoom create(String roomName) {
        ChatRoom chatRoom = new ChatRoom();
        chatRoom.roomId = UUID.randomUUID().toString();
        chatRoom.roomName = roomName;

        return chatRoom;
    }
}
