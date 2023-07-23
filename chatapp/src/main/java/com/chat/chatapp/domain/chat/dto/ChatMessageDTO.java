package com.chat.chatapp.domain.chat.dto;

import lombok.Data;

@Data
public class ChatMessageDTO {
    private String mno;
    private String content;
    private String writer;
    private int readNum;
}
