package com.memo.memoproject.domain.test.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
public class TestController {

    @RequestMapping("/api/test")
    public String test() {
        log.info("안녕, 로그@");
        System.out.println("안녕, 시스템 프린트.#");
        return "안녕, 테스트.";
    }
}
