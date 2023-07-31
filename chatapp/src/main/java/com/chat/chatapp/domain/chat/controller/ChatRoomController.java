package com.chat.chatapp.domain.chat.controller;

import com.chat.chatapp.domain.chat.dto.ChatRoom;
import com.chat.chatapp.domain.chat.repository.ChatRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Slf4j
@RequiredArgsConstructor
@RestController
public class ChatRoomController {
//    private final ChatRepository repository;

    // "/"로 요청 -> 전체 채팅방 리스트 담아서 return
    @GetMapping("/")
    public List<ChatRoom> chatRoomList(Model model) {
//        List<ChatRoom> list =  repository.findAllRoom();

        return null;
    }

    // 채팅방 생성 (리스트로 리다이렉트)
//    @PostMapping("/chat/createroom")
//    public String createRoom(@RequestParam String roomName, RedirectAttributes rttr) {
//        ChatRoom chatRoom = repository.createChatRoom(roomName);
//        log.info("create chat room : {}", chatRoom);
//
//        rttr.addFlashAttribute("roomName", chatRoom);
//
//        return "redirect:/";
//    }
//
//    // 채팅방 입장 화면
//    // 파라미터로 넘어오는 roomId를 확인 후 해당 roomId를 기준으로
//    // 채팅방을 찾아서 클라이언트를 chat room으로 보낸다.
//    @GetMapping("/chat/joinroom")
//    public ChatRoom joinRoom(String roomId) {
//        log.info("room id : {}", roomId);
//        return repository.findByRoomId(roomId);
//    }
}
