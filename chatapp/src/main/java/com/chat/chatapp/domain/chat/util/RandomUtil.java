package com.chat.chatapp.domain.chat.util;

import com.chat.chatapp.domain.chat.enums.RandomEnum;
import org.springframework.stereotype.Component;

import java.util.UUID;

@Component
public class RandomUtil {

    public String randomFileName(RandomEnum randomEnum) {
        return prefixSetter(randomEnum) + randomUUIDString();
    }

    private String prefixSetter(RandomEnum randomEnum) {
        switch (randomEnum) {
            case IMAGE:
                return "img_";
            default:
                return "";
        }
    }

    private String randomUUIDString() {
        return UUID
                .randomUUID()
                .toString()
                .replace("-", "")
                .substring(0, 24);
    }

}
