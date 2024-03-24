package com.memo.project.domain.sign.repository;

import com.memo.project.domain.sign.dto.User;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Transactional
@Repository
public interface SignRepository extends JpaRepository<User, Long> {
    boolean existsByEmail(String email);

    boolean existsByNick(String nick);

    User findByEmail(String email);
}
