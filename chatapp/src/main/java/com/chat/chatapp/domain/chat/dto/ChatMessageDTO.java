package com.chat.chatapp.domain.chat.dto;

import lombok.Data;



@Data
public class ChatMessageDTO {
    private String mno;
    private String message;
    private String writer;
    private String nick;
    private int readNum;
    private String roomId;
    private String time;
    private ChatInfoEnum type;
}
