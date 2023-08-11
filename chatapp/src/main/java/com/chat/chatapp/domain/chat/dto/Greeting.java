package com.chat.chatapp.domain.chat.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Greeting {
    private String content;
    private String clientId;
}
