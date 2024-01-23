package com.memo.project.domain.signup.repository;

import com.memo.project.domain.signup.dto.User;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Transactional
@Repository
public interface SignUpRepository extends JpaRepository<User, Long> {
    boolean existsByEmail(String email);
}
