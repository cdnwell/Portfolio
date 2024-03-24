package com.memo.project.global.controller;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
public class HomeController {
    @GetMapping("/")
    public String home(HttpServletRequest req) {
        String ipAddr = req.getRemoteAddr();
        log.info("[log] ip address - {}", ipAddr);
        return "index";
    }
}
