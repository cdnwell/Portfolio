package com.chat.chatapp.domain.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    @RequestMapping({ "", "/" })
    public String home() {
        return "/react/index";
    }

}
