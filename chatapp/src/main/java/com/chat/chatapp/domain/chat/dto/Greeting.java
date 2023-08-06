package com.chat.chatapp.domain.chat.dto;

public class Greeting {
    private String content;
    private String clientId;

    public Greeting() { }

    public Greeting(String content) {
        this.content = content;
    }

    public Greeting(String content, String clientId) {
        this.content = content;
        this.clientId = clientId;
    }

    public String getContent() {
        return content;
    }

    public String getClientId() { return clientId; }

}
