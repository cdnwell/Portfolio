package com.chat.chatapp.domain.chat.dto;

import lombok.*;

@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HelloMessage {
    private String content;
    private String clientId;
    private String userAnimal;
    private String emoticon;
    private String pubTime;
}
