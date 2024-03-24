package com.memo.project.domain.sign.dto;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.*;

@Entity
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(name = "user_info")
@ToString
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @SequenceGenerator(name = "user_info_seq", allocationSize = 1)
    private Long userSeq;

    @NotBlank(message = "이메일을 입력해주세요")
    @Email
    @Column(name = "user_email", length = 320)
    private String email;

    @NotBlank(message = "비밀번호를 입력해주세요")
    @Size(min = 6, max = 20, message = "비밀번호는 6 ~ 20자로 입력해주세요.")
    @Column(name = "user_pw", length = 20)
    private String pw;

    @NotBlank(message = "닉네임을 입력해주세요.")
    @Size(min = 2, max = 10, message = "닉네임은 2 ~ 10자로 입력해주세요")
    @Column(name = "user_nick", length = 10)
    private String nick;
}
