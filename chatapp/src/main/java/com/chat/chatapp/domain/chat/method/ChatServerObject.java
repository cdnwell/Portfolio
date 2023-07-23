package com.chat.chatapp.domain.chat.method;

import com.chat.chatapp.domain.chat.dto.ChatMessageDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Component
public class ChatServerObject {

    private ServerSocket serverSocket;
    private List<ChatHandlerObject> list;

    public ChatServerObject() {
        try {
            serverSocket = new ServerSocket(9500);
            log.info("서버 준비 완료");
            list = new ArrayList<>();
            while (true) {
                Socket socket = serverSocket.accept();
                ChatHandlerObject handler = ChatHandlerObject(socket, list);
                handler.start();
                list.add(handler);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
