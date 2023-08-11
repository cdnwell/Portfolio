package com.chat.chatapp.domain.chat.dto;

import lombok.*;

@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HelloMessage {
    private String message;
    private String clientId;
}
