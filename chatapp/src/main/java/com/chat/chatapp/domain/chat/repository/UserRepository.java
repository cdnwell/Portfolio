package com.chat.chatapp.domain.chat.repository;

import com.chat.chatapp.domain.chat.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByIdAndPw(String id, String pw);
}
