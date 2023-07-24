package com.chat.chatapp.domain.chat.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ChatDTO {

    // 메시지 타입 : 입장 채팅
    // 메시지 타입에 따라서 동작하는 구조가 달라진다.
    // 입장과 퇴장 ENTER과 LEAVE의 경우 입장/퇴장 이벤트 처리가 실행되고,
    // TALK는 말 그대로 해당 채팅방을 sub 하고 있는 모든 클라이언트에게 전달됩니다.
    public enum MessageType {
        ENTER, LEAVE, TALK;
    }

    private MessageType type;
    private String roomId;
    private String sender;
    private String message;
    private String time;

}
