package com.chat.chatapp.domain.chat.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping("/test")
    public String[] test() {
        return new String[] {"hello", "test"};
    }

}
