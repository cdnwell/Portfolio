package com.chat.chatapp.domain.chat.service;

import com.chat.chatapp.domain.chat.entity.User;
import com.chat.chatapp.domain.chat.enums.ErrorEnum;
import com.chat.chatapp.domain.chat.enums.RandomEnum;
import com.chat.chatapp.domain.chat.enums.SuccessEnum;
import com.chat.chatapp.domain.chat.repository.UserRepository;
import com.chat.chatapp.domain.chat.util.RandomUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.Map;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;

    @Value("${user.image.path}")
    private String userImgFilePath;

    /**
     * 인수로 받은 base64image String을 업로드한다.
     * 파일 경로를 반환한다.
     * @param { String } base64Image
     * @returns { String } filePath
     */
    private String uploadImg(String base64Image) {
        byte[] imageBytes = Base64.getDecoder().decode(base64Image);

        RandomUtil randomUtil = new RandomUtil();
        String randomImgName = randomUtil.randomFileName(RandomEnum.IMAGE);

        // [주의]
        // 파일이 jpg임을 가정한다.
        String filePath = userImgFilePath + File.separator + randomImgName + ".jpg";
        Path path = Paths.get(filePath);
        Path imgPath = Paths.get(userImgFilePath);
        try {
            // 경로에 폴더가 없다면 만들어준다.
            if (!Files.exists(imgPath)) {
                Files.createDirectories(imgPath);
            }

            Files.write(path, imageBytes);
            return filePath;
        } catch (IOException e) {
            e.printStackTrace();
            return "";
        }
    }

    public void registerUser(User user, Map<String, Object> result) {
        boolean isImgExist = user.getImg().trim().length() != 0;
        String filePath = "";

        if(isImgExist) {
            String base64Image = user.getImg().split(",")[1];
            filePath = uploadImg(base64Image);
            user.setProf_img_path(filePath);
        }

        try {
            userRepository.save(user);

            result.put("msg", SuccessEnum.REGISTER.getMsg());
            result.put("code", SuccessEnum.REGISTER.getCode());
        } catch (Exception e) {
            e.printStackTrace();

            result.put("msg", ErrorEnum.REGISTER.getMsg());
            result.put("code", ErrorEnum.REGISTER.getCode());
        }

    }


    public void signInUser(String id, String pw, Map<String, Object> result) {
        log.info("sing in id :: {}, pw :: {}", id, pw);
        User user = userRepository.findByIdAndPw(id, pw);

        if (user != null) {
            result.put("msg", SuccessEnum.SIGN_IN.getMsg());
            result.put("code", SuccessEnum.SIGN_IN.getCode());
        } else {
            result.put("msg", ErrorEnum.SIGN_IN.getMsg());
            result.put("code", ErrorEnum.SIGN_IN.getCode());
        }
    }
}
