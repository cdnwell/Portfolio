package com.chat.chatapp.domain.chat.entity;

import com.chat.chatapp.domain.chat.enums.AuthorityEnum;
import jakarta.persistence.*;
import lombok.Builder;
import lombok.Data;

@Entity
@Table(name = "user_info")
@SequenceGenerator(
        name = "user_generator",
        sequenceName = "user_info_seq",
        allocationSize = 1
)
@Data
@Builder
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "user_generator")
    private Long seq;
    @Column(length = 15, unique = true, nullable = false)
    private String id;
    @Column(length = 20, nullable = false)
    private String pw;
    @Column(length = 15)
    private String nick;
    private String prof_img_path;
    private AuthorityEnum authority;

    @Transient
    private String img;
}
