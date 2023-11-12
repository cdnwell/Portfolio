package com.chat.chatapp.domain.chat.controller;

import com.chat.chatapp.domain.chat.entity.User;
import com.chat.chatapp.domain.chat.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {
    private final UserService userService;

    @PostMapping
    public Map<String, Object> registerUser(@RequestBody User user) {
        Map<String, Object> result = new HashMap<>();
        userService.registerUser(user, result);
        return result;
    }

    @GetMapping
    public Map<String, Object> selectUser() {
        return null;
    }

    @PostMapping("/signIn")
    public Map<String, Object> signInUser(@RequestBody String id, @RequestBody String pw) {
        Map<String, Object> result = new HashMap<>();
        log.info("id : {}, pw : {}", id, pw);
        userService.signInUser(id, pw, result);
        return result;
    }

}
