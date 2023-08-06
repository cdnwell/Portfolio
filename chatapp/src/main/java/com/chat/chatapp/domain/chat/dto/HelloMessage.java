package com.chat.chatapp.domain.chat.dto;

public class HelloMessage {
    private String message;
    private String clientId;

    public HelloMessage() { }

    public HelloMessage(String message) {
        this.message = message;
    }

    public HelloMessage(String message, String clientId) {
        this.message = message;
        this.clientId = clientId;
    }

    public String getMessage() {
        return message;
    }

    public void setName(String message) {
        this.message = message;
    }

    public String getClientId() { return clientId; }

    public void setClientId(String clientId) { this.clientId = clientId; }

}
