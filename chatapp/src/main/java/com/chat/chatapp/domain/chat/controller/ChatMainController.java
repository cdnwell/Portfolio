package com.chat.chatapp.domain.chat.controller;

import com.chat.chatapp.domain.chat.dto.ChatMessageDTO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ChatMainController {

    @GetMapping("/test")
    @ResponseBody
    public List<ChatMessageDTO> testMessage() {
        List<ChatMessageDTO> list = new ArrayList<>();

        ChatMessageDTO dto = new ChatMessageDTO();
        dto.setMessage("hello, chat message!");

        ChatMessageDTO dto2 = new ChatMessageDTO();
        dto2.setMessage("hello, chat2 message2!");

        ChatMessageDTO dto3 = new ChatMessageDTO();
        dto3.setMessage("chat messages...");

        ChatMessageDTO dto4 = new ChatMessageDTO();
        dto4.setMessage("hello chat 4");

        ChatMessageDTO dto5 = new ChatMessageDTO();
        dto5.setMessage("hello chat 5");

        ChatMessageDTO dto6 = new ChatMessageDTO();
        dto6.setMessage("hello chat 6");

        list.add(dto);
        list.add(dto2);
        list.add(dto3);
        list.add(dto4);
        list.add(dto5);
        list.add(dto6);

        return list;
    }

}
