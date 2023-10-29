package com.chat.chatapp.domain.chat.controller;

import com.chat.chatapp.domain.chat.dto.Greeting;
import com.chat.chatapp.domain.chat.dto.HelloMessage;
import lombok.extern.slf4j.Slf4j;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.HtmlUtils;

@Slf4j
@RestController
public class GreetingController {

    @MessageMapping("/hello")
    @SendTo("/topic/greetings")
    public HelloMessage greeting(HelloMessage message) throws Exception {
        Thread.sleep(1000); // simulated delay
        log.info(message.toString());
//        return new Greeting(
//                        message.getMessage()
//                        , message.getClientId()
//                        , message.getUserAnimal()
//                        , message.getEmoticon()
//                        , message.getPubTime()
//                            );
        return message;
    }

}
